package com.example.flutterlearning;

import android.app.Activity;
import io.flutter.FlutterInjector;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineGroup;
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint;
import io.flutter.plugin.common.MethodChannel;

public class EngineBindings {
    MethodChannel channel;
    FlutterEngine engine;
    public EngineBindingsDelegate delegate;

    public EngineBindings(Activity activity, EngineBindingsDelegate delegate1, String entryPoint) {
        DartEntrypoint dartEntrypoint = new DartEntrypoint(FlutterInjector.instance().flutterLoader().findAppBundlePath(), entryPoint);
        FlutterEngineGroup engineGroup = new FlutterEngineGroup(activity);
        engine = engineGroup.createAndRunEngine(activity, dartEntrypoint);

        delegate = delegate1;
        channel = new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), "multiple-flutters");
    }

    void attach() {
        channel.setMethodCallHandler((call, result) -> {
            switch (call.method) {
                case "incrementCount":
                    result.success(null);
                    break;
                case "next":
                    delegate.onNext();
                    result.success(null);
                    break;
                default:
                    result.notImplemented();
            }
        });
    }

    void detach() {
        channel.setMethodCallHandler(null);
    }

}
