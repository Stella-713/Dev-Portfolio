package kr.ac.hisecure.project;

import android.content.Intent;
import android.net.Uri;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {
    SlidingAdapter adapter;
    ViewPager viewPager;
    Button btnInt, btnAlb, btnAct, btnSns;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("서현진");

        viewPager = (ViewPager)findViewById(R.id.view);
        adapter = new SlidingAdapter(this);
        viewPager.setAdapter(adapter);


        btnInt = (Button)findViewById(R.id.btnInt);
        btnAlb = (Button)findViewById(R.id.btnAlb);
        btnAct = (Button)findViewById(R.id.btnAct);
        btnSns = (Button)findViewById(R.id.btnSns);

        btnInt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),IntroduceActivity.class);
                startActivity(intent);
            }
        });
        btnAlb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),AlbumActivity.class);
                startActivity(intent);
            }
        });
        btnAct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),ActorActivity.class);
                startActivity(intent);
            }
        });
        btnSns.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intentSns = new Intent(Intent.ACTION_VIEW, Uri.parse("https://twitter.com/jini26991"));
                startActivity(intentSns);
            }
        });
    }
}
