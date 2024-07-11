import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/ui/news_detail_screen.dart';
import 'package:news_app/ui/news_listing_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News app',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: News_detail_screen()
            home: News_listing_screen());
      },
    );
  }
}
