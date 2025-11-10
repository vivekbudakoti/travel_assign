import 'package:flutter/material.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/features/experience/model/experience_data_model.dart';
import 'package:travel_assign/features/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_card_footer.dart';
import 'package:travel_assign/features/experience/view/widgets/location_chip.dart';

class ExperienceCard extends StatelessWidget {
  final VoidCallback onTap;
  final ExperienceDataModel data;
  const ExperienceCard({super.key, required this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Hero(
                tag: data.id ?? "",
                child: AppNetworkImage(imageUrl: data.thumbnail ?? "", height: 250, fit: BoxFit.cover),
              ),
              LocationChip(location: data.location ?? ""),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: ExperienceCardFooter(
                  expId: data.id ?? "",
                  interests: data.interests?.map((e) => e.title ?? "").toList() ?? [],
                  bottomTileTitle: data.title ?? "",
                  bottomTileSubText: data.shortDescription ?? "",
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CircularHeart(
                  key: ValueKey(data.id ?? ""),
                  isSelected: data.isSaved,
                  id: data.id ?? "",
                  onToggle: (isSaved) {
                    data.isSaved = isSaved;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
