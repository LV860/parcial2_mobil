import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  String _titulo = "PARCIAL 2";
  int _contador  = 0;
  String _jugador = "";
  int _puntuacion = 0;

  List<String> buttonTexts = List.filled(9, '0');

  Map<String, int> _jugadores = {};

  bool _sudokuCorrecto = false;


  String get titulo => _titulo;
  int get contador => _contador;
  String get jugador => _jugador;
  int get puntuacion => _puntuacion;
  Map<String, int> get jugadores => _jugadores;
  bool get sudokuCorrecto => _sudokuCorrecto;

  set jugador (String nombre) {
    _jugador = nombre;
    notifyListeners();
  }
  set puntuacion (int puntos) {
    _puntuacion = puntos;
    notifyListeners();
  }

  void addPuntuacion(){
    _puntuacion++;
  }


  void addJugador(String nombreJugador) {
    if (!_jugadores.containsKey(nombreJugador)) {
      _jugadores[nombreJugador] = 0;
      //notifyListeners();
    }
  }

  void actualizarJugador(String nombreJugador) {
    if (_jugadores.containsKey(nombreJugador)) {
      _jugadores[nombreJugador] = (_jugadores[nombreJugador] ?? 0) + 1;
    }
  }

  void resetGame() {
    _sudokuCorrecto = false;
    buttonTexts = List.filled(9, '0');
    notifyListeners();
  }
}