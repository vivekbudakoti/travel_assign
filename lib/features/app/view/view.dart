import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/routes/router.dart';
import 'package:travel_assign/features/app/bloc/theme_cubit.dart';
import 'package:travel_assign/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Travel Assign',
            theme: context.read<ThemeCubit>().getTheme,
            localizationsDelegates: const [AppLocalizations.delegate],
            supportedLocales: const [Locale('en')],
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
