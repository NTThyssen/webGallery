import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justjoew_admin/cubit/section_cubit.dart';
import 'package:justjoew_admin/pages/admin_page.dart';
import 'package:justjoew_admin/repository/asset_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
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
