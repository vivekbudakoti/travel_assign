import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/constants/constants.dart';
import 'package:travel_assign/modules/app/bloc/heart_cubit.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/core/widgets/swipe_to_toggle.dart';
import 'package:travel_assign/modules/app/bloc/heart_state.dart';
import 'package:travel_assign/modules/experience/model/experience_data_model.dart';
import 'package:travel_assign/modules/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/modules/experience/view/widgets/experience_card_footer.dart';
import 'package:travel_assign/modules/experience/view/widgets/location_chip.dart';

class ExperienceCard extends StatefulWidget {
  final VoidCallback onTap;
  final ExperienceDataModel data;
  final bool showTutorial;
  final void Function()? onHeratTapCallBack;
  const ExperienceCard({
    super.key,
    required this.onTap,
    required this.data,
    this.onHeratTapCallBack,
    this.showTutorial = false,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeartCubit, HeartState>(
      buildWhen: (previous, current) {
        // Only rebuild if the state change is for this specific experience
        if (current is HeartUpdatedState) {
          return current.experienceId == (widget.data.id ?? "");
        }
        return false;
      },
      builder: (context, heartState) {
        // Get the current save status from HeartCubit or fallback to data model
        bool currentSaveStatus = widget.data.isSaved;
        if (heartState is HeartUpdatedState && heartState.experienceId == (widget.data.id ?? "")) {
          currentSaveStatus = heartState.isSaved;
        }

        return Hero(
          tag: "${HeroConstants.experienceCard}${widget.data.id ?? ""}",
          child: SwipeToToggle(
            showTutorial: widget.showTutorial,
            onToggle: () async {
              // Trigger HeartCubit to handle the save/unsave logic for swipe
              context.read<HeartCubit>().toggleSave(
                experienceId: widget.data.id ?? "",
                currentSaveStatus: currentSaveStatus, // Use the current status from cubit
              );

              widget.onHeratTapCallBack?.call();
            },
            overlay: _CircularHeartWidget(widget: widget, isFromSwap: true, currentSaveStatus: currentSaveStatus),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.theme.scaffoldBackgroundColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      AppNetworkImage(imageUrl: widget.data.thumbnail ?? "", height: 250, fit: BoxFit.cover),
                      LocationChip(location: widget.data.location ?? ""),
                      Align(
                        alignment: AlignmentGeometry.bottomCenter,
                        child: ExperienceCardFooter(
                          expId: widget.data.id ?? "",
                          interests: widget.data.interests?.map((e) => e.title ?? "").toList() ?? [],
                          bottomTileTitle: widget.data.title ?? "",
                          bottomTileSubText: widget.data.shortDescription ?? "",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: _CircularHeartWidget(widget: widget, currentSaveStatus: currentSaveStatus),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CircularHeartWidget extends StatelessWidget {
  final bool isFromSwap;
  final bool currentSaveStatus;
  const _CircularHeartWidget({required this.widget, this.isFromSwap = false, required this.currentSaveStatus});

  final ExperienceCard widget;

  @override
  Widget build(BuildContext context) {
    return CircularHeart(
      key: ValueKey(widget.data.id ?? ""),
      isSelected: (isFromSwap) ? !currentSaveStatus : currentSaveStatus,
      id: widget.data.id ?? "",
      onToggle: (isSaved) {
        widget.onHeratTapCallBack?.call();
      },
    );
  }
}
