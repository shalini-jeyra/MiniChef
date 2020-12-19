import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:Recipe_App/screen/signup.dart';
import 'package:video_player/video_player.dart';
import 'package:Recipe_App/effects/bottomNavi.dart';
import 'dart:ui';
import 'signup.dart';

class LogIn extends StatefulWidget { 

  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
  VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/videos/Welcome.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

  // _getBackgroundColor() {
  //   return Container(
  //     color: Colors.blue.withAlpha(120),
  //   );
  // }

  _getLoginButtons() {
    return <Widget>[
      GestureDetector(
        onTap:(){
           Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SignupScreen()));
          print("Sign up tapped");
        },
              child: Stack(
          children: [
             
            glass(60,330 , 0xffffffff),         
           
          Padding(        
            padding: const EdgeInsets.fromLTRB(130, 20, 20, 20),
            
            child: Text('Sign up'),
                    ),     
           
          ],
        ),
      ),
      SizedBox(height:10),
        GestureDetector(
          onTap:(){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>LoginScreen()));
            print("Login Tapped");
          },
              child: Stack(
          children: [
            glass(60,330 , 0xffffffff),
          Padding(
            padding: const EdgeInsets.fromLTRB(130, 20, 20, 20),
            child: Text('Log in'),
          ),     
          ],
        ),
      ),
      SizedBox(height:70)
      
    ];
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        // Image(
        //   image: AssetImage("assets/images/white-logo.png"),
        //   width: 150.0,
        // ),
        SizedBox(
          height:160
        ),
        Text(
          "Mini Chef's",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
          alignment: Alignment.center,
          child: Text(
            "View and share recipes",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Spacer(),
        ..._getLoginButtons()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
            //_getBackgroundColor(),
            _getContent(),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Login.jpg"),
                fit: BoxFit.cover)
            )
          ),
          Center(child: Stack(
                      children:[glass(
              260,300,0xffffffff),
                    
          Container(
            height:260,
            width:300,
            padding:EdgeInsets.all(16),
            child: Form(
              key:_formKey,
              child: SingleChildScrollView(
                child:Column(
                  children: [
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
                    SizedBox(
                      height:30),                    
                    RaisedButton(
                      child:Text(
                        'Login'
                      ),
                      onPressed: ()
                      {
                       final form = _formKey.currentState;
                       form.save();
                       if (form.validate()) {
                    print("$_email $_password");
                    // Provider.of<AuthService>(context).loginUser(_email, _password);
                    Navigator.push(context,
              MaterialPageRoute(builder: (context)=>BottomNavi()));
                       }
                        else print('invalid email or password');
                        
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
                      ]))
          
        ],)
      
    );
  }
}