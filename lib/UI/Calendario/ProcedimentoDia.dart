import 'package:flutter/material.dart';

class ProcedimentoDia extends StatefulWidget {
  @override
  _ProcedimentoDiaState createState() => _ProcedimentoDiaState();
}

class _ProcedimentoDiaState extends State<ProcedimentoDia> {
  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0.03, _alturaTela * 0.09, 0, 0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Image.asset(
                            "images/azul.png",
                            width: _LarguraTela * 0.08,
                            height: _alturaTela * 0.08,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, _alturaTela * 0.1, _LarguraTela * 0.2, 0),
                        child:  Text(
                          "Procedimentos do Dia",
                          style: TextStyle(
                              color: Color(0xFF7697ce),
                              fontSize: _alturaTela * 0.04,
                              fontFamily: "Generic"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ]),


              Padding(
                padding: EdgeInsets.fromLTRB(
                    _LarguraTela * 0.6, _alturaTela * 0.03, 0, 0),
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Filtrar ",
                    style: TextStyle(
                      color: Color(0xFF7697ce),
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
                    border: Border.all(color: Color(0xFF7697ce)),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, _alturaTela * 0.02, 0, _alturaTela * 0.02),
                      child: Text("Claudia dos Santos",
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
                          _LarguraTela * 0.4,
                          _alturaTela * 0.02),
                      child: Text("Telefone",
                          style: TextStyle(
                              color: Color(0xFF7697ce),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.01,
                          _LarguraTela * 0.04, _alturaTela * 0.02),
                      child: Text("(11) 99660-0892 ",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04)),
                    )
                  ]),
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(_LarguraTela * 0.55,
                          _alturaTela * 0.01, 0, _alturaTela * 0.02),
                      child: Container(
                        height: _alturaTela * 0.04,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Procedimentos",
                            style: TextStyle(
                                color: Color(0xFF7697ce),
                                fontSize: _LarguraTela * 0.04),
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
