// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

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
  bool _isFiltered = false;
  String _search = '';

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
        actions: <Widget>[
          _isFiltered
              ? IconButton(
                  onPressed: _removeFilter, icon: Icon(Icons.filter_none))
              : IconButton(onPressed: _showFilter, icon: Icon(Icons.filter_alt))
        ],
      ),
      body: Center(
        child: _showLoader
            ? LoaderComponent(
                text: 'Tierra llamando Psychonauts...',
              )
            : _getContent(),
      ),
    );
  }

  Widget _showLogo() {
    return Image(
      image: AssetImage('assets/psychonauts-logo.png'),
      width: 160,
    );
  }

  Widget _getContent() {
    return _psychonauts.length == 0 ? _noContent() : getListView();
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

  _noContent() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/opps-psychonauts.png'),
              width: 250,
            ),
            SizedBox(height: 20),
            Stack(children: <Widget>[
              Text(
                _isFiltered
                    ? 'No hay Psychonauts con ese criterio de búsqueda'
                    : 'No hay Psychonauts disponibles.',
                textAlign: TextAlign.center,
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
                _isFiltered
                    ? 'No hay Psychonauts con ese criterio de búsqueda'
                    : 'No hay Psychonauts disponibles.',
                textAlign: TextAlign.center,
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
                _isFiltered
                    ? 'No hay Psychonauts con ese criterio de búsqueda'
                    : 'No hay Psychonauts disponibles.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFfdee03),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget getListView() {
    return ListView(
      children: _psychonauts.map((e) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(children: <Widget>[
                    Text(
                      e.name.toUpperCase(),
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
                      e.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ]),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _showFilter() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Stack(children: <Widget>[
              Text(
                'Filtrar PsychoNaut',
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
                'Filtrar PsychoNaut',
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
                'Filtrar PsychoNaut',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFfdee03),
                ),
              ),
            ]),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Escriba las primeras letras por la cuál quiere filtrar'),
                SizedBox(height: 20),
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Nombre del PsychoNaut',
                      labelText: 'Buscar',
                      suffixIcon: Icon(Icons.search)),
                  onChanged: (value) {
                    _search = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(onPressed: () => _filter(), child: Text('Filtrar'))
            ],
          );
        });
  }

  void _removeFilter() {
    setState(() {
      _isFiltered = false;
    });
    _getPsychonauts();
  }

  void _filter() {
    if (_search.isEmpty) {
      return;
    }

    List<Psychonauts> filteredList = [];
    for (var psychonaut in _psychonauts) {
      if (psychonaut.name.toLowerCase().contains(_search.toLowerCase())) {
        filteredList.add(psychonaut);
      }
    }

    setState(() {
      _psychonauts = filteredList;
      _isFiltered = true;
    });

    Navigator.of(context).pop();
  }
}
