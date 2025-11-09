import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/features/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/features/experience/view/widgets/transluent_circle_avatar.dart';

class ExperienceDetailScreen extends StatefulWidget {
  const ExperienceDetailScreen({super.key});

  static const routeName = AppRoutes.experienceDetailScreen;

  @override
  State<ExperienceDetailScreen> createState() => _ExperienceDetailScreenState();
}

class _ExperienceDetailScreenState extends State<ExperienceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final heightBgImage = context.height / 1.7;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Stack(
              children: [
                Hero(
                  tag: "my-hero",
                  flightShuttleBuilder: (context, animation, direction, from, to) {
                    return FadeTransition(
                      opacity: animation.drive(Tween(begin: 0.8, end: 1.0)),
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween(begin: 0.98, end: 1.0).chain(CurveTween(curve: Curves.easeOutCubic)),
                        ),
                        child: to.widget,
                      ),
                    );
                  },
                  child: SizedBox(
                    height: heightBgImage,
                    width: double.infinity,
                    child: AppNetworkImage(
                      imageUrl:
                          "https://plus.unsplash.com/premium_photo-1697729914552-368899dc4757?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=900",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.viewPadding.top + 12, left: 16, right: 16),
                  child: Row(
                    children: [
                      TransluentCircleAvatar(child: Icon(Icons.arrow_back), onTap: () => context.pop()),
                      Spacer(),
                      CircularHeart(),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: heightBgImage - 100),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(color: AppColors.black.withValues(alpha: 0.1), blurRadius: 8, spreadRadius: 1),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sahara Desert Safari",
                        style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      12.verticalSizedBox,
                      Text(
                        "The Sahara is endless beauty and silence rolled into one. Journey across the dunes of Merzouga on camelback as the sun paints the sand in shades of gold and red. Spend nights in Berber tents under skies filled with constellations. The desert’s stillness, warmth, and vastness connect you to something eternal. It’s a place where time slows and nature speaks softly.",
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
