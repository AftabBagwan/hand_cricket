import 'package:flutter/material.dart';

class RunButton extends StatelessWidget {
  const RunButton({
    super.key,
    required this.image,
    required this.onTap,
    required this.size,
  });
  
  final String image;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        height: size,
        width: size,
      ),
    );
  }
}
