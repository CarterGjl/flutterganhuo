package com.example.flutterlearning;

import io.flutter.embedding.engine.FlutterEngine;

public class Tcp2Flutter implements Pigeon.TCP2Flutter.Reply<Void> {

    static Pigeon.TCP2Flutter tcp2Flutter;
    private static Tcp2Flutter sInstance;

    private Tcp2Flutter() {
        
    }

    public void init(FlutterEngine flutterEngine){
        if (tcp2Flutter == null) {
            tcp2Flutter = new Pigeon.TCP2Flutter(
                    flutterEngine.getDartExecutor()
                            .getBinaryMessenger());
        }
    }
    public static synchronized Tcp2Flutter getInstance(
            ) {
        if (sInstance == null) {
            sInstance = new Tcp2Flutter();
        }
        return sInstance;
    }

    public void onTCPResponse(Pigeon.BaseResponse argInput) {
        tcp2Flutter.onTCPResponse(argInput,
                this);
    }

    @Override
    public void reply(Void reply) {

    }
}
