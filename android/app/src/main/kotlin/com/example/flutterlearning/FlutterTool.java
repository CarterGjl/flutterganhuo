package com.example.flutterlearning;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.BinaryMessenger;

@SuppressWarnings("unused")
public class FlutterTool {
    public static final String ENGINE_ID = "default_engine_id";
    public static final String METHOD_CHANNEL = "com.baidu.hi.ruliu";

    private static FlutterEngine sFlutterEngine;

    @SuppressLint("StaticFieldLeak") // 有方法释放
    private static Activity sActivity;

    public static void preWarmFlutterEngine(Context context) {
        if (sFlutterEngine == null) {
            sFlutterEngine = new FlutterEngine(context);
            sFlutterEngine.getDartExecutor()
                    .executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault());
            FlutterEngineCache.getInstance().put(ENGINE_ID, sFlutterEngine);
            sActivity = (Activity) context;
        }
    }

    public static FlutterEngine getFlutterEngine() {
        return sFlutterEngine;
    }

    public static BinaryMessenger getBinaryMessenger() {
        return sFlutterEngine.getDartExecutor().getBinaryMessenger();
    }

    public static Activity getActivity() {
        return sActivity;
    }

    public static void destroyEngine() {
        if (sFlutterEngine != null) {
            sFlutterEngine.destroy();
            sFlutterEngine = null;
        }
        if (sActivity != null) {
            sActivity = null;
        }
    }
}
