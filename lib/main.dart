import 'package:online_cinema/Screens/Call%20Option.dart';
import 'package:flutter/material.dart';
import 'package:online_cinema/Screens/Video%20Players/Better%20Player/Pic_In_Pic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Cinema',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PictureInPicturePage() 
      // CallOption(),
    );
  }
}
