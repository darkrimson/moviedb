import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_page.dart';
import 'package:themoviedb/widgets/main/main_page.dart';
import 'package:themoviedb/widgets/movie_datails/movie_details_page.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarkBlue),
      ),
      routes: {
        '/auth_page': (context) => const AuthPage(),
        '/main_page': (context) => const MainPage(),
        '/main_page/movie_details': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments;
          if (arguments is int) {
            return MovieDetailsPage(
              movieId: arguments,
            );
          } else {
            return const MovieDetailsPage(
              movieId: 0,
            );
          }
        }
      },
      initialRoute: '/auth_page',
    );
  }
}
