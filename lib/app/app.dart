import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:splash/app/photo_repository.dart';

import 'bloc/app_bloc.dart';
import 'home/home_page.dart';

class App extends StatelessWidget {
  final PhotoRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: "Splash",
      home: BlocProvider(
        create: (_) => AppBloc(repository: repository),
        child: HomePage(),
      ),
    );
  }
}
