
import '../pigeon.dart';

class BaseWrapperCommand extends BaseCommand {
  int? seq;
  String? command;
  Map<String?, String?>? commandHead = Map();
  String? superCommand;
  String? version;
  double? delayInMillis;
  double? timeoutInMillis;
  String? commandBody;

  BaseWrapperCommand(this.command, this.superCommand, this.version,
      {this.seq = null,
      this.delayInMillis = 0,
      this.timeoutInMillis = 5000,
      this.commandBody}){
    this.commandBody = createCommandBody();
  }

  void addCommandHead(String key, String value) {
    commandHead![key] = value;
  }
  void setCommandBody(String commandBody) {
    this.commandBody = commandBody;
  }

  String? createCommandBody() {
    return null;
  }

  @override
  String toString() {
    return 'BaseWrapperCommand{seq: $seq, command: $command, commandHead: $commandHead, superCommand: $superCommand, version: $version, delayInMillis: $delayInMillis, timeoutInMillis: $timeoutInMillis, commandBody: $commandBody}';
  }
}
