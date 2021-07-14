import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkMode extends ChangeNotifier {
  //Change Notifier é uma espécie de SetState porém para a parte de código.

  static DarkMode instance =
      DarkMode(); // Instanciando a classe nela mesmo como estática.
  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners(); //Notifica a outra .dart.
  }
}
