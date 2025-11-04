import 'package:flutter/material.dart';

class AnimatedGradientText extends StatefulWidget {
  final String text;
  AnimatedGradientText({required this.text});
  @override
  _AnimatedGradientTextState createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(duration: Duration(seconds: 3), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
              begin: Alignment(-1 + 2 * _c.value, -0.5),
              end: Alignment(1 - 2 * _c.value, 0.5),
            ).createShader(bounds);
          },
          child: Text(widget.text, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white)),
        );
      },
    );
  }
}

class NeonButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  NeonButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Color(0xFF8B5CF6).withOpacity(0.6), blurRadius: 24, spreadRadius: 0)],
          gradient: LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)]),
        ),
        child: Text(label, style: TextStyle(fontWeight: FontWeight.w800)),
      ),
    );
  }
}