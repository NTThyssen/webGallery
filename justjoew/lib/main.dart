import 'package:flutter/material.dart';
import 'package:justjoew/cubit/section_cubit.dart';
import 'package:justjoew/repository/portfolio_repository.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/navigator/navigator.dart'; // Make sure AppRouter is correctly defined
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/theme_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.background, // Set the desired color
    systemNavigationBarIconBrightness:
        Brightness.light, // Choose icon brightness
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AssetRepository(),
      lazy: false,
      child: BlocProvider(
          create: (context) =>
              SectionCubit(RepositoryProvider.of<AssetRepository>(context))
                ..getAllSections(),
          child: MaterialApp.router(
            title: AppStrings.appName,
            theme: myTheme,
            routerConfig:
                AppRouter.router, // Ensure this is correctly configured
          )),
    );
  }
}
