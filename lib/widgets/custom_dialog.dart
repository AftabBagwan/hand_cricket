import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, this.image, this.scoreDefend});
  final String? image;
  final int? scoreDefend;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (image != null) Image.asset(image!),
          if (scoreDefend != null)
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                scoreDefend.toString(),
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          if (image == null)
            Text(
              "You Lost, \n Computer Won",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )
        ],
      ),
    );
  }
}
