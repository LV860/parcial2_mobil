import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parcial/AppState.dart';
import 'package:provider/provider.dart';

class pantalla1 extends StatefulWidget {
  @override
  _pantalla1State createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  final jugadorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PARCIAL 2'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add 16dp padding on all sides
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center children vertically
            children: <Widget>[
              Text(
                "SUDOKU VALIDATOR",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: jugadorController,
                decoration: InputDecoration(
                  hintText: 'Jugador 1',
                ),
              ),
              SizedBox(height: 16.0),
              Row( // Wrap buttons in a Row for horizontal placement
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
                children: <Widget>[
                  Expanded( // Stretch each button to fill available space
                    child: ElevatedButton(
                      child: Text("JUGAR"),
                      onPressed:() =>  _irPantalla2(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50), // make the button fit the width
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Add spacing between buttons (optional)
              Row( // Wrap buttons in a Row for horizontal placement
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text("VER PUNTAJES"),
                      onPressed: _irPantalla3,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50), // make the button fit the width
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _irPantalla2 (BuildContext context){
    String jugador = jugadorController.text;

    if (jugador.isNotEmpty ) {
      context.read<AppState>().jugador = jugador;
      context.read<AppState>().addJugador(jugador);
      //revisar si jugador ya existe y actualizar puntaje
      if (context.read<AppState>().jugadores.containsKey(jugador)) {
        int? score = context.read<AppState>().jugadores[jugador];
        context.read<AppState>().puntuacion = score!;
      }
      context.read<AppState>().resetGame();
      Navigator.of(context).pushNamed('/pantalla2');
    }

  }


  void _irPantalla3(){
    setState(() {
      Navigator.of(context).pushNamed('/pantalla3');
    });
  }
}
