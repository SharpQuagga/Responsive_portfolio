import 'package:flutter/material.dart';
import 'package:web_test/smallScreen/phone_main.dart';
import 'responsive_widget.dart';
import 'profiles_page.dart';
import 'smallScreen/phone_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Darsbir Singh',
      theme: ThemeData(
        fontFamily: "MeriendaOne",
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
      ),
      home:ResponsiveWidget(
        largeScreen: ProfilePage(),
      mediumScreen: Activity(),
      smallScreen: Activity(),)
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
          ],
        ),
      ), 
    );
  }
}
