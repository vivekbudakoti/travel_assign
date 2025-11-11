import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/core/widgets/network_image.dart';
import 'package:travel_assign/core/widgets/swipe_to_toggle.dart';
import 'package:travel_assign/modules/experience/model/experience_data_model.dart';
import 'package:travel_assign/modules/experience/view/widgets/circular_heart.dart';
import 'package:travel_assign/modules/experience/view/widgets/experience_card_footer.dart';
import 'package:travel_assign/modules/experience/view/widgets/location_chip.dart';
import 'package:travel_assign/modules/saved_experiences/repo/saved_experience_repo.dart';

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
        final id = widget.data.id ?? "";
        if (!widget.data.isSaved) {
          status = await SavedExperienceRepo.instance.saveExperiences(id: id);
        } else {
          status = await SavedExperienceRepo.instance.removeSavedExperiences(id: id);
        }
        if (status) {
          widget.data.isSaved = !widget.data.isSaved;
          widget.onHeratTapCallBack?.call();
        }
        _isSaving = false;
        setState(() {});
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
        widget.data.isSaved = isSaved;
        widget.onHeratTapCallBack?.call();
      },
    );
  }
}
