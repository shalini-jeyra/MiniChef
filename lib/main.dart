import 'package:flutter/material.dart';
import 'package:Recipe_App/screen/login.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      // title: 'Flutter Login Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.black,
      // ),
      home: LogIn(),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogIn(),
    );
  }
}
