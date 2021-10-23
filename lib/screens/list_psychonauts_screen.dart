// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListPsychonautsScreen extends StatefulWidget {
  const ListPsychonautsScreen({Key? key}) : super(key: key);

  @override
  _ListPsychonautsScreenState createState() => _ListPsychonautsScreenState();
}

class _ListPsychonautsScreenState extends State<ListPsychonautsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _showLogo(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }

  Widget _showLogo() {
    return Image(
      image: AssetImage('assets/psychonauts-logo.png'),
      width: 180,
    );
  }
}
