import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_admin/providers/userprovider.dart';
class CreateHomeStay extends StatefulWidget {

final collectionName;
  const CreateHomeStay({Key key,this.collectionName}) : super(key: key);

  @override
  _CreateHomeStayState createState() => _CreateHomeStayState();
}

class _CreateHomeStayState extends State<CreateHomeStay> {

  String description = '';
  int price = 0;
  String location = '';
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SingleChildScrollView(
      child: Column(

        children: [

          TextFormField(
            onChanged: (value){

              description = value;
            },

          ),
          TextFormField(
            onChanged: (value){
              location = value;

            },
          ),
          TextFormField(
            onChanged: (value){
              String tmp = value;
              price = tmp as int;

            },
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: (){

              FirebaseFirestore.instance.collection(widget.collectionName).doc().set({

                "id":userProvider.getuid(),
                "description": description,
                "price":price,
                "location":location
              });



            },
            child: Text('Submit'),
          )


        ],
      ),
    );
  }
}
