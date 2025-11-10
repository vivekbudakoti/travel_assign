import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';

class InterestOption extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  const InterestOption({
    super.key,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: isSelected ? 0.7 : 1.0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: isSelected ? context.colorScheme.inversePrimary : context.colorScheme.primary,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: AppNetworkImage(imageUrl: imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.inversePrimary,
                      border: Border.all(color: AppColors.graniteGray, width: 1.5),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Icon(Icons.check, size: 14, color: context.colorScheme.primary),
                  ),
                ),
            ],
          ),
          4.verticalSizedBox,
          Text(title, style: context.textTheme.labelSmall?.copyWith(color: AppColors.graniteGray)),
        ],
      ),
    );
  }
}
