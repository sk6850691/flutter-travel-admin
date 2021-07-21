import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:travel_admin/providers/listingprovider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:travel_admin/providers/userprovider.dart';
import 'package:uuid/uuid.dart';
class Bikelisting extends StatefulWidget {
  const Bikelisting({Key key}) : super(key: key);

  @override
  _BikelistingState createState() => _BikelistingState();
}

class _BikelistingState extends State<Bikelisting> {

  ImagePicker picker = ImagePicker();
  File _pickedImage;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Uuid uuid = Uuid();



  FirebaseStorage storage = FirebaseStorage.instance;
  pickImage({String uid})async{
    picker.getImage(source: ImageSource.gallery).then((result) => {

      _pickedImage = File(result.path),



  });
        }



  @override
  Widget build(BuildContext context) {
    final listingprovider = Provider.of<ListingProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [

          TextField(
            decoration: InputDecoration(
              hintText: 'Seating Capacity'
            ),


            controller: listingprovider.seatingcapacitycontroller,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Price'
            ),
            controller: listingprovider.pricecontroller,
          ),
          TextField(
            decoration:  InputDecoration(
              hintText: 'BikeName'
            ),
            controller: listingprovider.bikenamecontroller,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Location'
            ),
            controller: listingprovider.locationcontroller,),
          MaterialButton(
              child:Text('Pick Image'),onPressed: (){
                pickImage(uid: userProvider.user.uid);
          }),
          MaterialButton(
              child: Text('Create Listing'),
              onPressed: (){

    Reference reference = FirebaseStorage.instance.ref().child('images/').child(uuid.v4().toString());
    UploadTask task = reference.putFile(_pickedImage);
    task.whenComplete(() {
    reference.getDownloadURL().then((url){
    firestore.collection('bikes').doc(userProvider.user.uid).update({
    "image":url
    });
    } );
    });


    listingprovider.createbikelisting(uid: userProvider.user.uid );

    })],
      ),
    );
  }}
