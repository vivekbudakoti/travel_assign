import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_name.dart';
import 'package:travel_assign/core/widgets/asset_image.dart';
import 'package:travel_assign/features/app/bloc/theme_cubit.dart';
import 'package:travel_assign/features/experience/view/experience_detail_screen.dart';
import 'package:travel_assign/features/experience/view/saved_experiences_screen.dart';
import 'package:travel_assign/features/experience/view/widgets/experience_card.dart';
import 'package:travel_assign/features/experience/view/widgets/interest_option.dart';
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
      body: Column(
        children: [
          context.viewPadding.top.verticalSizedBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
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
                  onTap: () {
                    context.push(SavedExperiencesScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          40.verticalSizedBox,
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return InterestOption(
                  imageUrl: "https://cdn.pixabay.com/photo/2024/02/29/15/19/ai-generated-8604636_960_720.jpg",
                  isSelected: (index < 3) ? true : false,
                  title: "Adventure",
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) => 10.horizontalSizedBox,
              itemCount: 8,
            ),
          ),
          20.verticalSizedBox,
          ExperienceCard(onTap: () => context.push(ExperienceDetailScreen.routeName)),
        ],
      ),
    );
  }
}
