// import 'package:flutter/material.dart';
// import 'package:Recipe_App/effects/glass.dart';
// import 'package:Recipe_App/services/randomservice.dart';
// import 'package:Recipe_App/constants/random.dart';
// class RecipeBox extends StatelessWidget {
//   final String recipeurl;
//     final String recipetext;
//     RecipeBox({@required this.recipeurl,@required this.recipetext});
//   @override
//   Widget build(BuildContext context) {    
//     return Stack(
//       children: [
//         Center(
//           child: Container(
//             height: 200,
//             width: 400,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(),
//               image: DecorationImage(
//                   image: NetworkImage(recipeurl), fit: BoxFit.cover),
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 124, 0, 0),
//           child: Stack(children: [
//             Glass(hvalue: 60, wvalue: 400, cvalue: 0xff000000),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
//               child: Center(
//                 child: Text(
//                   recipetext,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             )
//           ]),
//         ),
//       ],
//     );
//   }
// }
// class RecipePage extends StatefulWidget {
//   @override
//   _RecipePageState createState() => _RecipePageState();
// }

// class _RecipePageState extends State<RecipePage> {
//    Future <Mobile> futuremobile ;
//   @override
//   void initState(){
//     super.initState();
//     futuremobile=fetchRecipe();      }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: 
//              FutureBuilder<Mobile>(
//                 future: futuremobile,
//                 builder: (context, snapshot)
//                  {if(snapshot.hasData){
//                     return Stack(
//                       children: [
//                         Column(
//                           children: [
//                             RecipeBox(recipeurl: snapshot.data.picture,recipetext:snapshot.data.name ),
//                             Text(snapshot.data.description)
//                           ],
//                         ),
//                       ],
//                     );
//                  }
//                  else return Container(height: 10,width:10,);
//                 }
//               ),
        
//       ),
//     );
//   }
// }