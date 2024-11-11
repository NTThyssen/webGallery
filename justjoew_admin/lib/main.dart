import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justjoew_admin/cubit/section_cubit.dart';
import 'package:justjoew_admin/pages/admin_page.dart';
import 'package:justjoew_admin/repository/asset_repository.dart';
import 'package:justjoew_admin/utils/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'JustJoew admin',
        theme: myTheme,
        home: RepositoryProvider(
          create: (context) => AssetRepository(),
          lazy: false,
          child: BlocProvider(
            create: (context) => SectionCubit(RepositoryProvider.of<AssetRepository>(context))..getAllSections(),
            child: const AdminPage(),
          ),
        ));
  }
}
