package kr.ac.hisecure.project;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.TextView;

public class ActDrama extends Activity {
    TextView act1, act2, act3, act4, act5, act6, act7, act8, act9, act10, act11, act12, act13, act14, act15, act16;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.act_drama);
        setTitle("드라마 활동");

        act1 = (TextView)findViewById(R.id.act1);
        act2 = (TextView)findViewById(R.id.act2);
        act3 = (TextView)findViewById(R.id.act3);
        act4 = (TextView)findViewById(R.id.act4);
        act5 = (TextView)findViewById(R.id.act5);
        act6 = (TextView)findViewById(R.id.act6);
        act7 = (TextView)findViewById(R.id.act7);
        act8 = (TextView)findViewById(R.id.act8);
        act9 = (TextView)findViewById(R.id.act9);
        act10 = (TextView)findViewById(R.id.act10);
        act11 = (TextView)findViewById(R.id.act11);
        act12 = (TextView)findViewById(R.id.act12);
        act13 = (TextView)findViewById(R.id.act13);
        act14 = (TextView)findViewById(R.id.act14);
        act15 = (TextView)findViewById(R.id.act15);
        act16 = (TextView)findViewById(R.id.act16);

        act1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://tv.jtbc.joins.com/beautyinside"));
                startActivity(intent);
            }
        });
        act2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://programs.sbs.co.kr/drama/lovetemperature"));
                startActivity(intent);
            }
        });
        act3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://programs.sbs.co.kr/drama/doctorromantic"));
                startActivity(intent);
            }
        });
        act4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://program.tving.com/tvn/againoh"));
                startActivity(intent);
            }
        });
        act5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://program.tving.com/tvn/eat2?Main"));
                startActivity(intent);
            }
        });
        act6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://program.tving.com/tvn/3musketeers/"));
                startActivity(intent);
            }
        });
        act7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/festival/concept/"));
                startActivity(intent);
            }
        });
        act8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/perfume/"));
                startActivity(intent);
            }
        });
        act9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/firejung/"));
                startActivity(intent);
            }
        });
        act10.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/ohgo/"));
                startActivity(intent);
            }
        });
        act11.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/horsedoctor/"));
                startActivity(intent);
            }
        });
        act12.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/dinner/index.html"));
                startActivity(intent);
            }
        });
        act13.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/815264/cast/index.html"));
                startActivity(intent);
            }
        });
        act14.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/mate/"));
                startActivity(intent);
            }
        });
        act15.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.imbc.com/broad/tv/drama/hit/"));
                startActivity(intent);
            }
        });
        act16.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://search.naver.com/search.naver?where=nexearch&query=%EB%93%9C%EB%9D%BC%EB%A7%88+%ED%99%A9%EC%A7%84%EC%9D%B4&ie=utf8&sm=tab_she&qdt=0"));
                startActivity(intent);
            }
        });
    }
}
