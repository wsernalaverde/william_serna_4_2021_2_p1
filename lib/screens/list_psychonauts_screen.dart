// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:william_serna_4_2021_2_p1/components/loader_component.dart';
import 'package:william_serna_4_2021_2_p1/helpers/constans.dart';
import 'package:william_serna_4_2021_2_p1/models/psychonauts.dart';

class ListPsychonautsScreen extends StatefulWidget {
  const ListPsychonautsScreen({Key? key}) : super(key: key);

  @override
  _ListPsychonautsScreenState createState() => _ListPsychonautsScreenState();
}

class _ListPsychonautsScreenState extends State<ListPsychonautsScreen> {
  List<Psychonauts> _psychonauts = [];
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
    _getPsychonauts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: _showLogo(),
        ),
        backgroundColor: Color(0xFF081617),
      ),
      body: Center(
        child: _showLoader
            ? LoaderComponent(
                text: 'Tierra llamando Psychonauts...',
              )
            : _showLogo(),
      ),
    );
  }

  Widget _showLogo() {
    return Image(
      image: AssetImage('assets/psychonauts-logo.png'),
      width: 160,
    );
  }

  void _getPsychonauts() async {
    setState(() {
      _showLoader = true;
    });

    var url = Uri.parse(Constans.apiUrl);
    var response = await http.get(url, headers: {
      'content-type': 'application/json',
      'accept': 'application/json'
    });

    setState(() {
      _showLoader = false;
    });

    var body = response.body;
    var decodedJson = jsonDecode(body);
    if (decodedJson != null) {
      for (var item in decodedJson) {
        _psychonauts.add(Psychonauts.fromJson(item));
      }
    }

    print(_psychonauts);
  }
}
