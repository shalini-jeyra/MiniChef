import 'package:flutter/material.dart';
import 'dart:ui';
class Glass extends StatelessWidget {
  final double hvalue;
  final double wvalue;
  final int cvalue;
  Glass({@required this.hvalue, @required this.wvalue, @required this.cvalue});
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //       blurRadius: 50,
        //       spreadRadius: 0,
        //       color: Color(0xff000000).withOpacity(0.2))
        // ]),
        child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16,
          sigmaY: 16,
        ),
        child: Container(
          height: hvalue,
          width: wvalue,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(cvalue).withOpacity(0.2),
              ),
              color: Color(cvalue).withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    ));
  }
}