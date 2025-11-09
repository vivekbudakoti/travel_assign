import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/core/widgets/translucent_card.dart';

class IntrerestCard extends StatelessWidget {
  final bool? isSelected;
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  const IntrerestCard({super.key, this.isSelected = false, required this.title, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: isSelected! ? Border.all(color: Colors.grey, width: 2) : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Opacity(
              opacity: isSelected! ? .5 : 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AppNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: TransluentCard(
                takeFullWidth: false,
                child: Text(title, style: context.textTheme.bodySmall?.copyWith(color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
