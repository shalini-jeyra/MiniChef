import 'package:Recipe_App/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:Recipe_App/effects/glass1.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return Container(
      
      child:Stack (
              children:[ 
                Glassalone(hvalue: 800, wvalue: 420, cvalue: 0xff222222),
                Center(
                child: RaisedButton(
          child:Text('LogOut'),
          onPressed: (){                  
                        Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>LogIn()));
                           },
                           shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                           ),
                           color:Color(0xffA02305),
                           textColor: Colors.white,
                           
        
    ),
              ),]
      ));
  }
}