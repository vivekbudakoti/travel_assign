import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const TopIcon({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(padding: EdgeInsets.all(4), child: Icon(icon)),
    );
  }
}
