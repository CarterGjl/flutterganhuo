import 'dart:async';

import '../pigeon.dart';


Map<int, Completer<BaseResponse>> _map = Map();

TCP2Host _tcp2host = TCP2Host();

class TcpChannel {
  static void initTcpChannel() {
    TCP2Flutter.setup(_Tcp2FlutterImpl());
  }

  static Future<BaseResponse> sendCommand(BaseCommand message) async {
    var seq = await _tcp2host.getCommandSeq();
    message.seq = seq;

    _tcp2host.sendCommand(message);
    var completer = Completer<BaseResponse>();
    _map[seq] = completer;
    var future = completer.future;
    print('sendCommand $message');
    return future.timeout(
      Duration(
        milliseconds: (message.timeoutInMillis ?? 0).toInt(),
      ),
      onTimeout: () {
        _map.remove(completer);
        return Future.error("sendCommand onTimeout");
      },
    );
  }
}

class _Tcp2FlutterImpl extends TCP2Flutter {
  @override
  void onTCPResponse(BaseResponse message) {
    var completer = _map[message.seq];
    if (completer == null) {
      // envent bus
      return;
    }
    _map.remove(completer);
    completer.complete(message);
  }
}
