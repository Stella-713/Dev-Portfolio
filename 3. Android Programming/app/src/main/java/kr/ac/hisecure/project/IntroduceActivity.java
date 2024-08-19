package kr.ac.hisecure.project;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
//import android.support.annotation.Nullable;
import android.view.View;
import android.widget.Button;

public class IntroduceActivity extends Activity {
    @Override
    protected void onCreate(/*@Nullable*/ Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.introduce);
        setTitle("서현진");

        Button btnReturn = (Button)findViewById(R.id.btnReturn);
        //Intent intent = getIntent();
        btnReturn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}
