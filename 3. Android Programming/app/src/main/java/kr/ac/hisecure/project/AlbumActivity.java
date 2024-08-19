package kr.ac.hisecure.project;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ViewFlipper;

public class AlbumActivity extends Activity {
    Button btnLeft, btnRight;
    ViewFlipper vFlipper;
    int albIvId [] = {R.id.albIv1, R.id.albIv2, R.id.albIv3, R.id.albIv4};
    LinearLayout album1, album2, album3, album4;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.album);
        setTitle("음악 활동");

        btnLeft = (Button)findViewById(R.id.btnLeft);
        btnRight = (Button)findViewById(R.id.btnRight);
        vFlipper = (ViewFlipper)findViewById(R.id.vFlipper);
        album1 = (LinearLayout)findViewById(R.id.album1);
        album2 = (LinearLayout)findViewById(R.id.album2);
        album3 = (LinearLayout)findViewById(R.id.album3);
        album4 = (LinearLayout)findViewById(R.id.album4);

        btnLeft.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                vFlipper.showPrevious();
            }
        });
        btnRight.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                vFlipper.showNext();
            }
        });
        album1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://music.naver.com/album/index.nhn?albumId=1614"));
                startActivity(intent);
            }
        });
        album2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://music.naver.com/album/index.nhn?albumId=406058"));
                startActivity(intent);
            }
        });
        album3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://music.naver.com/album/index.nhn?albumId=521158"));
                startActivity(intent);
            }
        });
        album4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://music.naver.com/album/index.nhn?albumId=637451"));
                startActivity(intent);
            }
        });
    }
}
