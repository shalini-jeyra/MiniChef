import 'package:Recipe_App/effects/bottomNavi.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  Container glass(double hvalue, double wvalue, int cvalue) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 50,
              spreadRadius: 2,
              color: Color(0xff000000).withOpacity(0.2))
        ]),
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
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ));
  }

  final GlobalKey<FormState> _formKey=GlobalKey();   
  String _password;
  String _email;
  TextEditingController _passwordController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body:Stack(
        children: [
          Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Signup.jpg"),
                fit: BoxFit.cover)
            )
          ),
          Center(child:
           Stack(
            children:[ glass(
              350,300,0xffffffff),               
           Container(
             
                height:350,
            width:300,
            padding:EdgeInsets.all(16),
            child: Form(
              key:_formKey,
              child: SingleChildScrollView(
                child:Column(
                  children: [
                     TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      cursorColor: Colors.black,
                       validator: (value)
                      {
                        if(value.isEmpty )
                        {
                          return 'invalid Username';

                        }
                        return null;
                      },
                      onSaved: (value)
                      {

                      }
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value)
                      {
                        if(value.isEmpty || !value.contains('@'))
                        {
                          return 'invalid email';

                        }
                        return null;
                      },
                      onSaved: (value) => _email = value,
                      
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      cursorColor: Colors.black,
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value)
                      {
                        if(value.isEmpty || value.length<=5)
                        {
                          return 'invalid password';
                        }
                        return null;
                      },
                      onSaved: (value)=>_password = value,
                     
                    ),

                    
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Confirm Password'),
                      cursorColor: Colors.black,
                      obscureText: true,
                      validator: (value)
                      {
                        if(value.isEmpty || value !=_passwordController.text)
                        {
                          return 'invalid password';
                        }
                        return null;
                      },
                      onSaved: (value)
                      {

                      },
                    ),
                    SizedBox(
                      height:20),                    
                    RaisedButton(
                      child:Text(
                        'SignUp'
                      ),
                      onPressed: ()
                      {
                        final form = _formKey.currentState;
                      form.save();  
                 if (form.validate()) {
                 print("$_email $_password");
                 Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>BottomNavi()));
                      }
                      else print('fill all details');
                          
                          
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                         ),
                         color:Color(0xffA02305),
                         textColor: Colors.white,
                    )
                  ],) ,),
            ),

          ),
            ]
          ),
          )
        ],)
      
    );
  }
}