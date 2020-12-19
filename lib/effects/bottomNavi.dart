import 'package:flutter/material.dart';
import 'package:Recipe_App/screen/dashboard.dart';
import 'package:Recipe_App/screen/add_recipe.dart';
import 'package:Recipe_App/screen/profile.dart';
class BottomNavi extends StatefulWidget {
  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> with SingleTickerProviderStateMixin {
  String title = 'BottomNavigationBar';

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          DashboardPage(),
          AddRecipeScreen(),
          Profile()
         
        ],
        // If you want to disable swiping in tab the use below code
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        color: Color(0xff2222222),
        padding: EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
          child: Container(
            color: Colors.black26,
            child: TabBar(
              labelColor: Color(0xFFC41A3B),
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 10.0),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black54, width: 0.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              //For Indicator Show and Customization
              indicatorColor: Colors.black54,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  
                ),
                Tab(
                  icon: Icon(
                    Icons.add,
                    size: 24.0,
                  ),
                  
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                    
                  ),
                 
                ),
                
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
      
    );
  }
}

class RefreshIndicator extends StatefulWidget {
  @override
  _RefreshIndicatorState createState() => _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<RefreshIndicator> {
  Future<Null>getRefresh()async{
    await Future.delayed(Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body:ListView.builder(itemCount:500,itemBuilder:(context,index){
        return RefreshIndicator(
         
          );
        
      } )
    );
  }
}