package com.example.flutterlearning;


@SuppressWarnings("unused")
public class Flutter2HostApi implements Pigeon.Api2Host {
    public static final String EVENT_GET_SUGGESTION_DEVICE = "get_suggestion_device";
    public static final String EVENT_GET_SUGGESTION_MEETING = "get_suggestion_meeting";
    public static final String EVENT_START_CONNECT = "start_connect";
    public static final String EVENT_SCAN_QRCODE = "scan_qrcode";
    public static final String EVENT_OPEN_HELP_PAGE = "open_help_page";
    public static final String EVENT_GO_BACK = "go_back";
    public static final String EVENT_WIRELESS_SCREEN = "wireless_screen";
    public static final String EVENT_CREATE_VIDEO_MEETING = "create_video_meeting";
    public static final String EVENT_JOIN_VIDEO_MEETING = "join_video_meeting";
    public static final String EVENT_LOG = "log";


    @Override
    public void toHostMessage(Pigeon.SendMessage message) {
    }

    static Flutter2HostApi sInstance;

    private Flutter2HostApi() {
        Pigeon.Api2Host.setup(FlutterTool.getBinaryMessenger(), this);
    }

    public static synchronized Flutter2HostApi getInstance() {
        if (sInstance == null) {
            sInstance = new Flutter2HostApi();
        }
        return sInstance;
    }
}
