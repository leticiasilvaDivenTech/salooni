import 'package:flutter/material.dart';
import 'package:salooni/Agendamento/detalhe.dart';
import 'package:salooni/Cliente/registrar_cliente.dart';

class cliente extends StatefulWidget {
  @override
  _clienteState createState() => _clienteState();
}

class _clienteState extends State<cliente> {
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
              //Tab(icon: new Image.asset("images/icone7.png")),
              Padding(
                padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, 0, 0),
                child: Text(
                  "Cliente",
                  style: TextStyle(
                      color: Color(0xFF88d1ce),
                      fontSize: _alturaTela * 0.04,
                      fontFamily: "Generic"),
                  textAlign: TextAlign.center,
                ),
              ),

                  Padding(
                    padding: EdgeInsets.fromLTRB
                      (_LarguraTela*0.6, _alturaTela*0.03, 0, 0),
                    child: FlatButton(
                      onPressed: () {

                      },
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
                margin:  EdgeInsets.fromLTRB
                  (_LarguraTela*0.04, 0, _LarguraTela*0.04, 0),
                // padding: const EdgeInsets.fromLTRB(20, 10, 0, 150),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF88d1ce)),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0.04,
                          _alturaTela * 0.02,
                          _LarguraTela * 0.4,
                          _alturaTela * 0.02),
                      child: Text("Nome",
                          style: TextStyle(
                              color: Color(0xFF88d1ce),
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
                              color: Color(0xFF88d1ce),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, _alturaTela * 0.01, _LarguraTela*0.04, _alturaTela * 0.02),
                      child: Text("(11) 99660-0892 ",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04)),
                    )
                  ]),
                  Row(children: <Widget>[

                    Padding(
                      padding: EdgeInsets.fromLTRB
                        ( _LarguraTela*0.55, _alturaTela * 0.01, 0, _alturaTela * 0.02),
                      child: Container(
                        height: _alturaTela * 0.04,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => detalhe()));
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
                    )
                  ]),
                ]),
              )
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrarCliente()));
            },
            tooltip: 'Increment Counter',
            backgroundColor: Color(0xFF88d1ce),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.add,
                  size: 40,
                ))));
  }
}
