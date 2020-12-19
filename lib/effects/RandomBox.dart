import 'package:flutter/material.dart';
import 'package:Recipe_App/effects/glass.dart';
class  RandomBox extends StatelessWidget {
  final String randomName;
  final String randomPicture;
  RandomBox({@required this.randomName, @required this.randomPicture});
  @override
  Widget build(BuildContext context) {
    return Stack(
                children: [
                  Center(
                    child: Container(
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        image: DecorationImage(
                            image: NetworkImage(
                            randomPicture),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 120, 0, 0),
                    child: Stack(children: [
                      Glass(hvalue: 60, wvalue: 354, cvalue: 0xff000000),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Center(
                          child: Text(
                            randomName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              );
  }
}