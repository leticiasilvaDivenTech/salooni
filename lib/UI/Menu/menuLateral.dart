import 'dart:math';

import 'package:flutter/material.dart';
import 'package:salooni/UI//Menu/cliente.dart';
import 'package:salooni/UI//Menu/financeiro.dart';
import 'package:salooni/UI//Menu/historio.dart';
import 'package:salooni/UI//Menu/manutencao.dart';
import 'package:salooni/UI//Menu/parceiro.dart';
import 'package:salooni/UI//Menu/procedimentosCadastrados.dart';

import 'calendario.dart';
import 'menu.dart';

class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  double value = 0;
  Widget _showPage = new Menu();
  //Widget _showPage = new Menu();
  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9977ae),
                  Color(0xFF7697ce),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
              child: Container(
            width: 200.0,
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: Icon(
                        Icons.supervised_user_circle,
                        size: 75.0,
                      ),
                    ),
                    SizedBox(
                      height: 05.0,
                    ),
                    Expanded(
                      child: Text(
                        "Letícia Caroline da Silva",
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      leading: Image.asset("images/Clientes.png",
                          width: _LarguraTela * 0.08),
                      onTap: () {
                        setState(() {
                          _showPage = cliente();
                        });
                      },
                      title: Text(
                        "Clientes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = parceiros();
                        });
                      },
                      leading: Image.asset(
                        "images/Parceiros.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Parceiros",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = calendario();
                        });
                      },
                      leading: Image.asset(
                        "images/Calendario.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Calendário",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = historico();
                        });
                      },
                      leading: Image.asset(
                        "images/Historico.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Histórico",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = Menu();
                        });
                      },
                      leading: Image.asset(
                        "images/Relogio.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Agendamento do Dia",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = ProdedimentoCad();
                        });
                      },
                      leading: Image.asset(
                        "images/Procedimentos.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Procedimentos",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = financeiro();
                        });
                      },
                      leading: Image.asset(
                        "images/Procedimentos.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Financeiro",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _showPage = manutencao();
                        });
                      },
                      leading: Image.asset(
                        "images/Procedimentos.png",
                        width: _LarguraTela * 0.08,
                      ),
                      title: Text(
                        "Manutenção",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),
          TweenAnimationBuilder(
              curve: Curves.easeInSine,
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: _showPage));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
