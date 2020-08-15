library expanded_color_card;

import 'package:flutter/material.dart';

class ExpandedColorCardStatus extends StatelessWidget {
  final String title;
  final double titleSize;
  final String statusText;
  final double statusTextSize;
  final Color color;
  final VoidCallback onPressed;
  final double height;

  const ExpandedColorCardStatus({
    Key key,
    this.title,
    this.statusText,
    @required this.color,
    this.onPressed,
    this.height = 90,
    this.titleSize,
    this.statusTextSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Title',
              style: TextStyle(
                color: Colors.white,
                fontSize: titleSize ?? 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: Text(
                  statusText ?? 'Status...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: statusTextSize ?? 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
