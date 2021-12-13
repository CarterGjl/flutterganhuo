import 'package:flutterlearning/pigeon.dart';

extension BaseWrapperResponse on BaseResponse{

  String toLog() {
    return 'BaseResponse{seq: $seq, command: $command, responseHead: '
        '$responseHead, superCommand: $superCommand, version: $version ,'
        'commandBody $commandBody}';
  }
}