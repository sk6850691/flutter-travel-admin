import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:travel_admin/providers/listingprovider.dart';
import 'package:travel_admin/providers/userprovider.dart';
import 'package:travel_admin/screens/registrationscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers:[
        ChangeNotifierProvider.value(value: UserProvider.intialize()),
        ChangeNotifierProvider.value(value: ListingProvider.initialize())
      ],child:MaterialApp(
        home: MyApp(),
      ),));




}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegistrationScreen();
  }
}


