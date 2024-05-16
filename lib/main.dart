import 'package:flutter/material.dart';
import 'package:parcial/pantalla1.dart';
import 'package:parcial/pantalla2.dart';
import 'package:parcial/pantalla3.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'AppState.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AppState()),
          ],
          child:
          MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            initialRoute: "/pantalla1",
            routes: {
              '/pantalla1': (context) => pantalla1(),
              '/pantalla2': (context) => pantalla2(),
              '/pantalla3': (context) => pantalla3(),
            },
          )
      )
  );
}
