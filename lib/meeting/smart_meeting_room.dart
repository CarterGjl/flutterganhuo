import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

var controlItems = [
  ControlItemBean(1, "images/image_launch_hl.svg", 'images/image_launch_n.svg',
      0xFFF1F6FF, 0xFFF7F8FA, '发起视频会议', '发起加密视频会议'),
  ControlItemBean(2, "images/image_add_hl.svg", 'images/image_add_n.svg',
      0xFFF4F2FF, 0xFFF7F8FA, '加入视频会议', '输入会议ID加入视频会议'),
  ControlItemBean(2, "images/image_screen_hl.svg", 'images/image_screen_n.svg',
      0xFFEDFAFA, 0xFFF7F8FA, '加入视频会议', '输入会议ID加入视频会议'),
];

/// 输入6 位数字 开启激活状态
class SmartMeetingRoom extends StatefulWidget {
  final Map<String, String>? queryParameters;
  const SmartMeetingRoom({Key? key,this.queryParameters}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartMeetingRoomState();
  }
}

class _SmartMeetingRoomState extends State<SmartMeetingRoom> {
  final TextEditingController _controller = TextEditingController();

  bool clickAble = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('SmartMeetingRoom build');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            // 输入联动码
            Container(
              alignment: Alignment.center,
              child: const Text(
                '打开会议室iTV  输入会议联动码',
                style: TextStyle(color: Colors.black),
              ),
              margin: const EdgeInsets.only(top: 72),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 320,
              child: TextField(
                onChanged: (value) {
                  clickAble = value.length == 6;
                  setState(() {});
                },
                controller: _controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: const InputDecoration(
                    hintText: '输入6位数联动码',
                    hintStyle: TextStyle(),
                    fillColor: Color(0xFFF2F3F5),
                    filled: true,
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Container(
              width: 320,
              height: 48,
              margin: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.lightBlueAccent;
                      }
                      return Colors.blue; // Defer to the widget's default.
                    }),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))))),
                onPressed: !clickAble ? null : () {},
                child: const Text(
                  '关联会议室',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // 分割线
            Container(
              margin: const EdgeInsets.only(top: 77),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      height: 1,
                      indent: 60,
                      color: Colors.black38,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text('关联会议室你可以',
                          style: TextStyle(color: Color(0xFF77787A)))),
                  const Expanded(
                    child: Divider(
                      height: 1,
                      endIndent: 60,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),

            // control items
            _buildControlItems(clickAble),

            Container(
              margin: const EdgeInsets.only(top: 24, bottom: 32),
              child: const Text(
                '打开会议室iTV  输入会议联动码',
                style: TextStyle(color: Color(0xFF77787A)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 控制卡片
_buildControlItems(bool enable) {
  var list = <Widget>[];
  for (int i = 0; i < controlItems.length; i++) {
    if (i == 0) {
      list.add(ControlItem(controlItems[i], enable: enable));
    } else {
      list.add(ControlItem1(controlItems[i], enable: enable));
    }
  }
  return Container(
    height: 166,
    margin: const EdgeInsets.only(top: 24),
    alignment: Alignment.center,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: list,
    ),
  );
}

class ControlItem extends StatelessWidget {
  final bool enable;
  final ControlItemBean controlItem;

  const ControlItem(this.controlItem, {this.enable = false,Key? key}):super
      (key: key);

  @override
  Widget build(BuildContext context) {
    print('ControlItemState build ');
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      width: 216,
      height: 166,
      decoration: BoxDecoration(
          color: enable
              ? Color(controlItem.enableColor)
              : Color(controlItem.disableColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Color(controlItem.disableColor);
              }
              return Color(
                  controlItem.enableColor); // Defer to the widget's default.
            })),
            onPressed: !enable ? null : () {},
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 20, right: 32),
                    child: enable
                        ? SvgPicture.asset(controlItem.enableIcon)
                        : SvgPicture.asset(controlItem.disableIcon)),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(controlItem.title,
                      style: const TextStyle(color: Color(0xFF77787A))),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black38,
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Color(controlItem.disableColor);
              }
              return Color(
                  controlItem.enableColor); // Defer to the widget's default.
            })),
            onPressed: !enable ? null : () {},
            child: Container(
                margin: const EdgeInsets.only(left: 20, bottom: 24, top: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  controlItem.subTitle,
                  style: const TextStyle(color: Color(0xFF77787A)),
                )),
          ),
        ],
      ),
    );
  }
}

/// 整个可点击的条目
class ControlItem1 extends StatelessWidget {
  final bool enable;
  final ControlItemBean controlItem;

  const ControlItem1(this.controlItem, {this.enable = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ControlItemState1 build ');
    return Container(
      width: 216,
      height: 166,
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: const BoxDecoration(
          // color: _enable ? Color(0xFFF1F6FF) : Color(0xFFF7F8FA),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ElevatedButton(
        onPressed: !enable ? null : () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Color(controlItem.disableColor);
              }
              return Color(
                  controlItem.enableColor); // Defer to the widget's default.
            }),
            elevation: MaterialStateProperty.all(0)),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 20, right: 32),
                child: enable
                    ? SvgPicture.asset(controlItem.enableIcon)
                    : SvgPicture.asset(controlItem.disableIcon)),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 27),
              alignment: Alignment.centerLeft,
              child: Text(controlItem.title,
                  style: const TextStyle(color: Color(0xFF77787A))),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  controlItem.subTitle,
                  style: const TextStyle(color: Color(0xFF9EA0A3), fontSize: 13),
                )),
          ],
        ),
      ),
    );
  }
}

/// 控制卡片条目bean
class ControlItemBean {
  int type;
  String enableIcon;
  String disableIcon;
  int enableColor;
  int disableColor;
  String title;
  String subTitle;

  ControlItemBean(this.type, this.enableIcon, this.disableIcon,
      this.enableColor, this.disableColor, this.title, this.subTitle);
}
