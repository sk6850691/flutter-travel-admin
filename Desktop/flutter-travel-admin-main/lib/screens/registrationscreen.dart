import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';
import 'package:travel_admin/providers/userprovider.dart';


import 'CreateListing.dart';
import 'HomeScreen.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  RoundedLoadingButtonController controller = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RegistrationScreen'),
      ),
      body: Center(
        child: RoundedLoadingButton(
          child: Text('Login With Google'),
          controller: controller , onPressed: (){
          userProvider.signInWithGoogle().then((value) {
            controller.success();
            Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateListing()));
          });
        },
        ),
      ),
    );

  }
}
