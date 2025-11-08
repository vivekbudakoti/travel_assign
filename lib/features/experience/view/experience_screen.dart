import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_name.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/features/app/bloc/theme_cubit.dart';
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
          ],
        ),
      ),
    );
  }
}
