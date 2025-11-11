import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/core/widgets/swipe_to_toggle.dart';
import 'package:travel_assign/modules/experience/bloc/experience_cubit.dart';
import 'package:travel_assign/modules/experience/model/experience_data_model.dart';
import 'package:travel_assign/modules/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/modules/experience/view/widgets/experience_card_footer.dart';
import 'package:travel_assign/modules/experience/view/widgets/location_chip.dart';

class ExperienceCard extends StatefulWidget {
  final VoidCallback onTap;
  final ExperienceDataModel data;
  final bool showTutorial;
  final void Function()? onHeratTapCallBack;
  final Future<bool> Function(String id)? onSaveToggle;
  const ExperienceCard({
    super.key,
    required this.onTap,
    required this.data,
    this.onHeratTapCallBack,
    this.showTutorial = false,
    this.onSaveToggle,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isSaving = false;
  @override
  Widget build(BuildContext context) {
    return SwipeToToggle(
      showTutorial: widget.showTutorial,
      onToggle: () async {
        if (_isSaving) return;
        setState(() {
          _isSaving = true;
        });

        bool status = false;
        if (widget.onSaveToggle != null) {
          status = await widget.onSaveToggle!(widget.data.id ?? "");
        } else {
          // Fallback to ExperienceCubit for backward compatibility
          final experienceCubit = context.read<ExperienceCubit>();
          status = await experienceCubit.toggleSaveExperience(id: widget.data.id ?? "");
        }

        if (status) {
          widget.onHeratTapCallBack?.call();
        }

        setState(() {
          _isSaving = false;
        });
      },
      overlay: _CircularHeartWidget(widget: widget, isFromSwap: true),
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
                Hero(
                  tag: widget.data.id ?? "",
                  child: AppNetworkImage(imageUrl: widget.data.thumbnail ?? "", height: 250, fit: BoxFit.cover),
                ),
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
                  child: _CircularHeartWidget(widget: widget),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularHeartWidget extends StatelessWidget {
  final bool isFromSwap;
  const _CircularHeartWidget({required this.widget, this.isFromSwap = false});

  final ExperienceCard widget;

  @override
  Widget build(BuildContext context) {
    return CircularHeart(
      key: ValueKey(widget.data.id ?? ""),
      isSelected: (isFromSwap) ? !widget.data.isSaved : widget.data.isSaved,
      id: widget.data.id ?? "",
      onToggle: (isSaved) {
        widget.onHeratTapCallBack?.call();
      },
      onSaveToggle:
          widget.onSaveToggle ??
          (id) async {
            final experienceCubit = context.read<ExperienceCubit>();
            return await experienceCubit.toggleSaveExperience(id: id);
          },
    );
  }
}
