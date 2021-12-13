package com.example.flutterlearning;

import android.util.Log;
import io.flutter.embedding.engine.FlutterEngine;

public class Tcp2HostApi implements Pigeon.TCP2Host {

    private static final String TAG = "Tcp2HostApi";

    private Tcp2HostApi(FlutterEngine flutterEngine) {
        Pigeon.TCP2Host.setup(flutterEngine.getDartExecutor().getBinaryMessenger(), this);
    }

    private static Tcp2HostApi sInstance;

    @Override
    public void sendCommand(Pigeon.BaseCommand baseCommand) {
        if (baseCommand.getSeq() == null) {
            throw new RuntimeException("Seq = null");
        }
        Log.d(TAG, "sendCommand: " + baseCommand);
        Pigeon.BaseResponse baseResponse = new Pigeon.BaseResponse();
        baseResponse.setCommand(baseCommand.getCommand());
        baseResponse.setSuperCommand(baseCommand.getSuperCommand());
        baseResponse.setContentType("text");
        baseResponse.setCode(1L);
        baseResponse.setType("A");
        baseResponse.setSeq(baseCommand.getSeq());
        baseResponse.setResponseHead(baseCommand.getCommandHead());
        baseResponse.setContentLength(11111L);
        baseResponse.setVersion(baseCommand.getVersion());
        baseResponse.setCommandBody(baseCommand.getCommandBody());
        Tcp2Flutter.getInstance().onTCPResponse(baseResponse);
    }

    @Override
    public Long getCommandSeq() {
        return (long) 1;
    }

    public static synchronized Tcp2HostApi getInstance(
            FlutterEngine flutterEngine) {
        if (sInstance == null) {
            sInstance = new Tcp2HostApi(flutterEngine);
        }
        return sInstance;
    }
    
}
