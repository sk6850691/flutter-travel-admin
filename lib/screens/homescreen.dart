import 'package:flutter/material.dart';
import 'package:travel_admin/screens/createbikelisting.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(),

      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bikelisting()));


        },
      ),
    );
  }
}
