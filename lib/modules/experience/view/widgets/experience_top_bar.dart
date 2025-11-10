import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_name.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/modules/app/bloc/theme_cubit.dart';
import 'package:travel_assign/modules/experience/view/widgets/top_icon.dart';
import 'package:travel_assign/gen/assets.gen.dart';

class ExperienceTopBar extends StatelessWidget {
  final  VoidCallback onTapHeartIcon;
  const ExperienceTopBar({super.key, required this.onTapHeartIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Row(
            children: [
              AppAssetImage(imagePath: Assets.icons.appLogo, height: 25, width: 25),
              6.horizontalSizedBox,
              const AppName(isLarge: false),
            ],
          ),
          const Spacer(),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return TopIcon(
                icon: state is LightThemeState ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
          12.horizontalSizedBox,
          TopIcon(
            icon: Icons.favorite_outline_rounded,
            onTap: onTapHeartIcon,
          ),
        ],
      ),
    );
  }
}
