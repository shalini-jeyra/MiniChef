
import 'package:flutter/material.dart';
class AddRecipeScreen extends StatefulWidget {
  
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  var _catogories=['North Indian','Chinese','Desserts','South Indian','Snacks','Beverages'];
  var _currentItemSelected='North Indian';
  final _formKey =GlobalKey<FormState>();
  int selectedRadio;
  @override
  void initState(){
    super.initState();
    selectedRadio=0;
  }
  setSelectedRadio(int val){
    setState(() {
      selectedRadio=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Form(
                    key: _formKey,
                  child: Column(
              children:[
              Text(
                  'Add your own Recipes',
                  style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
  TextField(
   decoration: InputDecoration(
    labelText: 'Recipe Name',   
           ),
           ),
  ButtonBar(
             alignment:MainAxisAlignment.start,
              children: [
                Radio(value: 1, groupValue:selectedRadio,activeColor:Color(0xffBB4A20), onChanged: (val){
                  print("Radio $val");
                  setSelectedRadio(val);
                }),Text('Veg'),
                Radio(value: 2, groupValue: selectedRadio, activeColor:Color(0xffBB4A20),onChanged: (val){
                   print("Radio $val");
                  setSelectedRadio(val);
                }),Text('Non-Veg')
              ],
           ),          
   DropdownButtonFormField<String>(
     items: _catogories.map((String dropDownStringItem){
         return DropdownMenuItem<String>(
           value: dropDownStringItem,
           child: Text(dropDownStringItem),
         );
            }).toList(),onChanged: (String newValueSelected){
              setState(() {
                this._currentItemSelected=newValueSelected;
              });
            },
            value: _currentItemSelected,
   ),
   TextField(
   decoration: InputDecoration(
    labelText: 'Picture URL',   
           ),
           ),
           TextField(
   decoration: InputDecoration(
    labelText: 'Description',   
           ),
           ),
           TextField(
   decoration: InputDecoration(
    labelText: 'Incredients seperated by comma',   
           ),
           ),
           TextField(
   decoration: InputDecoration(
    labelText: 'Steps seperated by comma',   
           ),
           ),
           SizedBox(
                        height:30),
           RaisedButton(
                        child:Text(
                          'Add My Recipe '
                        ),
                        onPressed: ()
                        {
                            
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                           ),
                           color:Color(0xffA02305),
                           textColor: Colors.white,
                      )

            ]
          ),
                ),
        ),
        
    ),
      ));
  }
}
      