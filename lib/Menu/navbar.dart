import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:salooni/Menu/calendario.dart';
import 'package:salooni/Menu/cliente.dart';
import 'package:salooni/Menu/historio.dart';
import 'package:salooni/Menu/parceiro.dart';
import 'package:salooni/Menu/procedimentosCadastrados.dart';

import 'menu.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _pageIndex = 4;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final  _pageManu  = new Menu();
  final  _pageCalendario  = new calendario();
  final  _pageCliente  = new cliente();
  final  _pageHistorico  = new historico();
  final  _pageParceiro  = new parceiros();
  final _pageProcedimento = new ProdedimentoCad();

  Widget _showPage = new Menu();
  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _pageCliente;
        break;
        case 1:
      return _pageParceiro;
      break;
      case 2:
        return _pageCalendario;
        break;
      case 3:
        return _pageHistorico;
        break;
      case 4:
        return _pageManu;
        break;
      case 5:
        return _pageProcedimento;
        break;
      default:
        return Container(
          child: Text("Padrão")
        );

    }
  }

  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _pageIndex,
          height: _alturaTela*0.08,
          items: <Widget>[
        Image.asset(
        "images/Clientes.png",
          width: _LarguraTela * 0.08,

        ),
        Image.asset(
          "images/Parceiros.png",
          width: _LarguraTela * 0.08,

        ),
            Image.asset(
              "images/Calendario.png",
              width: _LarguraTela * 0.08,

            ),
            Image.asset(
              "images/Historico.png",
              width: _LarguraTela * 0.08,

            ),
            Image.asset(
              "images/Relogio.png",
              width: _LarguraTela * 0.08,

            ),
            Image.asset(
              "images/Procedimentos.png",
              width: _LarguraTela * 0.08,

            ),
          ],
          color: Color(0xFF7697ce),
          buttonBackgroundColor: Color(0xFF7697ce),
          backgroundColor: Color(0xFFededed),
         animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Color(0xFFededed),
          child: Center(
            child:_showPage
          ),
        ));
  }
}