import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
        child: Text('This is Profile Page',
        style: TextStyle(fontSize: 40),),
      ),);
  }
}