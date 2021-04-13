import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salooni/UI//Agendamento/detalhe.dart';

class financeiro extends StatefulWidget {
  @override
  _financeiroState createState() => _financeiroState();
}

class _financeiroState extends State<financeiro> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Selecione o procedimento realizado';
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.34,
                        _alturaTela * 0.09,
                        _LarguraTela * 0.3,
                        _alturaTela * 0.04),
                    child: Text(
                      "Financeiro",
                      style: TextStyle(
                          color: Color(0xFF6edede),
                          fontSize: _alturaTela * 0.04,
                          fontFamily: "Generic"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
                Row(children: [
                  Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(_LarguraTela * 0.03, 0, 0, 0),
                          child: Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  color: Color(0xFFededed),
                                  border: Border.all(
                                      color: Color(0xFF575ba8), width: 1),
                                  borderRadius: BorderRadius.circular(30)),
                              child: DropdownButton(
                                hint: Text(
                                  'Selecione o nome do Parceiro...',
                                  style: TextStyle(color: Color(0xFF0f0f0f)),
                                ),
                                dropdownColor: Color(0xFFededed),
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Color(0xFF6edede)),
                                iconSize: 36,
                                isExpanded: true,
                                underline: SizedBox(),
                                style: TextStyle(
                                  color: Color(0xFFededed),
                                  fontSize: 16,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Jessica Lima',
                                  'Patricia Oliviera de Sousa',
                                  'Letícia Caroline da Silva'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            _LarguraTela * 0.1,
                                            _alturaTela * 0,
                                            _LarguraTela * 0.09,
                                            0),
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: Color(0xFF0f0f0f),
                                            fontSize: _LarguraTela * 0.04,
                                          ),
                                        ),
                                      ));
                                }).toList(),
                              ),
                            ),
                          ))),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, _LarguraTela * 0.05, 0),
                    child: RaisedButton(
                      onPressed: () {
                      /*  Navigator.push(context,
                            MaterialPageRoute(builder: (context) => detalhe()));*/
                      },
                      child: Text(
                        "Data",
                        style: TextStyle(
                            color: Color(0xFF88d1ce),
                            fontSize: _LarguraTela * 0.04),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Color(0xFF575ba8))),
                      color: Color(0xFFededed),
                    ),
                  )
                ]),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.04, _alturaTela*0.05, _LarguraTela * 0.04, 0),
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
                              0),
                          child:
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, _alturaTela * 0.02, 0, _alturaTela * 0.02),
                          child: Text("Nome do Parceiro",
                              style: TextStyle(
                                  color: Color(0xFF0f0f0f),
                                  fontSize: _LarguraTela * 0.04)),
                        )),
                        )
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              _LarguraTela * 0.04,
                              0,
                              _LarguraTela * 0.2,
                              _alturaTela * 0.02),
                          child: Text("Comissão",
                              style: TextStyle(
                                  color: Color(0xFF88d1ce),
                                  fontSize: _LarguraTela * 0.04)),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0,
                              _LarguraTela * 0.02, _alturaTela * 0.03),
                          child: Text("R\$ 50,00 ",
                              style: TextStyle(
                                  color: Color(0xFF0f0f0f),
                                  fontSize: _LarguraTela * 0.04)),
                        ))
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              _LarguraTela * 0.04,
                              0,
                              0,
                              _alturaTela * 0.02),
                          child: Text("Clientes atendidoss",
                              style: TextStyle(
                                  color: Color(0xFF88d1ce),
                                  fontSize: _LarguraTela * 0.04)),
                        ),

                      ]),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            _alturaTela * 0.02),
                        child: Text("Lista de Clientes atendidos ",
                            style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04)),
                      ),
                    ])),
              ]),
        )));
  }
}
