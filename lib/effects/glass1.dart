import 'package:flutter/material.dart';
import 'dart:ui';
class Glassalone extends StatelessWidget {
  final double hvalue;
  final double wvalue;
  final int cvalue;
  Glassalone(
      {@required this.hvalue, @required this.wvalue, @required this.cvalue});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
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