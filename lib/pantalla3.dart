import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:parcial/AppState.dart';


class pantalla3 extends StatefulWidget {
  @override
  _pantalla3State createState() => _pantalla3State();
}

class _pantalla3State extends State<pantalla3> {


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    // Convert the players map to a list of map entries and sort it by score
    var playersList = appState.jugadores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      appBar: AppBar(
        title: Text('PARCIAL 2'),
      ),
      body: ListView.builder(
        itemCount: playersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playersList[index].key + ': ${playersList[index].value}'),
          );
        },
      ),
    );
  }
}

