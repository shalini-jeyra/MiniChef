// import 'package:flutter/material.dart';
// import 'package:Recipe_App/services/randomservice.dart';
// import 'package:Recipe_App/constants/random.dart';
// class Beverage extends StatefulWidget {
//   Beverage({Key key}) : super(key: key);
//   @override
//   _BeverageState createState() => _BeverageState();
// }
// class _BeverageState extends State<Beverage> {
//   Future<CategoryBeverages> futureBeve;
//   @override
//   void initState() {
//     super.initState();
//     futureBeve=fetchBeverages;
//   }
//   @override
 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<CategoryBeverages>(
//           future: futureBeve,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.separated(
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Center(
//                         child: Text(snapshot.data.name),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider(
//                       color: Colors.black,
//                     );
//                   },
//                   itemCount: 10);
//             } else
//               return Text('no category found');
//           },
//         ),
//       ),
//     );
//   }
// }

