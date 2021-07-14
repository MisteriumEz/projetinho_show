import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projetinho_show/dark_mode.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var floatingActionButton2 = FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
    var ElevatedButton2 = ElevatedButton(
      onPressed: () {
        print("Abriu a camera");
        Navigator.of(context).pushReplacementNamed('/camscanner');
      },
      child: Text('Camera Usage'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [CustomSwitch()],
      ),
      drawer: Drawer(
        child: Column(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // Colunas
          mainAxisAlignment: MainAxisAlignment.center, //Alinhamento principal
          //crossAxisAlignment: CrossAxisAlignment.center, //Alinhamento de itens únicos
          children: [
            Text('Contador: $_counter'),
            Container(
                height:
                    20), //Containers utilizados para fazer a separação visual.
            Text('Só pra testar'),
            Container(height: 50),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, //Alinhamento Principal
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Alinhamento de cada item
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                )
              ],
            ),
            //Scanner(),
            ElevatedButton2,
          ],
          //Centraliza as caixinhas na tela
        ),
      ),
      /*  child: Container( //Cpntainer contendo a caixinha preta
          height: 200,
          width: 200, 
          color: Colors.black,
          child: Center( // Centraliza dentro do Container preto 
            child: Container( //Inicia a caixinha verde
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
        ),
        /*  child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),*/
      ),*/
      floatingActionButton:
          floatingActionButton2, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//As states podem ser consideradas como as procedures do Delphi ou as Func do Swift, ambas podem ser chamadas,
//Com o bônus da orientação a objeto que permite que ela seja chamada por outras .dart.
class CustomSwitch extends StatelessWidget {
  //Botão que é chamado para construção
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: DarkMode
            .instance.isDarkTheme, //Atribui value ao booleano da dark_mode.dart
        onChanged: (value) {
          //Quando o Switch for utilizado
          DarkMode.instance.changeTheme();
        });
  }
}

class Scanner extends StatelessWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Abriu a camera");
        Navigator.of(context).pushReplacementNamed('/camscanner');
      },
      child: Text('Camera Usage'),
    );
  }
}
