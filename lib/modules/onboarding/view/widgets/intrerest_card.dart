import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/core/widgets/translucent_card.dart';

class IntrerestCard extends StatefulWidget {
  final bool? isSelected;
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  const IntrerestCard({super.key, this.isSelected = false, required this.title, required this.imageUrl, this.onTap});

  @override
  State<IntrerestCard> createState() => _IntrerestCardState();
}

class _IntrerestCardState extends State<IntrerestCard> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _updateSelected();
  }

  @override
  void didUpdateWidget(covariant IntrerestCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      _updateSelected();
    }
  }

  void _updateSelected() {
    _isSelected = widget.isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isSelected = !_isSelected;
        widget.onTap?.call();
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          border: _isSelected ? Border.all(color: Colors.grey, width: 2) : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Opacity(
              opacity: _isSelected ? .5 : 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AppNetworkImage(imageUrl: widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: TransluentCard(
                takeFullWidth: false,
                child: Text(widget.title, style: context.textTheme.bodySmall?.copyWith(color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
