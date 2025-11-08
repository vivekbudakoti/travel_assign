import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_name.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/features/app/bloc/theme_cubit.dart';
import 'package:travel_assign/features/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_card_footer.dart';
import 'package:travel_assign/features/experience/view/widgets/location_chip.dart';
import 'package:travel_assign/features/experience/view/widgets/top_icon.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});
  static final routeName = AppRoutes.experienceScreen;
  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            context.viewPadding.top.verticalSizedBox,
            Row(
              children: [
                Row(
                  children: [
                    AppAssetImage(imagePath: Assets.icons.appLogo, height: 25, width: 25),
                    6.horizontalSizedBox,
                    AppName(isLarge: false),
                  ],
                ),
                Spacer(),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return TopIcon(
                      icon: state is LightThemeState ? Icons.dark_mode : Icons.light_mode,
                      onTap: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),

                6.horizontalSizedBox,
                TopIcon(icon: Icons.bookmark, onTap: () {}),
              ],
            ),
            20.verticalSizedBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    AppNetworkImage(
                      imageUrl:
                          "https://images.unsplash.com/photo-1519594445471-0e5f86b3fb09?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fE1vcm9jY298ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=900",
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
            ),
          ],
        ),
      ),
    );
  }
}
