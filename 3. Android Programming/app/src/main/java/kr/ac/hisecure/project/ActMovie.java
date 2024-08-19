package kr.ac.hisecure.project;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.TextView;

public class ActMovie extends Activity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.act_movie);
        setTitle("영화 활동");

        TextView actmv1, actmv2, actmv3, actmv4, actmv5, actmv6, actmv7, actmv8, actmv9, actmv10, actmv11, actmv12;

        actmv1 = (TextView)findViewById(R.id.actmv1);
        actmv2 = (TextView)findViewById(R.id.actmv2);
        actmv3 = (TextView)findViewById(R.id.actmv3);
        actmv4 = (TextView)findViewById(R.id.actmv4);
        actmv5 = (TextView)findViewById(R.id.actmv5);
        actmv6 = (TextView)findViewById(R.id.actmv6);
        actmv7 = (TextView)findViewById(R.id.actmv7);
        actmv8 = (TextView)findViewById(R.id.actmv8);
        actmv9 = (TextView)findViewById(R.id.actmv9);
        actmv10 = (TextView)findViewById(R.id.actmv10);
        actmv11 = (TextView)findViewById(R.id.actmv11);
        actmv12 = (TextView)findViewById(R.id.actmv12);

        actmv1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=174250"));
                startActivity(intent);
            }
        });
        actmv2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=140010"));
                startActivity(intent);
            }
        });
        actmv3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=139700"));
                startActivity(intent);
            }
        });
        actmv4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=93079"));
                startActivity(intent);
            }
        });
        actmv5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=83214"));
                startActivity(intent);
            }
        });
        actmv6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=68580"));
                startActivity(intent);
            }
        });
        actmv7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=72960"));
                startActivity(intent);
            }
        });
        actmv8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=51318"));
                startActivity(intent);
            }
        });
        actmv9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=50189"));
                startActivity(intent);
            }
        });
        actmv10.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=52365"));
                startActivity(intent);
            }
        });
        actmv11.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=45529"));
                startActivity(intent);
            }
        });
        actmv12.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://movie.naver.com/movie/bi/mi/basic.nhn?code=52364"));
                startActivity(intent);
            }
        });
    }
}
