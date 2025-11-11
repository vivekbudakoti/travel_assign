import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/modules/app/bloc/heart/heart_cubit.dart';
import 'package:travel_assign/core/theme/colors.dart';
import 'package:travel_assign/core/utils/extension.dart';
import 'package:travel_assign/modules/app/bloc/heart/heart_state.dart';
import 'package:travel_assign/modules/experience/view/widgets/transluent_circle_avatar.dart';

class CircularHeart extends StatelessWidget {
  final bool isSelected;
  final String id;
  final Function(bool isSaved)? onToggle;

  const CircularHeart({super.key, this.isSelected = false, required this.id, this.onToggle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeartCubit, HeartState>(
      buildWhen: (previous, current) {
        // Only rebuild if the state change is for this specific experience
        if (current is HeartLoadingState) {
          return current.experienceId == id;
        }
        if (current is HeartUpdatedState) {
          return current.experienceId == id;
        }
        return false;
      },
      builder: (context, state) {
        bool currentSaveStatus = isSelected;
        bool isLoading = false;

        // Update the save status based on HeartCubit state
        if (state is HeartUpdatedState && state.experienceId == id) {
          currentSaveStatus = state.isSaved;
        } else if (state is HeartLoadingState && state.experienceId == id) {
          isLoading = true;
        }

        return TransluentCircleAvatar(
          onTap: () async {
            if (isLoading) return;

            // Use HeartCubit to toggle save status
            context.read<HeartCubit>().toggleSave(experienceId: id, currentSaveStatus: currentSaveStatus);

            // Call the callback if provided
            onToggle?.call(!currentSaveStatus);
          },
          child: isLoading
              ? const CircularProgressIndicator(strokeWidth: 2)
              : Icon(
                  currentSaveStatus ? Icons.favorite_rounded : Icons.favorite_outline,
                  color: currentSaveStatus ? AppColors.secondaryText : context.colorScheme.onTertiary,
                ),
        );
      },
    );
  }
}
