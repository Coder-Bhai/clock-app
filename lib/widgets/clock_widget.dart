import 'package:flutter/material.dart';
import 'dart:math';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  // @override
  // void initState() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var datetime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 10;
    final innerBorder = Paint()
      ..color = Color(0xFF2F2C35)
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCenter(
        center: center, width: size.width - 3, height: size.height - 3);

    final startAngle = pi / 2;
    final sweepAngle = 2 * pi;
    final outerBorder = Paint()
      ..color = Color(0xFF8E8F94)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.3)
      ..shader = LinearGradient(
              colors: [Color(0xFF2F2C35), Color(0xFFEBEBED)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(center: center, radius: radius));

    final circleBrush = Paint()
      ..color = Colors.white60
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.8);

    final hrHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.2);
    final minHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.2);
    final secHandBrush = Paint()
      ..color = Color(0xFFD12742)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.2);
    canvas.drawCircle(center, radius, innerBorder);
    canvas.drawArc(rect, startAngle, sweepAngle, false, outerBorder);
    for (double i = 0; i < 360; i += 30) {
      var x = (size.width / 2) + (radius - 15) * cos(i * pi / 180);
      var y = (size.width / 2) + (radius - 15) * sin(i * pi / 180);

      canvas.drawCircle(Offset(x, y), 4, circleBrush);
    }
    var hrHandX = (size.width / 2) +
        65 * cos((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    var hrHandY = (size.width / 2) +
        65 * sin((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    var minHandX = (size.width / 2) + 105 * cos(datetime.minute * 6 * pi / 180);
    var minHandY = (size.width / 2) + 105 * sin(datetime.minute * 6 * pi / 180);
    var secHandX = (size.width / 2) + 105 * cos(datetime.second * 6 * pi / 180);
    var secHandY = (size.width / 2) + 105 * sin(datetime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(hrHandX, hrHandY), hrHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, 8, circleBrush);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}