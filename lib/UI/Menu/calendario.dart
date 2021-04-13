import 'package:flutter/material.dart';
import 'package:salooni/UI//Calendario/criarCalendario.dart';

import 'datacalendar.dart';

class calendario extends StatefulWidget {
  @override
  _calendarioState createState() => _calendarioState();
}

class _calendarioState extends State<calendario> {
  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              //Tab(icon: new Image.asset("images/icone7.png")),
              Padding(
                padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, 0, 0),
                child: Text(
                  "Calendário",
                  style: TextStyle(
                      color: Color(0xFF7697ce),
                      fontSize: _alturaTela * 0.04,
                      fontFamily: "Generic"),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    _LarguraTela * 0.6, _alturaTela * 0.03, 0, 0),
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Filtrar ",
                    style: TextStyle(
                      color: Color(0xFF9977ae),
                      fontFamily: "SaniTrixieSans",
                      fontSize: _LarguraTela * 0.05,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dataCalendar()));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.04, 0, _LarguraTela * 0.04, 0),
                  // padding: const EdgeInsets.fromLTRB(20, 10, 0, 150),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF575ba8)),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            _LarguraTela * 0.04,
                            _alturaTela * 0.02,
                            _LarguraTela * 0.4,
                            _alturaTela * 0.02),
                        child: Text("Parceiro(a)",
                            style: TextStyle(
                                color: Color(0xFF7697ce),
                                fontSize: _LarguraTela * 0.04)),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, _alturaTela * 0.02, 0, _alturaTela * 0.02),
                        child: Text("Letícia Caroline Silva",
                            style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04)),
                      ))
                    ]),
                    Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(_LarguraTela * 0.04, 0,
                            _LarguraTela * 0.4, _alturaTela * 0.02),
                        child: Text("Calendario",
                            style: TextStyle(
                                color: Color(0xFF7697ce),
                                fontSize: _LarguraTela * 0.04)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, 0, 0, _alturaTela * 0.02),
                        child: Text("Padrão",
                            style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04)),
                      )
                    ]),
                    Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            _LarguraTela * 0.04,
                            _alturaTela * 0.01,
                            _LarguraTela * 0.3,
                            _alturaTela * 0.02),
                        child: Text("Data da Criação",
                            style: TextStyle(
                                color: Color(0xFF7697ce),
                                fontSize: _LarguraTela * 0.04)),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.01,
                            _LarguraTela * 0.04, _alturaTela * 0.02),
                        child: Text("21 Nov.2020 ",
                            style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04)),
                      ))
                    ]),
                  ]),
                ),
              )
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CriarCalendario()));
            },
            tooltip: 'Criar calendário',
            backgroundColor: Color(0xFF575ba8),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.add,
                  size: 40,
                ))));
  }
}
