// import 'package:xml/xml.dart' as xml;
import 'BaseWrapperCommand.dart';

class ConfigGetDynamicCommand extends BaseWrapperCommand {
  static final String SUPER_COMMAND = "config";
  static final String METHOD = "get_dynamic_config";

  static final List<String> CONFIG_ITEMS = List.from([
    "pstn",
    "voip_invite_meeting",
    "voip_hard_code",
    "voip_client_record_setting",
    "voip_sync_key_settings",
    "msg_cancel",
    "relay",
    "luckymoney",
    "f2f",
    "unitysearch",
    "groupfile",
    "bos",
    "voip",
    "hchat",
    "risk_msg",
    "todo_settings",
    "file",
    "voip_show_recording_entry",
    "calendar",
    "hicore",
    "voip_live",
    "voip_ai_minutes_settings",
    "knowledgeurl_parsing",
    "banners",
    "abtest",
    "taskflow_card"
  ]);

  ConfigGetDynamicCommand() : super(METHOD, SUPER_COMMAND, "2.1") {
    addCommandHead("ctag", "C2C1A53DFD9F2300F1D08F4565777E97|1635753663");
    addCommandHead("uid", "3001849260");
    addCommandHead("client_version", "8,17,0,0_202111011559-37879ec");
  }
  
  @override
  String? createCommandBody() {
    // var builder = xml.XmlBuilder();
    StringBuffer stringBuilder = new StringBuffer();
    for (int i = 0; i < CONFIG_ITEMS.length - 1; i++) {
      stringBuilder..write(CONFIG_ITEMS[i])..write(",");
    }
    stringBuilder.write(CONFIG_ITEMS[CONFIG_ITEMS.length - 1]);
    var map = Map<String,String>();
    map["item"] = stringBuilder.toString();
    // builder.element("config",attributes: map);
    // return builder.buildDocument().toString();
    return stringBuilder.toString();
  }
}
