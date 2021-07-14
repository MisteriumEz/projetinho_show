import 'package:flutter/material.dart';
import 'package:projetinho_show/dark_mode.dart';
import 'package:projetinho_show/leitor_camera.dart';
import 'package:projetinho_show/login_page.dart';

import 'home_app.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: DarkMode.instance,
        builder: (context, child) {
          return MaterialApp(
            //Responsável por buildar a tela, e dar a aparência de aplicativo.
            title: 'Telinha Show',
            theme: ThemeData(
              //Tema que é usado.
              primarySwatch: Colors.deepOrange, //Cor primaria do app
              brightness: DarkMode.instance
                      .isDarkTheme //Verificador para com o Switch da home_app.dart que faz com que ative o modo noturno
                  ? Brightness.dark //Tema noturno
                  : Brightness.light, //Tema normal
            ),
            routes: <String, WidgetBuilder>{
              '/': (context) => LoginPage(),
              '/home': (context) =>
                  MyHomePage(title: "Testadinha show, my family"),
              '/camscanner': (context) => Leitor_Camera(),
            },
          );
        });
  }
}
