import 'package:flutter/material.dart';

import 'historicocadastrado.dart';

class historico extends StatefulWidget {
  @override
  _historicoState createState() => _historicoState();
}

class _historicoState extends State<historico> {
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
                  "Histórico de Cliente",
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
              Container(
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
                      child: Text("Cliente",
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
                      child: Text("Data",
                          style: TextStyle(
                              color: Color(0xFF7697ce),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Expanded(
                        child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(_LarguraTela * 0.06, 0, 0, _alturaTela * 0.02),
                      child: Text("21 Nov.2021",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04)),
                    )
                    )
                  ]),
                  Row(children: <Widget>[
                    Expanded(
                        child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(_LarguraTela * 0.55,
                          _alturaTela * 0.01, _LarguraTela * 0.09, _alturaTela * 0.02),
                      child: Container(
                        height: _alturaTela * 0.04,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => historiodetalhes()));
                          },
                          child: Text(
                            "Detalhes",
                            style: TextStyle(
                                color: Color(0xFF88d1ce),
                                fontSize: _LarguraTela * 0.03),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Color(0xFF88d1ce))),
                          color: Color(0xFFededed),
                        ),
                      ),
                      ),
                    )
                  ]),
                ]),
              )
            ])),
       );
  }
}
