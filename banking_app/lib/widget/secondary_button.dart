import 'package:banking_app/utils/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text, icons;
  final double width;
  final double height;
  final double borderRadius;
  final double? fontSize;
  final Color textColor, bgColor;
  const SecondaryButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.width,
    required this.height,
    required this.icons,
    required this.borderRadius,
    this.fontSize,
    required this.textColor,
    required this.bgColor,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _animationDuration)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          height: widget.height,
          alignment: Alignment.center,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.bgColor,
            border: Border.all(color: AppColor.kLine),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Row(
            children: [
              SizedBox(width: 30),
              Image.asset(widget.icons, width: 23.85, height: 23.04),
              const SizedBox(width: 12),
              Text(
                widget.text,
                style:
                    GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.kWhite,
                    ).copyWith(
                      color: widget.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
