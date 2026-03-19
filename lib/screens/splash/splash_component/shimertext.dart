import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class ShimmerText extends StatefulWidget {
  const ShimmerText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.textAnimation,
  });

  final String text;
  final TextStyle textStyle;
  final int textAnimation;

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.textAnimation),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            final w = bounds.width == 0 ? 1.0 : bounds.width;
            final t = _controller.value;

            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.0, 0.5, 1.0],
              colors: const [
                Color(0xFF8A8A8A), // เทา
                Color(0xFFAB3E1F), // น้ำตาลส้ม (brand)
                Color(0xFF8A8A8A), // เทา
              ],
              transform: GradientTranslation(Offset((t * 2 - 1) * w, 0)),
            ).createShader(bounds);
          },
          child: ShowText(title: widget.text, textStyle: widget.textStyle),
        );
      },
    );
  }
}

class GradientTranslation extends GradientTransform {
  const GradientTranslation(this.offset);
  final Offset offset;

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(offset.dx, offset.dy, 0.0);
  }
}
