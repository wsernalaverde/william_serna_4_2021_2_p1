// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:william_serna_4_2021_2_p1/components/loader_component.dart';
import 'package:william_serna_4_2021_2_p1/models/psychonauts.dart';

class PsychonautScreen extends StatefulWidget {
  final Psychonauts psychonaut;

  PsychonautScreen({required this.psychonaut});

  @override
  _PsychonautScreenState createState() => _PsychonautScreenState();
}

class _PsychonautScreenState extends State<PsychonautScreen> {
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Stack(children: <Widget>[
              Text(
                'Profile',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 7
                      ..color = Color(0xFF02baf1)),
              ),
              Text(
                'Profile',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Color(0xFF000000)),
              ),
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFfdee03),
                ),
              ),
            ]),
          ),
          backgroundColor: Color(0xFF081617)),
      body: SingleChildScrollView(
        child: _showLoader
            ? LoaderComponent(
                text: 'Tierra llamando Psychonauts...',
              )
            : _showInfo(),
      ),
    );
  }

  Widget _showInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: FadeInImage(
                    placeholder: AssetImage('assets/logo-load-photo.png'),
                    image: NetworkImage(widget.psychonaut.img),
                    width: 80,
                    height: 80,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(children: <Widget>[
              Text(
                widget.psychonaut.name.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Color(0xFF107621)),
              ),
              Text(
                widget.psychonaut.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF000000),
                ),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                Stack(children: <Widget>[
                  Text(
                    widget.psychonaut.gender,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Color(0xFF107621)),
                  ),
                  Text(
                    widget.psychonaut.gender,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF000000),
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(children: <Widget>[
              Text(
                'Powers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 7
                      ..color = Color(0xFF02baf1)),
              ),
              Text(
                'Powers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Color(0xFF000000)),
              ),
              Text(
                'Powers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFfdee03),
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            _showListPowers(),
          ],
        ),
      ),
    );
  }

  Widget _showListPowers() {
    return Column(
      children: widget.psychonaut.psiPowers.map((item) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: FadeInImage(
                    placeholder: AssetImage('assets/logo-load-photo.png'),
                    image: NetworkImage(item.img),
                    width: 40,
                    height: 40,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Stack(children: <Widget>[
                    Text(
                      item.name.toUpperCase(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Color(0xFF107621)),
                    ),
                    Text(
                      item.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ]),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    color: Color(0xFF025151),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
