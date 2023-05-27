import 'package:aplicativo_com_api/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
TextEditingController _nome = TextEditingController();
TextEditingController _saldo = TextEditingController();
TextEditingController _renda = TextEditingController();
List<String> movimentacoes= [];
var nome;
int saldo = 0;
int renda = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Financeiro'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nome,
              decoration: InputDecoration(
                label: Text('Nome'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              )),
              SizedBox(
              height: 5,
            ),
            TextField(
              controller: _saldo,
              decoration: InputDecoration(
                label: Text('Patrimonio'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              )),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _renda,
              decoration: InputDecoration(
                label: Text('Renda Mensal'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              nome = _nome.text;
              saldo = (_saldo.text != '' ? int.parse(_saldo.text) : 0) ;
              print(saldo);
              
              renda =  (_renda.text != '' ? int.parse( _renda.text) : 0);
              print(renda);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Inicio(nome: nome, saldo: saldo, renda: renda, movimentacoes: movimentacoes,)));
            },
            child: Text('Entrar'),
            
            )
          ],
        ),
        ),
    );
  }
}