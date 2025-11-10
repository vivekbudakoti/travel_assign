import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/app_carousel.dart';
import 'package:travel_assign/modules/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/modules/experience/view/widgets/transluent_circle_avatar.dart';
import 'package:travel_assign/modules/experience_details/bloc/experience_details_cubit.dart';
import 'package:travel_assign/modules/experience_details/bloc/experience_details_state.dart';
import 'package:travel_assign/modules/experience_details/view/widgets/experience_details_header.dart';
import 'package:travel_assign/modules/experience_details/view/widgets/interests_row.dart';

class ExperienceDetailScreen extends StatelessWidget {
  final String id;
  final Object? extra;
  const ExperienceDetailScreen({super.key, required this.id, this.extra});

  static const routeName = AppRoutes.experienceDetailScreen;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExperienceDetailsCubit(),
      child: _ExperienceDetailScreen(id: id, extra: extra),
    );
  }
}

class _ExperienceDetailScreen extends StatefulWidget {
  final String id;
  final Object? extra;
  const _ExperienceDetailScreen({required this.id, this.extra});

  @override
  State<_ExperienceDetailScreen> createState() => _ExperienceDetailScreenState();
}

class _ExperienceDetailScreenState extends State<_ExperienceDetailScreen> {
  Function? _onBack;
  bool _isSavedPrefChanged = false;
  @override
  void initState() {
    super.initState();
    context.read<ExperienceDetailsCubit>().getDetails(id: widget.id);
    if (widget.extra is Map && (widget.extra as Map)[RouteConstants.onBackSuccess] is Function) {
      _onBack = (widget.extra as Map)[RouteConstants.onBackSuccess];
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightBgImage = context.height / 1.7;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && _isSavedPrefChanged) {
          _onBack?.call();
        }
      },
      child: BlocBuilder<ExperienceDetailsCubit, ExperienceDetailsState>(
        builder: (context, state) {
          switch (state) {
            case ExperienceDetailsSuccessState():
              final data = state.experienceData;
              return Scaffold(
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          AppCarousel(
                            imageUrls: data.imageUrls ?? [],
                            height: heightBgImage,
                            firstImageHeroTag: data.id,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: context.viewPadding.top + 12, left: 16, right: 16),
                            child: Row(
                              children: [
                                TransluentCircleAvatar(child: Icon(Icons.arrow_back), onTap: () => context.pop()),
                                Spacer(),
                                CircularHeart(
                                  id: data.id ?? "",
                                  isSelected: data.isSaved,
                                  onToggle: (isSaved) {
                                    data.isSaved = isSaved;
                                    if (!_isSavedPrefChanged) _isSavedPrefChanged = true;
                                  },
                                ),
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
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExperienceDetailsHeader(
                                  title: data.title ?? "",
                                  subTitle: data.shortDescription ?? "",
                                  location: data.location ?? "",
                                ),
                                Divider(),
                                Text(
                                  "Things You will Love: ",
                                  style: context.textTheme.labelLarge?.copyWith(color: AppColors.secondaryText),
                                ),
                                8.verticalSizedBox,
                                InterestsRow(data: data.interests ?? [], expId: widget.id),
                                12.verticalSizedBox,
                                Text(data.fullDescription ?? "", style: context.textTheme.labelLarge),
                                context.viewPadding.bottom.verticalSizedBox,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            case ExperienceDetailsErrorState():
              return Center(child: Text(state.message));
            default:
              return Hero(tag: widget.id, child: Container());
          }
        },
      ),
    );
  }
}
