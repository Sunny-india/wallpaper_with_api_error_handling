import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_with_bloc/api/api_helper.dart';
import 'package:wallpaper_with_bloc/blocs/wallpaper_bloc/wallpaper_bloc.dart';
import 'package:wallpaper_with_bloc/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WallpaperBloc>(
            create: (context) => WallpaperBloc(apiHelper: APIHelper()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper App',
        theme: ThemeData(primaryColor: Colors.deepPurple),
        home: SplashScreen(),
      ),
    );
  }
}
