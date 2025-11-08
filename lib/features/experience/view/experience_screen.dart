import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_name.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/features/app/bloc/theme_cubit.dart';
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
                          "https://plus.unsplash.com/premium_photo-1661962627529-73e5d332d04a?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8U3dpdHplcmxhbmR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=900",
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    LocationChip(location: "Switzerland"),
                    Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withValues(alpha: 0.3),
                          // borderRadius: BorderRadius.only(
                          //   bottomLeft: Radius.circular(16),
                          //   bottomRight: Radius.circular(16),
                          // ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Swiss Alps Expedition", style: context.textTheme.titleLarge),
                            2.verticalSizedBox,
                            Text(
                              "The Swiss Alps offer some of the most spectacular mountain scenery in the world. From the Matterhorn’s sharp peak to the peaceful beauty of Lake Lucerne, every view feels unreal. Ride scenic trains like the Glacier Express, or trek through meadows filled with wildflowers. Winter brings world-class skiing in Zermatt and St. Moritz, while summer reveals crystal-clear lakes and charming wooden villages. Whether you hike, ski, or just sip hot chocolate by the fire, the Swiss Alps redefine mountain magic.",
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodySmall,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
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
