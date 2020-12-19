import 'package:flutter/material.dart';
import 'dart:ui';
import 'glass.dart';
class Categorybox extends StatelessWidget {
  final String imageurl;
  final String ctext;
  Categorybox({@required this.imageurl, @required this.ctext});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 180,
            width: 151,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 124, 0, 0),
          child: Stack(children: [
            Glass(hvalue: 60, wvalue: 153, cvalue: 0xff000000),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
              child: Center(
                child: Text(
                  ctext,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}