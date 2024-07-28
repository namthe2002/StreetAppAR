import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  Widget build(BuildContext) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
                user.email.toString(),
                style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}