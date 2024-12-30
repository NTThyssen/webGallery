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
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Map devicePixelRatio to your backend's expected size categories
    int ratio;
    if (devicePixelRatio <= 1.0) {
      ratio = 112;
    } else if (devicePixelRatio <= 1.5) {
      ratio = 196;
    } else if (devicePixelRatio <= 2.0) {
      ratio = 256;
    } else if (devicePixelRatio <= 3.0) {
      ratio = 384;
    } else {
      ratio = 512;
    }
    return RepositoryProvider(
      create: (context) => AssetRepository(),
      lazy: false,
      child: BlocProvider(
          create: (context) => SectionCubit(
              RepositoryProvider.of<AssetRepository>(context), ratio)
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
