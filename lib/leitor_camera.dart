import 'package:flutter/material.dart';
import 'package:camcode/cam_code_scanner.dart';

// ignore: camel_case_types
class Leitor_Camera extends StatefulWidget {
  const Leitor_Camera({Key? key}) : super(key: key);

  @override
  _Leitor_CameraState createState() => _Leitor_CameraState();
}

// ignore: camel_case_types
class _Leitor_CameraState extends State<Leitor_Camera> {
  String barcodeValue =
      'Press button to scan a barcode'; //Mostra a mensagem para a leitura do código de barras
  @override
  Widget build(BuildContext context) {
    barcodeValue = ModalRoute.of(context)?.settings.arguments as String? ??
        'Press button to scan a barcode';
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.scanner),
          onPressed: () => openScanner(context),
        ),
        appBar: AppBar(
          title: const Text('Testando a camera'),
        ),
        body: Center(
          child: Text(barcodeValue),
        ),
      ),
    );
  }

  void openScanner(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CamCodeScanner(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        refreshDelayMillis: 800,
        onBarcodeResult: (barcode) {
          Navigator.of(context).pushNamed('/home', arguments: barcode);
        },
      ),
    );
  }
}
