import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:weather/data/datasource/api_repository_impl.dart';
import 'package:weather/presentation/common/app_colors.dart';
import 'package:weather/presentation/home/home_bloc.dart';
import 'package:weather/presentation/home/home_screen.dart';

void main() async {
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBLoC(repository: ApiRepositoryImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: AppColors.primaryColor,
          appBarTheme: AppBarTheme(elevation: 0.0),
          scaffoldBackgroundColor: Colors.white,
          hintColor: Colors.white30,
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
        ),
        title: 'WeatherApp',
        home: HomeScreen(),
      ),
    );
  }
}
