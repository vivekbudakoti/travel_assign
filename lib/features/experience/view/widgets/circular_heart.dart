import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/features/experience/view/widgets/transluent_circle_avatar.dart';
import 'package:travel_assign/features/saved_experiences/repo/repo.dart';

class CircularHeart extends StatefulWidget {
  final bool? isSelected;
  final String id;
  final Function(bool isSaved) onToggle;
  const CircularHeart({super.key, this.isSelected = false, required this.id, required this.onToggle});

  @override
  State<CircularHeart> createState() => _CircularHeartState();
}

class _CircularHeartState extends State<CircularHeart> {
  bool _isSaving = false;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _updateSelected();
  }

  @override
  void didUpdateWidget(covariant CircularHeart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      _updateSelected();
    }
  }

  void _updateSelected() {
    _isSelected = widget.isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TransluentCircleAvatar(
      onTap: () async {
        if (_isSaving) return;
        setState(() {
          _isSaving = true;
        });
        bool status = false;
        final id = widget.id;
        if (!_isSelected) {
          status = await SavedExperienceRepo().saveExperiences(id: id);
        } else {
          status = await SavedExperienceRepo().removeSavedExperiences(id: id);
        }
        if (status) {
          _isSelected = !_isSelected;
          widget.onToggle(_isSelected);
        }
        _isSaving = false;
        setState(() {});
      },
      child: _isSaving
          ? const CircularProgressIndicator(strokeWidth: 2)
          : Icon(
              _isSelected == true ? Icons.favorite_rounded : Icons.favorite_outline,
              color: _isSelected == true ? AppColors.secondaryText : context.colorScheme.onTertiary,
            ),
    );
  }
}
