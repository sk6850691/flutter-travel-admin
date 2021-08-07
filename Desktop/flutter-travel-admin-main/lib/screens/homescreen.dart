import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel_admin/screens/createbikelisting.dart';
import 'package:travel_admin/screens/mylistings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _currentIndex = 0;
  onTap(index){
    setState(() {
      pageController.animateToPage(index,duration: Duration(microseconds: 12),curve: Curves.bounceOut);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          onTap(index);
        },
        items: [
          CustomNavigationBarItem(icon: Icon(Icons.home)),
          CustomNavigationBarItem(icon: Icon(Icons.access_time_outlined))
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          MyListings()



        ],
        onPageChanged: (index){
          setState(() {

            _currentIndex =index;
          });

        },
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bikelisting()));


        },
      ),
    );
  }
}
