import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/shared/theme.dart';
import 'package:quran_app/ui/pages/home_screen.dart';

import 'models/quran_models.dart';
import 'services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiServices>(
      create: (context) => ApiServices(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
