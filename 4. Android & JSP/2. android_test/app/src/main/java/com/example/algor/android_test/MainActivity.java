package com.example.algor.android_test;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.AppOpsManager;
import android.app.usage.UsageStats;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Environment;
import android.os.StrictMode;
import android.provider.Settings;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.app.usage.UsageStatsManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;




public class MainActivity extends AppCompatActivity {

    File tempFile = null;
    File tempFile2 = null;
    File storage = null;
    String fileName = null;
    String filePath2 = null;

    Button usageBtn,testBtn;
    TextView tView;

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    private boolean isAccessGranted(){
        try{
            PackageManager packageManager = getPackageManager();
            ApplicationInfo applicationInfo = packageManager.getApplicationInfo(getPackageName(),0);
            AppOpsManager appOpsManager = (AppOpsManager) getSystemService(Context.APP_OPS_SERVICE);
            int mode = 0;
            if(android.os.Build.VERSION.SDK_INT > android.os.Build.VERSION_CODES.KITKAT){
                mode = appOpsManager.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, applicationInfo.uid,applicationInfo.packageName);
            }
            return (mode == AppOpsManager.MODE_ALLOWED);

        }catch (PackageManager.NameNotFoundException e){
            return false;
        }

    }





    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder()
                .permitDiskReads()
                .permitDiskWrites()
                .permitNetwork().build());

        setTitle("SAM");

        usageBtn = (Button)findViewById(R.id.usageBtn);


        usageBtn.setOnClickListener(new View.OnClickListener() {
            @SuppressLint("MissingPermission")
            @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
            @Override
            public void onClick(View v) {

                if (!isAccessGranted()) {
                    Intent intent = new Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS);
                    startActivity(intent);
                }

                String App_name = ""; // 어플 이름

                UsageStatsManager usageStatsManager = (UsageStatsManager) getSystemService(Context.USAGE_STATS_SERVICE);

                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.YEAR, -1);

                final List<UsageStats> queryUsageStats = usageStatsManager.queryUsageStats(UsageStatsManager.INTERVAL_YEARLY, cal.getTimeInMillis(), System.currentTimeMillis());

                Runtime runtime = Runtime.getRuntime();
                Process process;
                String res = "-0-";

                try {
                    filePath2 = getApplicationContext().getFilesDir().getPath().toString() + "/cpuSys.txt";
                    File dumFIle = new File(filePath2);
                    if(dumFIle != null){
                        dumFIle.delete();
                    }

                    Log.i("filePath : " ,filePath2);

                    String cmd = "top -n 1";
                    process = runtime.exec(cmd);
                    BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(),"UTF-8"));
                    String line ;
                    while ((line = br.readLine()) != null) {
                        Log.i("imtest",line);
                        try {
                            BufferedWriter buf = new BufferedWriter(new FileWriter(filePath2,true));
                            buf.append(line);
                            buf.newLine();
                            buf.close();
                        } catch(IOException e) {
                            Log.i("Exception : ",e.getMessage());
                        }
                    }
                } catch (Exception e) {
                    Log.i("Exception : ",e.getMessage());
                }


                if (queryUsageStats != null) {

                    SortedMap<Long, UsageStats> runningTask = new TreeMap<Long, UsageStats>();

                    for (UsageStats usageStats : queryUsageStats) {
                        runningTask.put(usageStats.getLastTimeUsed(), usageStats);

                        //패키지 이름으로 App 이름 가져오기
                        try {
                            App_name = getPackageManager().getApplicationLabel
                                    (getPackageManager().getApplicationInfo
                                            (usageStats.getPackageName(), PackageManager.GET_UNINSTALLED_PACKAGES)).toString();

                        } catch (PackageManager.NameNotFoundException e) {
                            e.printStackTrace();
                        }
                        Log.i("어플 이름 : ", App_name);
                        Log.i("시간 : ", String.valueOf(usageStats.getTotalTimeInForeground()));
                        Log.i("packageName : ", usageStats.getPackageName());

                        String sendMsg = "";
                        String str, receiveMsg;

                        String PhoneNum = "";
                        TelephonyManager telManager = (TelephonyManager) getSystemService(TELEPHONY_SERVICE);
                        PhoneNum = telManager.getLine1Number();

                        if (PhoneNum.startsWith("+82")) {
                            PhoneNum = PhoneNum.replace("+82", "0");
                        }


                        String ip = "http://192.168.35.2:8080";
                        //String ip = "http://172.20.10.2:8080";
                        //String ip = "http://192.168.219.103:8080";



                        try {

                            // 접속할 서버 주소 (이클립스에서 android.jsp 실행시 웹브라우저 주소)
                            URL url = new URL(ip + "/android/androidDB");

                            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                            conn.setRequestMethod("POST");
                            OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());

                            // 전송할 데이터. GET 방식으로 작성

                            sendMsg = "appName=" + App_name + "&appTime=" + String.valueOf(usageStats.getTotalTimeInForeground()) + "&PhoneNum=" + PhoneNum;

                            osw.write(sendMsg);
                            osw.flush();

                            //jsp와 통신 성공 시 수행
                            if (conn.getResponseCode() == conn.HTTP_OK) {
                                InputStreamReader tmp = new InputStreamReader(conn.getInputStream(), "UTF-8");
                                BufferedReader reader = new BufferedReader(tmp);
                                StringBuffer buffer = new StringBuffer();

                                // jsp에서 보낸 값을 받는 부분
                                while ((str = reader.readLine()) != null) {
                                    buffer.append(str);
                                }
                                receiveMsg = buffer.toString();
                            } else {
                                // 통신 실패
                            }
                        } catch (MalformedURLException e) {
                            e.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }


                        try {
                            Drawable icon = getPackageManager().getApplicationIcon(usageStats.getPackageName());

                            Bitmap icon_bitmap = Bitmap.createBitmap(icon.getIntrinsicWidth(), icon.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);

                            Canvas canvas = new Canvas(icon_bitmap);
                            icon.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
                            icon.draw(canvas);

                            //내부저장소 캐시 경로를 받아옵니다.
                            storage = getCacheDir();

                            //저장할 파일 이름
                            fileName = App_name + ".png";

                            //storage 에 파일 인스턴스를 생성합니다.
                            tempFile = new File(storage, fileName);

                            try {

                                // 자동으로 빈 파일을 생성합니다.
                                tempFile.createNewFile();

                                // 파일을 쓸 수 있는 스트림을 준비합니다.
                                FileOutputStream out = new FileOutputStream(tempFile);
                                Log.i("path : ", tempFile.getPath());

                                // compress 함수를 사용해 스트림에 비트맵을 저장합니다.
                                icon_bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
                                Log.i("icon_bitmap", String.valueOf(icon_bitmap));

                                // 스트림 사용후 닫아줍니다.
                                out.close();

                            } catch (FileNotFoundException e) {
                                Log.e("MyTag", "FileNotFoundException : " + e.getMessage());
                            } catch (IOException e) {
                                Log.e("MyTag", "IOException : " + e.getMessage());
                            }


                        } catch (PackageManager.NameNotFoundException e) {
                            e.printStackTrace();
                        }

                        String serverURL = ip + "/android/test";  //<<서버주소
                        String lineEnd = "\r\n";
                        String twoHyphens = "--";
                        String boundary = "*****";
                        String filePath = tempFile.getPath();
                        Log.e("filePath : ", filePath);

                        try {
                            FileInputStream mFileInputStream = new FileInputStream(filePath);
                            URL connectUrl = new URL(serverURL);

                            // HttpURLConnection 통신
                            HttpURLConnection conn = (HttpURLConnection) connectUrl.openConnection();
                            conn.setDoInput(true);
                            conn.setDoOutput(true);
                            conn.setUseCaches(false);
                            conn.setRequestMethod("POST");
                            conn.setRequestProperty("Connection", "Keep-Alive");
                            conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);

                            // write data
                            DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
                            dos.writeBytes(twoHyphens + boundary + lineEnd);
                            dos.write(("Content-Disposition: form-data;name=\"uploadedfile\";filename=\"" + filePath + "\"" + lineEnd).getBytes("UTF-8"));
                            //appName=\""+App_name+"\";appTime=\""+Integer.parseInt(String.valueOf(usageStats.getTotalTimeInForeground()))+"\"" + lineEnd);
                            dos.writeBytes(lineEnd);
                            Log.e("AppName , filePath", filePath + App_name);

                            int bytesAvailable = mFileInputStream.available();
                            int maxBufferSize = 1024;
                            int bufferSize = Math.min(bytesAvailable, maxBufferSize);

                            byte[] buffer = new byte[bufferSize];
                            int bytesRead = mFileInputStream.read(buffer, 0, bufferSize);

                            Log.d("Test", "image byte is " + bytesRead);

                            // read image
                            while (bytesRead > 0) {
                                dos.write(buffer, 0, bufferSize);
                                bytesAvailable = mFileInputStream.available();
                                bufferSize = Math.min(bytesAvailable, maxBufferSize);
                                bytesRead = mFileInputStream.read(buffer, 0, bufferSize);
                            }

                            dos.writeBytes(lineEnd);
                            dos.writeBytes(twoHyphens + boundary + twoHyphens + lineEnd);

                            // close streams
                            Log.e("Test", "File is written");
                            mFileInputStream.close();
                            dos.flush();
                            // finish upload...

                            // get response
                            InputStream is = conn.getInputStream();

                            StringBuffer b = new StringBuffer();
                            for (int ch = 0; (ch = is.read()) != -1; ) {
                                b.append((char) ch);
                            }
                            is.close();
                            Log.e("Test", b.toString());


                        } catch (Exception e) {
                            e.printStackTrace();

                            Log.d("Test", "exception " + e.getMessage());
                            // TODO: handle exception
                        }


                    }

                }

                String ip = "http://192.168.35.2:8080";
                String serverURL = ip + "/android/test";  //<<서버주소
                String lineEnd = "\r\n";
                String twoHyphens = "--";
                String boundary = "*****";
                try {
                    FileInputStream mFileInputStream = new FileInputStream(filePath2);
                    URL connectUrl = new URL(serverURL);

                    // HttpURLConnection 통신
                    HttpURLConnection conn = (HttpURLConnection) connectUrl.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(true);
                    conn.setUseCaches(false);
                    conn.setRequestMethod("POST");
                    conn.setRequestProperty("Connection", "Keep-Alive");
                    conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);

                    // write data
                    DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
                    dos.writeBytes(twoHyphens + boundary + lineEnd);
                    //dos.write(("Content-Disposition: form-data;name=\"uploadedfile\";filename=\"" + filePath + "\"" + lineEnd).getBytes("UTF-8"));
                    dos.write(("Content-Disposition: form-data;name=\"uploadedfile\";filename=\"" + filePath2 + "\"" + lineEnd).getBytes("UTF-8"));
                    //appName=\""+App_name+"\";appTime=\""+Integer.parseInt(String.valueOf(usageStats.getTotalTimeInForeground()))+"\"" + lineEnd);
                    dos.writeBytes(lineEnd);

                    int bytesAvailable = mFileInputStream.available();
                    int maxBufferSize = 1024;
                    int bufferSize = Math.min(bytesAvailable, maxBufferSize);

                    byte[] buffer = new byte[bufferSize];
                    int bytesRead = mFileInputStream.read(buffer, 0, bufferSize);

                    Log.d("Test", "image byte is " + bytesRead);

                    // read image
                    while (bytesRead > 0) {
                        dos.write(buffer, 0, bufferSize);
                        bytesAvailable = mFileInputStream.available();
                        bufferSize = Math.min(bytesAvailable, maxBufferSize);
                        bytesRead = mFileInputStream.read(buffer, 0, bufferSize);
                    }

                    dos.writeBytes(lineEnd);
                    dos.writeBytes(twoHyphens + boundary + twoHyphens + lineEnd);

                    // close streams
                    Log.e("Test", "File is written");
                    mFileInputStream.close();
                    dos.flush();
                    // finish upload...

                    // get response
                    InputStream is = conn.getInputStream();

                    StringBuffer b = new StringBuffer();
                    for (int ch = 0; (ch = is.read()) != -1; ) {
                        b.append((char) ch);
                    }
                    is.close();
                    Log.e("Test", b.toString());


                } catch (Exception e) {
                    e.printStackTrace();

                    Log.d("Test", "exception " + e.getMessage());
                    // TODO: handle exception
                }


            }
        });




    }






}