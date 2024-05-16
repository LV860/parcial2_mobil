import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcial/AppState.dart';
import 'package:provider/provider.dart';

class pantalla2 extends StatefulWidget {
  @override
  _pantalla2State createState() => _pantalla2State();
}

class _pantalla2State extends State<pantalla2> {

  List<List<int>> currentValue = List.generate(3, (_) => List.filled(3, 0));
  String _message = "";

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(appState.titulo),
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
                'SUDOKU VALIDATOR',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              buildSudokuGrid(),
              SizedBox(height: 16.0), // Add 16dp space
              Text(
                _message,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("${appState.jugador}: ${appState.puntuacion}"),
              ),
              SizedBox(height: 16.0), // Add 16dp space
              ElevatedButton(
                child: const Text("VALIDAR"),
                onPressed: () {
                  setState(() {
                    if (_validateSudoku()) {
                      _message = "El sudoku es válido";
                    } else {
                      _message = "El sudoku no es válido";
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: appState.sudokuCorrecto ? () => appState.resetGame() : null,
        label: Text('REINICIAR SUDOKU'),
        icon: Icon(Icons.refresh),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }

  void _updateButtonValue(int i, int j) {
    setState(() {
      currentValue[i][j]++;
      if (currentValue[i][j] > 9) currentValue[i][j] = 1;
    });
  }

  bool _validateSudoku() {
    // Implementación simplificada de la validación
    for (var row in currentValue) {
      var unique = row.toSet();
      if (unique.length != row.length || unique.contains(0)) {
        return false;
      }
    }

    for (int col = 0; col < 3; col++) {
      var columnSet = <int>{};
      for (int row = 0; row < 3; row++) {
        columnSet.add(currentValue[row][col]);
      }
      if (columnSet.length != 3 || columnSet.contains(0)) {
        return false;
      }
    }

    return true;
  }



  Widget buildSudokuGrid() {
    return Column(
      children: List.generate(3, (i) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (j) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => _updateButtonValue(i, j),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.all(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  currentValue[i][j].toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
