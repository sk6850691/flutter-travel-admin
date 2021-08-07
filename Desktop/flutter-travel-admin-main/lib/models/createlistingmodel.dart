import 'package:cloud_firestore/cloud_firestore.dart';

class CreateListingModel{

  static const DESCRIPTION = "description";
  static const IMAGE = "image";


  String _image;
  String _description;

  get image =>_image;
  get description=> _description;


  CreateListingModel.fromSnapshot(DocumentSnapshot snapshot){

    _image = snapshot.data()['image'];
    _description = snapshot.data()['description'];


  }

}