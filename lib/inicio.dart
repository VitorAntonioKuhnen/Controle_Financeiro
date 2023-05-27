import 'dart:convert';

import 'package:aplicativo_com_api/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Inicio extends StatefulWidget {
  final List<String> movimentacoes;
  var nome;
  int saldo;
  int renda;

  Inicio(
      {Key? key,
      required this.nome,
      required this.saldo,
      required this.renda,
      required this.movimentacoes})
      : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController _depositar = TextEditingController();
  TextEditingController _resgatar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Financeiro'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.cyan,
                  Colors.lightBlueAccent,
                  Colors.cyanAccent.shade700
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nome: ' + nome),
                Text('Renda Mensal: ' + renda.toString()),
                SizedBox(width: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Saldo:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'R\$ ' + saldo.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Informe um Valor de Depósito'),
                                content: TextField(controller: _depositar),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _depositar.clear();
                                      },
                                      child: Text('Cancelar')),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          movimentacoes.add(_depositar.text);
                                          saldo =
                                              saldo + int.parse(_depositar.text);
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'Depósito Adicionado com Sucesso!!'),
                                          duration: Duration(seconds: 2),
                                        ));
                                        Navigator.pop(context);
                                        _depositar.clear();
                                      },
                                      child: Text('Depositar')),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        'Depositar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Resgatar valor'),
                            content: TextField(controller: _resgatar),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _resgatar.clear();
                                  },
                                  child: Text('Cancelar')),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      movimentacoes.add('-' + _resgatar.text);
                                      saldo = saldo - int.parse(_resgatar.text);
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Valor Resgatado com Sucesso!!'),
                                      duration: Duration(seconds: 2),
                                    ));
                                    Navigator.pop(context);
                                    _resgatar.clear();
                                  },
                                  child: Text('Resgatar')),
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Resgatar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: movimentacoes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('R\$ ' + movimentacoes[index]),
                      subtitle: Text('Gastos Aleatórios'),
                      // trailing: IconButton(
                      //     onPressed: () {
                      //       // setState(() {
                      //       //   saldo.add(movimentacoes[index]);
                      //       //   saldo.removeAt(index);
                      //       // }
                      //       // );
                      //       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       //   content: Text('Movimentação Deletada!!'),
                      //       //   duration: Duration(seconds: 2),
                      //       // )
                      //       // );
                      //     },
                      //     icon: Icon(Icons.delete)),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
