import 'dart:math';
import 'package:base_flutter_app/src/values/app_color.dart';
import 'package:flutter/material.dart';


class JacksmanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,width: 200,
        child: FlutterClipPolygon(
          sides: 6,
          borderRadius: 18.0, // Defaults to 0.0 degrees
          rotate: 90.0,
          // Defaults to 0.0 degrees
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffE4B343),
              border: Border.all(width: 2)
            ),
            child: FlutterClipPolygon(
              sides: 6,
              borderRadius: 18.0, // Defaults to 0.0 degrees
              rotate: 90.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff384054),
                    border: Border.all(width: 4)
                ),
                child: FlutterClipPolygon(
                  borderRadius: 18.0,
                  rotate: 90.0,
                  sides: 6,
                  child: Container(
                    decoration: BoxDecoration(
                   //   border: Border.all(width: 25,color: Colors.pink),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://feeds.abplive.com/onecms/images/uploaded-images"
                                "/2021/06/17/7981791718808cf55a416d8619835276_original.jpg"),
                        fit: BoxFit.cover,
                      )
                    ),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// polygon
class PolygonPathSpecs {
  final int sides;
  final double rotate;
  final double borderRadiusAngle;
  final double halfBorderRadiusAngle;

  /// Creates polygon path specs.
  PolygonPathSpecs({
    required this.sides,
    required this.rotate,
    required this.borderRadiusAngle,
  })  : halfBorderRadiusAngle = borderRadiusAngle / 2,
        assert(sides >= 3);
}

class FlutterClipPolygon extends StatelessWidget {
  final Widget? child;
  final int? sides;
  final double? rotate;
  final double? borderRadius;
  final List<PolygonBoxShadow>? boxShadows;

  /// Creates a polygon shaped clip with [sides] sides rotated [rotate] degrees.
  ///
  /// Provide a [borderRadius] to set the radius of the corners.
  ///
  /// The [sides] argument must be at least 3.
  FlutterClipPolygon(
      {Key? key,
        required this.sides,
        this.rotate: 0.0,
        this.borderRadius: 0.0,
        this.boxShadows: const [],
        this.child})
      : assert(sides! >= 3),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    PolygonPathSpecs specs = PolygonPathSpecs(
      sides: sides! < 3 ? 3 : sides!,
      rotate: rotate!,
      borderRadiusAngle: borderRadius!,
    );

    return AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
            painter: PolygonBoxShadowPainter(specs, boxShadows!),
            child: ClipPath(
              clipper: PolygonClipper(specs),
              child: child,
            )));
  }
}

/// Provides polygon shaped clips based on [PolygonPathSpecs]
class PolygonClipper extends CustomClipper<Path> {
  final PolygonPathSpecs specs;

  /// Create a polygon clipper with the provided specs.
  PolygonClipper(this.specs);

  @override
  Path getClip(Size size) {
    return PolygonPathDrawer(size: size, specs: specs).draw();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// A polygon shaped shadow
class PolygonBoxShadowPainter extends CustomPainter {
  final PolygonPathSpecs specs;
  final List<PolygonBoxShadow> boxShadows;

  /// Creates a polygon shaped shadow
  PolygonBoxShadowPainter(this.specs, this.boxShadows);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = PolygonPathDrawer(size: size, specs: specs).draw();

    boxShadows.forEach((PolygonBoxShadow shadow) {
      canvas.drawShadow(path, shadow.color, shadow.elevation, false);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Specifications of a polygon box shadow
class PolygonBoxShadow {
  final Color color;
  final double elevation;

  /// Creates a polygon box shadow with the provided [color] and [elevation].
  PolygonBoxShadow({
    required this.color,
    required this.elevation,
  });
}


// drawer view
class PolygonPathDrawer {
  final Size? size;
  final PolygonPathSpecs? specs;

  /// Creates a polygon path drawer.
  PolygonPathDrawer({
    required this.size,
    required this.specs,
  });

  Path draw() {
    final anglePerSide = 360 / specs!.sides;

    final radius = (size!.width - specs!.borderRadiusAngle) / 2;
    final arcLength = (radius * _angleToRadian(specs!.borderRadiusAngle)) +
        (specs!.sides * 2);

    Path path = Path();

    for (var i = 0; i <= specs!.sides; i++) {
      double currentAngle = anglePerSide * i;
      bool isFirst = i == 0;

      if (specs!.borderRadiusAngle > 0) {
        _drawLineAndArc(path, currentAngle, radius, arcLength, isFirst);
      } else {
        _drawLine(path, currentAngle, radius, isFirst);
      }
    }

    return path;
  }

  _drawLine(Path path, double currentAngle, double radius, bool move) {
    Offset current = _getOffset(currentAngle, radius);

    if (move)
      path.moveTo(current.dx, current.dy);
    else
      path.lineTo(current.dx, current.dy);
  }

  _drawLineAndArc(Path path, double currentAngle, double radius,
      double arcLength, bool isFirst) {
    double prevAngle = currentAngle - specs!.halfBorderRadiusAngle;
    double nextAngle = currentAngle + specs!.halfBorderRadiusAngle;

    Offset previous = _getOffset(prevAngle, radius);
    Offset next = _getOffset(nextAngle, radius);

    if (isFirst) {
      path.moveTo(next.dx, next.dy);
    } else {
      path.lineTo(previous.dx, previous.dy);
      path.arcToPoint(next, radius: Radius.circular(arcLength));
    }
  }

  double _angleToRadian(double angle) {
    return angle * (pi / 180);
  }

  Offset _getOffset(double angle, double radius) {
    final rotationAwareAngle = angle - 90 + specs!.rotate;

    final radian = _angleToRadian(rotationAwareAngle);
    final x = cos(radian) * radius + radius + specs!.halfBorderRadiusAngle;
    final y = sin(radian) * radius + radius + specs!.halfBorderRadiusAngle;

    return Offset(x, y);
  }
}

/// Specs class for polygon paths.
