// Autogenerated from Pigeon (v1.0.8), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.example.flutterlearning;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class SendMessage {
    private String event;
    public String getEvent() { return event; }
    public void setEvent(String setterArg) { this.event = setterArg; }

    private String params;
    public String getParams() { return params; }
    public void setParams(String setterArg) { this.params = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("event", event);
      toMapResult.put("params", params);
      return toMapResult;
    }
    static SendMessage fromMap(Map<String, Object> map) {
      SendMessage fromMapResult = new SendMessage();
      Object event = map.get("event");
      fromMapResult.event = (String)event;
      Object params = map.get("params");
      fromMapResult.params = (String)params;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class CallbackMessage {
    private String event;
    public String getEvent() { return event; }
    public void setEvent(String setterArg) { this.event = setterArg; }

    private String params;
    public String getParams() { return params; }
    public void setParams(String setterArg) { this.params = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("event", event);
      toMapResult.put("params", params);
      return toMapResult;
    }
    static CallbackMessage fromMap(Map<String, Object> map) {
      CallbackMessage fromMapResult = new CallbackMessage();
      Object event = map.get("event");
      fromMapResult.event = (String)event;
      Object params = map.get("params");
      fromMapResult.params = (String)params;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class BaseCommand {
    private Long seq;
    public Long getSeq() { return seq; }
    public void setSeq(Long setterArg) { this.seq = setterArg; }

    private String command;
    public String getCommand() { return command; }
    public void setCommand(String setterArg) { this.command = setterArg; }

    private Map<String, String> commandHead;
    public Map<String, String> getCommandHead() { return commandHead; }
    public void setCommandHead(Map<String, String> setterArg) { this.commandHead = setterArg; }

    private String superCommand;
    public String getSuperCommand() { return superCommand; }
    public void setSuperCommand(String setterArg) { this.superCommand = setterArg; }

    private String version;
    public String getVersion() { return version; }
    public void setVersion(String setterArg) { this.version = setterArg; }

    private Double delayInMillis;
    public Double getDelayInMillis() { return delayInMillis; }
    public void setDelayInMillis(Double setterArg) { this.delayInMillis = setterArg; }

    private Double timeoutInMillis;
    public Double getTimeoutInMillis() { return timeoutInMillis; }
    public void setTimeoutInMillis(Double setterArg) { this.timeoutInMillis = setterArg; }

    private String commandBody;
    public String getCommandBody() { return commandBody; }
    public void setCommandBody(String setterArg) { this.commandBody = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("seq", seq);
      toMapResult.put("command", command);
      toMapResult.put("commandHead", commandHead);
      toMapResult.put("superCommand", superCommand);
      toMapResult.put("version", version);
      toMapResult.put("delayInMillis", delayInMillis);
      toMapResult.put("timeoutInMillis", timeoutInMillis);
      toMapResult.put("commandBody", commandBody);
      return toMapResult;
    }
    static BaseCommand fromMap(Map<String, Object> map) {
      BaseCommand fromMapResult = new BaseCommand();
      Object seq = map.get("seq");
      fromMapResult.seq = (seq == null) ? null : ((seq instanceof Integer) ? (Integer)seq : (Long)seq);
      Object command = map.get("command");
      fromMapResult.command = (String)command;
      Object commandHead = map.get("commandHead");
      fromMapResult.commandHead = (Map<String, String>)commandHead;
      Object superCommand = map.get("superCommand");
      fromMapResult.superCommand = (String)superCommand;
      Object version = map.get("version");
      fromMapResult.version = (String)version;
      Object delayInMillis = map.get("delayInMillis");
      fromMapResult.delayInMillis = (Double)delayInMillis;
      Object timeoutInMillis = map.get("timeoutInMillis");
      fromMapResult.timeoutInMillis = (Double)timeoutInMillis;
      Object commandBody = map.get("commandBody");
      fromMapResult.commandBody = (String)commandBody;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class BaseResponse {
    private Map<String, String> responseHead;
    public Map<String, String> getResponseHead() { return responseHead; }
    public void setResponseHead(Map<String, String> setterArg) { this.responseHead = setterArg; }

    private String superCommand;
    public String getSuperCommand() { return superCommand; }
    public void setSuperCommand(String setterArg) { this.superCommand = setterArg; }

    private String command;
    public String getCommand() { return command; }
    public void setCommand(String setterArg) { this.command = setterArg; }

    private String commandBody;
    public String getCommandBody() { return commandBody; }
    public void setCommandBody(String setterArg) { this.commandBody = setterArg; }

    private String type;
    public String getType() { return type; }
    public void setType(String setterArg) { this.type = setterArg; }

    private String version;
    public String getVersion() { return version; }
    public void setVersion(String setterArg) { this.version = setterArg; }

    private Long seq;
    public Long getSeq() { return seq; }
    public void setSeq(Long setterArg) { this.seq = setterArg; }

    private String contentType;
    public String getContentType() { return contentType; }
    public void setContentType(String setterArg) { this.contentType = setterArg; }

    private Long code;
    public Long getCode() { return code; }
    public void setCode(Long setterArg) { this.code = setterArg; }

    private Long contentLength;
    public Long getContentLength() { return contentLength; }
    public void setContentLength(Long setterArg) { this.contentLength = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("responseHead", responseHead);
      toMapResult.put("superCommand", superCommand);
      toMapResult.put("command", command);
      toMapResult.put("commandBody", commandBody);
      toMapResult.put("type", type);
      toMapResult.put("version", version);
      toMapResult.put("seq", seq);
      toMapResult.put("contentType", contentType);
      toMapResult.put("code", code);
      toMapResult.put("contentLength", contentLength);
      return toMapResult;
    }
    static BaseResponse fromMap(Map<String, Object> map) {
      BaseResponse fromMapResult = new BaseResponse();
      Object responseHead = map.get("responseHead");
      fromMapResult.responseHead = (Map<String, String>)responseHead;
      Object superCommand = map.get("superCommand");
      fromMapResult.superCommand = (String)superCommand;
      Object command = map.get("command");
      fromMapResult.command = (String)command;
      Object commandBody = map.get("commandBody");
      fromMapResult.commandBody = (String)commandBody;
      Object type = map.get("type");
      fromMapResult.type = (String)type;
      Object version = map.get("version");
      fromMapResult.version = (String)version;
      Object seq = map.get("seq");
      fromMapResult.seq = (seq == null) ? null : ((seq instanceof Integer) ? (Integer)seq : (Long)seq);
      Object contentType = map.get("contentType");
      fromMapResult.contentType = (String)contentType;
      Object code = map.get("code");
      fromMapResult.code = (code == null) ? null : ((code instanceof Integer) ? (Integer)code : (Long)code);
      Object contentLength = map.get("contentLength");
      fromMapResult.contentLength = (contentLength == null) ? null : ((contentLength instanceof Integer) ? (Integer)contentLength : (Long)contentLength);
      return fromMapResult;
    }
  }
  private static class Api2HostCodec extends StandardMessageCodec {
    public static final Api2HostCodec INSTANCE = new Api2HostCodec();
    private Api2HostCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return SendMessage.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof SendMessage) {
        stream.write(128);
        writeValue(stream, ((SendMessage) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface Api2Host {
    void toHostMessage(SendMessage message);

    /** The codec used by Api2Host. */
    static MessageCodec<Object> getCodec() {
      return Api2HostCodec.INSTANCE;
    }

    /** Sets up an instance of `Api2Host` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, Api2Host api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.Api2Host.toHostMessage", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              SendMessage messageArg = (SendMessage)args.get(0);
              if (messageArg == null) {
                throw new NullPointerException("messageArg unexpectedly null.");
              }
              api.toHostMessage(messageArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static class Api2FlutterCodec extends StandardMessageCodec {
    public static final Api2FlutterCodec INSTANCE = new Api2FlutterCodec();
    private Api2FlutterCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return CallbackMessage.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof CallbackMessage) {
        stream.write(128);
        writeValue(stream, ((CallbackMessage) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated class from Pigeon that represents Flutter messages that can be called from Java.*/
  public static class Api2Flutter {
    private final BinaryMessenger binaryMessenger;
    public Api2Flutter(BinaryMessenger argBinaryMessenger){
      this.binaryMessenger = argBinaryMessenger;
    }
    public interface Reply<T> {
      void reply(T reply);
    }
    static MessageCodec<Object> getCodec() {
      return Api2FlutterCodec.INSTANCE;
    }

    public void toFlutterMessage(CallbackMessage messageArg, Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.Api2Flutter.toFlutterMessage", getCodec());
      channel.send(new ArrayList<Object>(Arrays.asList(messageArg)), channelReply -> {
        callback.reply(null);
      });
    }
  }
  private static class TCP2HostCodec extends StandardMessageCodec {
    public static final TCP2HostCodec INSTANCE = new TCP2HostCodec();
    private TCP2HostCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return BaseCommand.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof BaseCommand) {
        stream.write(128);
        writeValue(stream, ((BaseCommand) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface TCP2Host {
    void sendCommand(BaseCommand baseCommand);
    Long getCommandSeq();

    /** The codec used by TCP2Host. */
    static MessageCodec<Object> getCodec() {
      return TCP2HostCodec.INSTANCE;
    }

    /** Sets up an instance of `TCP2Host` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, TCP2Host api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.TCP2Host.sendCommand", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              BaseCommand baseCommandArg = (BaseCommand)args.get(0);
              if (baseCommandArg == null) {
                throw new NullPointerException("baseCommandArg unexpectedly null.");
              }
              api.sendCommand(baseCommandArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.TCP2Host.getCommandSeq", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Long output = api.getCommandSeq();
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static class TCP2FlutterCodec extends StandardMessageCodec {
    public static final TCP2FlutterCodec INSTANCE = new TCP2FlutterCodec();
    private TCP2FlutterCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return BaseResponse.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof BaseResponse) {
        stream.write(128);
        writeValue(stream, ((BaseResponse) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated class from Pigeon that represents Flutter messages that can be called from Java.*/
  public static class TCP2Flutter {
    private final BinaryMessenger binaryMessenger;
    public TCP2Flutter(BinaryMessenger argBinaryMessenger){
      this.binaryMessenger = argBinaryMessenger;
    }
    public interface Reply<T> {
      void reply(T reply);
    }
    static MessageCodec<Object> getCodec() {
      return TCP2FlutterCodec.INSTANCE;
    }

    public void onTCPResponse(BaseResponse messageArg, Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.TCP2Flutter.onTCPResponse", getCodec());
      channel.send(new ArrayList<Object>(Arrays.asList(messageArg)), channelReply -> {
        callback.reply(null);
      });
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}