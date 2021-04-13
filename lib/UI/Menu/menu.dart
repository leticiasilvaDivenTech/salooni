import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:salooni/Models/agendamento.dart';
import 'package:salooni/Services/agendamentodia_service.dart';
import 'package:salooni/UI//Agendamento/detalhe.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Future<List<Agendamento>> carregarAgendamentos() async {
    List<Agendamento> agendamentoList = [];

    Response response = await AgendamentoServices.carregarAgendamentos();
    // print("Code is ${response.statusCode}");
    // print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var results = body["results"];

      results.forEach(
          (cliente) => {agendamentoList.add(Agendamento.fromJson(cliente))});
    } else {}

    return agendamentoList;
  }

  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// ignore: unused_element
  void _resetFields() {
    loginController.text = "";
    senhaController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

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
                  "Agendamento do dia",
                  style: TextStyle(
                      color: Color(0xFF9977ae),
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
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        List<Agendamento> AgendamentoList = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(1, 10, 1, 0),
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
                                            color: Color(0xFF9977ae),
                                            fontSize: _LarguraTela * 0.04)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        _alturaTela * 0.02,
                                        0,
                                        _alturaTela * 0.02),
                                    child: Text(
                                        AgendamentoList[index].IdClienteFK.Nome,
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
                                        _LarguraTela * 0.34,
                                        _alturaTela * 0.02),
                                    child: Text("Especialista",
                                        style: TextStyle(
                                            color: Color(0xFF9977ae),
                                            fontSize: _LarguraTela * 0.04)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        _alturaTela * 0.01,
                                        0,
                                        _alturaTela * 0.02),
                                    child: Text(
                                        AgendamentoList[index].IdFuncFK.Nome,
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
                                        0,
                                        _alturaTela * 0.02),
                                    child: Text("Horario",
                                        style: TextStyle(
                                            color: Color(0xFF9977ae),
                                            fontSize: _LarguraTela * 0.04)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        _LarguraTela * 0.04,
                                        _alturaTela * 0.01,
                                        _LarguraTela * 0.3,
                                        _alturaTela * 0.02),
                                    child: Text(
                                        AgendamentoList[index].DataAgendamento,
                                        style: TextStyle(
                                            color: Color(0xFF0f0f0f),
                                            fontSize: _LarguraTela * 0.04)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        _LarguraTela * 0.04,
                                        _alturaTela * 0.01,
                                        _LarguraTela * 0.04,
                                        _alturaTela * 0.02),
                                    child: Container(
                                      height: _alturaTela * 0.04,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      detalhe()));
                                        },
                                        child: Text(
                                          "Detalhes",
                                          style: TextStyle(
                                              color: Color(0xFF575ba8),
                                              fontSize: _LarguraTela * 0.03),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color(0xFF575ba8))),
                                        color: Color(0xFFededed),
                                        //color: Color(0xFF9977ae),
                                      ),
                                    ),
                                  ),
                                ]),
                              ]),
                            );
                          },
                          itemCount: AgendamentoList.length,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    future: carregarAgendamentos(),
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
                              color: Color(0xFF9977ae),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, _alturaTela * 0.02, 0, _alturaTela * 0.02),
                      child: Text("Claudia dos Santos",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04)),
                    ))
                  ]),
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0.04,
                          _alturaTela * 0.01,
                          _LarguraTela * 0.34,
                          _alturaTela * 0.02),
                      child: Text("Especialista",
                          style: TextStyle(
                              color: Color(0xFF9977ae),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, _alturaTela * 0.01, 0, _alturaTela * 0.02),
                      child: Text("Maria dos Santos ",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04)),
                    ))
                  ]),
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(_LarguraTela * 0.04,
                          _alturaTela * 0.01, 0, _alturaTela * 0.02),
                      child: Text("Horario",
                          style: TextStyle(
                              color: Color(0xFF9977ae),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0.04,
                          _alturaTela * 0.01,
                          _LarguraTela * 0.3,
                          _alturaTela * 0.02),
                      child: Text("10:30",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            _LarguraTela * 0.04,
                            _alturaTela * 0.01,
                            _LarguraTela * 0.04,
                            _alturaTela * 0.02),
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
                                  color: Color(0xFF575ba8),
                                  fontSize: _LarguraTela * 0.03),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF575ba8))),
                            color: Color(0xFFededed),
                            //color: Color(0xFF9977ae),
                          ),
                        ),
                      ),
                    )
                  ]),
                ]),
              )
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment Counter',
            backgroundColor: Color(0xFF9977ae),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.add,
                  size: 40,
                ))));
  }
}
