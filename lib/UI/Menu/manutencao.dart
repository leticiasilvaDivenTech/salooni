import 'package:flutter/material.dart';

class manutencao extends StatefulWidget {
  @override
  _manutencaoState createState() => _manutencaoState();
}

class _manutencaoState extends State<manutencao> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                _LarguraTela * 0.24,
                                _alturaTela * 0.09,
                                _LarguraTela * 0.3,
                                _alturaTela * 0.04),
                            child: Text(
                              "Manutenção",
                              style: TextStyle(
                                  color: Color(0xFF9977ae),
                                  fontSize: _alturaTela * 0.04,
                                  fontFamily: "Generic"),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                            _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                        child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            cursorColor: Color(0xFF9977ae),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF9977ae))),
                                hintText: "Dias de Manutenção",
                                hintStyle: TextStyle(color: Color(0xFF939393)),
                                labelStyle:
                                    TextStyle(color: Color(0xFF9977ae))),
                            style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04),
                            validator: (value) {
                              if (value.isEmpty)
                                return "Inserir os dias da manutenção";
                              else
                                return null;
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                            _alturaTela * 0.03, _LarguraTela * 0.75, 0),
                        child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF9977ae))),
                                hintText: "R\$ 0,00",
                                hintStyle: TextStyle(color: Color(0xFF9977ae)),
                                labelStyle:
                                    TextStyle(color: Color(0xFF9977ae))),
                            style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04),
                            validator: (value) {
                              if (value.isEmpty)
                                return "Insira o preço";
                              else
                                return null;
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            _LarguraTela * 0.24,
                            _alturaTela * 0.09,
                            _LarguraTela * 0.3,
                            _alturaTela * 0.04),
                        child: Text(
                          "Manutenções",
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _alturaTela * 0.03,
                              fontFamily: "Generic"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              _LarguraTela * 0.05, 0, _LarguraTela * 0.4, 0),
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                color: Color(0xFFededed),
                                border: Border.all(
                                    color: Color(0xFF9977ae), width: 1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(_LarguraTela*0.09, 0, _LarguraTela*0.09, 0),
                                  child: Text('3 dias  - R\$ 50,00',
                                      style: TextStyle(
                                        color: Color(0xFF0f0f0f),
                                        fontSize: _alturaTela * 0.02,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                                Icon(Icons.cancel,
                                color:Color(0xFF9977ae) ,
                                )
                              ],
                            ),

                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.03, 0, 0),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              _LarguraTela * 0.09, 0, _LarguraTela * 0.09, 0),
                          height: _alturaTela * 0.055,
                          child: RaisedButton(
                            onPressed: () {

                            },
                            child: Text(
                              "Adicionar Manutenção ",
                              style: TextStyle(
                                  color: Color(0xFF9977ae),
                                  fontSize: _LarguraTela * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFF9977ae))),
                            color: Color(0xFFededed),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,_alturaTela*0.05,_LarguraTela*0.05,0),

                        child: Container(
                          margin: EdgeInsets.fromLTRB
                            (_LarguraTela*0.5,0,_LarguraTela*0.05,0),
                          height: _alturaTela*0.055,
                          child: RaisedButton(
                            onPressed: () {
                            },
                            child: Text(
                              "Salvar",
                              style: TextStyle(color: Color(0xFFededed),
                                  fontSize:_LarguraTela*0.061),
                            ),
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFFededed))
                            ),
                            color: Color(0xFF9977ae),
                          ),
                        ),
                      ),
                    ]))));
  }
}
