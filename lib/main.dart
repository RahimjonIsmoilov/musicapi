import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapi/home_screen/bloc/bloc/music_search_bloc.dart';
import 'package:musicapi/home_screen/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicSearchBloc(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
      )
    );
  }
}
