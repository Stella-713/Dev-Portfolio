package kr.ac.hisecure.project;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;

public class ActorActivity extends Activity {
    @SuppressLint("ClickableViewAccessibility")
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actor);
        setTitle("연기 활동");

        TextView actDrama = (TextView)findViewById(R.id.actDrama);
        TextView actMovie = (TextView)findViewById(R.id.actMovie);

        actDrama.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),ActDrama.class);
                startActivity(intent);
            }
        });
        actMovie.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(),ActMovie.class);
                startActivity(intent);
            }
        });
    }
}
