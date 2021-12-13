package com.example.flutterlearning;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.core.view.WindowCompat;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterActivityLaunchConfigs;
import io.flutter.embedding.engine.FlutterEngine;

public class SingleFlutterActivity extends FlutterActivity implements EngineBindingsDelegate {

    EngineBindings engineBindings = null;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
        overridePendingTransition(R.anim.activity_open,0);

        engineBindings = new EngineBindings(this, this, "main");
        engineBindings.attach();

    }


    @Override
    public void onDestroy() {
        engineBindings.detach();
        super.onDestroy();
    }

    @Override
    public void onNext() {
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }

    @NonNull
    @Override
    public String getDartEntrypointFunctionName() {
        return "main";
    }

    @NonNull
    @Override
    public String getInitialRoute() {
        Intent intent = getIntent();
        String action = intent.getAction();

        if (action != null && action.equals("meeting_feedback")) {
            return intent.getStringExtra("route");
        } else {
            return "/";
        }
    }

    @Override
    protected void onNewIntent(@NonNull Intent intent) {
        Intent intent1 = getIntent();
        String action = intent1.getAction();

        FlutterEngine engine = getFlutterEngine();
        boolean routeIntent = action != null && action.equals("meeting_feedback");

        if (routeIntent && engine != null) {
            engine.getNavigationChannel().pushRoute(intent.getStringExtra("route"));
        }
    }

    @Override
    public void finish() {
        super.finish();
        overridePendingTransition(R.anim.activity_end,0);
    }

    @NonNull
    @Override
    protected FlutterActivityLaunchConfigs.BackgroundMode getBackgroundMode() {
        return FlutterActivityLaunchConfigs.BackgroundMode.transparent;
    }

}
