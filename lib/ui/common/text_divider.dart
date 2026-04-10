import 'package:flutter/material.dart';

enum TextDividerAlign { left, center, right }

class TextDivider extends StatelessWidget {
  final String text;
  final TextDividerAlign align;

  const TextDivider({super.key, required this.text, this.align = .center});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        if (align != .left) const Expanded(child: Divider()),
        Text(text, style: const TextStyle(color: Colors.grey)),
        if (align != .right) const Expanded(child: Divider()),
      ],
    );
  }
}
