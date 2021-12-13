package com.example.flutterlearning;

import android.util.Log;

@SuppressWarnings("unused")
public class Host2FlutterApi implements Pigeon.Api2Flutter.Reply<Void>{
    public static final String EVENT_START_CONNECT_SUCCESS = "start_connect_success";
    public static final String EVENT_START_CONNECT_ERROR_CODE = "start_connect_error_code";
    public static final String EVENT_START_CONNECT_ERROR_INVALID_NET = "start_connect_error_invalid_net";
    public static final String EVENT_CONNECT_FAILED = "start_connect_failed";
    public static final String EVENT_CONNECT_SUCCESS = "start_connect_success";
    public static final String EVENT_GET_SUGGESTION_DEVICE_FEEDBACK = "get_suggestion_device_feedback";
    public static final String EVENT_GET_SUGGESTION_MEETING_FEEDBACK = "get_suggestion_meeting_feedback";

    private static final String TAG = "Host2FlutterApi";

    static Host2FlutterApi sInstance = null;
    static Pigeon.Api2Flutter sApi2Flutter = null;

    private Host2FlutterApi() {
        if (sApi2Flutter == null) {
            sApi2Flutter = new Pigeon.Api2Flutter(
                    FlutterTool.getFlutterEngine().getDartExecutor()
                    .getBinaryMessenger());
        }
    }

    public static synchronized Host2FlutterApi getInstance() {
        if (sInstance == null) {
            sInstance = new Host2FlutterApi();
        }
        return sInstance;
    }

    public void toFlutterMessage(Pigeon.CallbackMessage argInput) {
        FlutterTool.getActivity().runOnUiThread(() -> sApi2Flutter.toFlutterMessage(argInput, Host2FlutterApi.this));
    }

    @Override
    public void reply(Void reply) {
        Log.d(TAG, "reply");
    }
}
