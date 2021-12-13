package com.example.flutterlearning;

import java.util.HashMap;

@SuppressWarnings("unused")
public interface FlutterCallback {
    void onEvent(String event, HashMap<String,String> params);
}
