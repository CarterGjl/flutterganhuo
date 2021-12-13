import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HandleWidget extends StatefulWidget {
  /// zoneR:背景区域大小，即限定摇杆的区域
  final double zoneR;

  /// 背景图地址
  final String zoneImagePath;

  /// 摇杆按钮地址
  final String handleImagePath;

  /// 摇杆大小
  final double handleR;
  final OnAngleAndRadiaChange? onHandleListener;

  const HandleWidget(
      {this.zoneR = 120.0,
      this.handleR = 50.0,
      this.onHandleListener,
      this.zoneImagePath = "images/hitv_control_background.png",
      this.handleImagePath = "images/hitv_control_button.png",
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HandleWidgetState();
  }
}

class _HandleWidgetState extends State<HandleWidget> {
  late double zoneR = 0.0;
  late double handleR;

  /// centerX,centerY摇杆中心偏移
  double centerX = 0.0;
  double centerY = 0.0;
  ui.Image? image;
  ui.Image? handleImage;
  Direction _currentDirection = Direction.unknown;

  @override
  void initState() {
    zoneR = widget.zoneR;
    handleR = widget.handleR;
    getImages();
    super.initState();
  }

  Future<ui.Image> getImage(String asset, int height, int width) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = (await ui.instantiateImageCodec(data.buffer.asUint8List(),
        allowUpscaling: false, targetHeight: height, targetWidth: width));
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (details) {
        reset();
      },
      onPanUpdate: (details) {
        parser(details.localPosition);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: image == null
            ? Container()
            : CustomPaint(
                painter: _HandleView(
                    zoneR: zoneR,
                    centerX: centerX,
                    centerY: centerY,
                    handleR: handleR,
                    zoneImage: image!,
                    handleImage: handleImage!,
                    direction: _currentDirection),
                size: Size(size, size),
              ),
      ),
    );
  }

  reset() {
    centerX = 0;
    centerY = 0;
    _currentDirection = Direction.unknown;
    setState(() {});
  }

  double get size => zoneR * 3;

  double get maxR => zoneR + handleR;

  parser(Offset offset) {
    centerX = offset.dx - zoneR;
    centerY = offset.dy - zoneR;
    var rad = atan2(centerX, centerY);
    if (centerX < 0) {
      rad += 2 * pi;
    }
    var thta = rad - pi / 2; //旋转坐标系90度
    /// 滑动距离
    var length = sqrt(centerX * centerX + centerY * centerY);

    /// 角度
    var angle = rad * 180 / pi;
    _currentDirection = Direction.unknown;
    if (length >= zoneR - handleR) {
      if (angle >= 170 && angle <= 190) {
        _currentDirection = Direction.top;
      } else if (angle >= 80 && angle <= 100) {
        _currentDirection = Direction.right;
      } else if (angle >= 260 && angle <= 280) {
        _currentDirection = Direction.left;
      } else if ((angle >= 350 && angle <= 360) ||
          (angle >= 0 && angle <= 10)) {
        _currentDirection = Direction.bottom;
      }
    }
    widget.onHandleListener?.call(_currentDirection);
    // 可以滑动的最大长度
    if (length >= zoneR - handleR) {
      centerX = (zoneR - handleR) * cos(thta);
      centerY = (-(zoneR - handleR)) * sin(thta);
    }
    setState(() {});
  }

  Future<void> getImages() async {
    image = await getImage(
        widget.zoneImagePath, (zoneR * 2).toInt(), (zoneR * 2).toInt());
    handleImage = await getImage(
        widget.handleImagePath, (handleR * 2).toInt(), (handleR * 2).toInt());
    setState(() {});
  }
}

class _HandleView extends CustomPainter {
  final double zoneR;
  final double handleR;
  final double centerX;
  final double centerY;
  final ui.Image zoneImage;
  final ui.Image handleImage;
  final Direction direction;

  double get maxR => zoneR + handleR;
  final _paint = Paint();

  final List<Color> _colors = [
    const Color(0xFF2A88FC),
    const Color(0x002A88FC),
    const Color(0xFF2A88FC),
    const Color(0x002A88FC),
    const Color(0xFF2A88FC),
    const Color(0x002A88FC),
    const Color(0xFF2A88FC),
    const Color(0x002A88FC),
    const Color(0xFF2A88FC)
  ];
  List<double> positions = [
    0,
    0.125,
    0.25,
    0.375,
    0.5,
    0.625,
    0.75,
    0.875,
    1.0
  ];

  _HandleView(
      {this.zoneR = 0,
      this.handleR = 0,
      this.centerX = 0.0,
      this.centerY = 0.0,
      this.direction = Direction.unknown,
      required this.zoneImage,
      required this.handleImage}) {
    _paint
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
  }

  // final int[] selectColor =  int[] { ,  };
  @override
  Future<void> paint(Canvas canvas, Size size) async {
    // canvas.translate(maxR, maxR);
    // _paint.color = _paint.color.withAlpha(100);
    // canvas.drawCircle(const Offset(0, 0), zoneR, _paint);
    // canvas.translate(0, 0);
    canvas.drawImage(zoneImage, const Offset(0, 0), _paint);
    canvas.translate(zoneR - handleR, zoneR - handleR);
    canvas.drawImage(handleImage, Offset(centerX, centerY), _paint);

    // _paint
    //   ..color = Colors.black87
    //   ..style = PaintingStyle.fill
    //   ..isAntiAlias = true;
    // canvas.drawCircle(Offset(centerX, centerY), handleR, _paint);
    canvas.translate(handleR, handleR);
    var rect = Rect.fromCircle(center: const Offset(0, 0), radius: zoneR);
    if (direction != Direction.unknown) {
      _paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..shader = ui.Gradient.sweep(const Offset(0.0, 0.0), _colors, positions)
        ..isAntiAlias = true;
    }

    switch (direction) {
      case Direction.top:
        canvas.drawArc(rect, -60 / 360 * 2 * pi, -1 / 3 * pi, false, _paint);
        break;
      case Direction.left:
        canvas.drawArc(rect, 150 / 360 * 2 * pi, 1 / 3 * pi, false, _paint);
        break;
      case Direction.bottom:
        canvas.drawArc(rect, 60 / 360 * 2 * pi, 1 / 3 * pi, false, _paint);
        break;
      case Direction.right:
        canvas.drawArc(rect, -30 / 360 * 2 * pi, 1 / 3 * pi, false, _paint);
        break;
      case Direction.unknown:
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

typedef OnAngleAndRadiaChange = Function(Direction direction);

enum Direction { top, left, bottom, right, unknown }
