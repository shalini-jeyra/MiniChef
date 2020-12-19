

import 'package:Recipe_App/effects/RandomBox.dart';
import 'package:Recipe_App/effects/glass1.dart';
// import 'package:Recipe_App/screen/recipepage.dart';
import 'package:flutter/material.dart';

import 'package:Recipe_App/effects/Category.dart';
import 'package:Recipe_App/services/randomservice.dart';
import 'package:Recipe_App/constants/random.dart';
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  
  Future <Mobile> futuremobile ;
  @override
  void initState(){
    super.initState();
    futuremobile=fetchRecipe();
      }
      
  TextEditingController textEditingController = new TextEditingController();
  int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),            
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xff222222),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,30,0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white)),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          if (textEditingController.text.isNotEmpty) {
                            print('just do it');
                          } else {
                            print('dont do it');
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
         
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,0,0),
              child: Text(
                'Try Something Random Today..',
                style: TextStyle(color: Color(0xffBB4A20), fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            
            GestureDetector(
              onTap: () {
                setState(() {
                  //  Navigator.push(context,
                  //     MaterialPageRoute(builder: (context)=>RecipePage()));
                  print('random recipe tapped');
                  
                  
                });
              },
              child: Container(
                child: FutureBuilder<Mobile>(
                  future: futuremobile,
                  builder: (context, snapshot)
                   {if(snapshot.hasData){
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30,0,25,0),
                            child: Glassalone(hvalue: 350, wvalue: 350, cvalue: 0xffffffff),
                          ),
                          Column(
                            children: [
                              RandomBox(randomName: snapshot.data.name, randomPicture: snapshot.data.picture),
                              SizedBox(height:10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,240,0),
                                child: Text("Description:",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50,5,50,0),
                                child: Text(snapshot.data.description,style: TextStyle(color: Colors.white,fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,5,80,0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Type:',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                        SizedBox(width:10),
                                        Text(snapshot.data.type,style: TextStyle(color: Colors.white,fontSize: 14),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //     Text(snapshot.data.category)
                              //   ],
                              // ),
                              
                              
                            
                            ],
                          ),
                        ],
                      );

                   }
                   else return Container(height: 10,width:10,);
                  }
                ),
              ),
            ), 
            
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,0,0,0),
              child: Text('Categories',
                  style: TextStyle(
                    color: Color(0xffBB4A20),
                    fontSize: 20,
                  )),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (
                    
                  ) {
                    setState(() {
                      print('box 1 tapped');
                      
                    });
                  },
                  child: Categorybox(
                      imageurl:
                          'https://images.ctfassets.net/uld4p9k0kh49/1lXyS3U5uDcpJBCL1XZ8jX/f8cfcea894e73fa8a9868d910b8fbf33/iStock-502819023.jpg',
                      ctext: 'Chinese'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print('box 2 tapped');
                    });
                  },
                  child: Categorybox(
                      imageurl:
                          'https://miro.medium.com/max/2400/1*InlgltnGNwj7W93dJ_oQ_g.jpeg',
                      ctext: 'South Indian'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print('box 3 tapped');
                    });
                  },
                  child: Categorybox(
                      imageurl:
                          'https://i.pinimg.com/originals/e2/73/57/e273577dbb39868e00cf5519cd86f4a7.jpg',
                      ctext: 'Snacks',),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print('box 4 tapped');
                    });
                  },
                  child: Categorybox(
                      imageurl:
                          'https://files.heftycdn.com/wp-content/uploads/2019/04/c7f06b4bce72dbd0b84240982f2166dc-800x457.jpg',
                      ctext: 'Desserts',),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print('box 5 tapped');
                    });
                  },
                  child: Categorybox(
                      imageurl:
                          'https://www.foodofy.com/wp-content/uploads/2015/07/11015_14_site_clear.jpeg',
                      ctext: 'North Indian'),
                ),
                GestureDetector(
                  onTap: () {
                    
                    setState(() {
                      print('box 6 tapped');
                    });
                  },
                  child: Categorybox(
                      imageurl:
                          'https://i.ndtvimg.com/i/2016-05/fruit-punch_625x350_51464003631.jpg',
                      ctext: 'Beverages'),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            )
            // )
          ]))
        ],
      ),
   
       
    );
  }
}

class TODO{
  final String rname;
  final String rpicture;
    final String rcategory;
    final List<String> ringredients;
    final String rtype;
    final List<String> rsteps;
    final String rownerId;
    final String rdescription;
    final int ritemId;
    final String rvideo;
    TODO(this.rname,this.rpicture,this.rcategory,this.ringredients,this.rtype,this.rsteps,this.rownerId,this.rdescription,this.ritemId,this.rvideo);
    
}










