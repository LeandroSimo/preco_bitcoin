import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor = '0';

  _recuperaValor() async {
    String url = 'https://blockchain.info/ticker';

    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String resultado = retorno['BRL']['buy'].toString();

    setState(() {
      _valor = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/images/bitcoin.png'),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'R\$ ' + _valor,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          left: 30,
                          right: 30) // background
                      // foreground
                      ),
                  onPressed: _recuperaValor,
                  child: Text(
                    'Atualizar',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
