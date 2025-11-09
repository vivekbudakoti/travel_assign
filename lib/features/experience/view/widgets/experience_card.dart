import 'package:flutter/material.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/features/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_card_footer.dart';
import 'package:travel_assign/features/experience/view/widgets/location_chip.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            AppNetworkImage(
              imageUrl:
                  "https://plus.unsplash.com/premium_photo-1697729914552-368899dc4757?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8RHViYWl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=900",
              height: 250,
              fit: BoxFit.cover,
            ),
            LocationChip(location: "Morocco"),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: ExperienceCardFooter(
                topTileTitle: "Adventure, Nature",
                bottomTileTitle: "Sahara Desert Safari",
                bottomTileSubText:
                    "The Sahara is endless beauty and silence rolled into one. Journey across the dunes of Merzouga on camelback as the sun paints the sand in shades of gold and red. Spend nights in Berber tents under skies filled with constellations. The desert’s stillness, warmth, and vastness connect you to something eternal. It’s a place where time slows and nature speaks softly.",
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircularHeart(isFilled: true, onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
