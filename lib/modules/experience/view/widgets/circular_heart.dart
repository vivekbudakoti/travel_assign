import 'package:flutter/material.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/modules/experience/view/widgets/transluent_circle_avatar.dart';

class CircularHeart extends StatefulWidget {
  final bool? isSelected;
  final String id;
  final Function(bool isSaved)? onToggle;
  final Future<bool> Function(String id)? onSaveToggle;
  const CircularHeart({super.key, this.isSelected = false, required this.id, this.onToggle, this.onSaveToggle});

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
    _updateSelected();
    super.didUpdateWidget(oldWidget);
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
        if (widget.onSaveToggle != null) {
          status = await widget.onSaveToggle!(widget.id);
        }

        if (status) {
          _isSelected = !_isSelected;
          widget.onToggle?.call(_isSelected);
        }

        setState(() {
          _isSaving = false;
        });
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
