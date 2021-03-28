import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CriarCalendario extends StatefulWidget {
  @override
  _CriarCalendarioState createState() => _CriarCalendarioState();
}

class _CriarCalendarioState extends State<CriarCalendario> {
  var maskFormatterHora = new MaskTextInputFormatter(
      mask: '##:##', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController procedimentoController = TextEditingController();
  TextEditingController horaminController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _value1 = false;
  bool _valueCheck1 = false;

  // ignore: unused_element
  void _resetFields() {
    procedimentoController.text = "";
    horaminController.text = "";
    precoController.text = "";
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
        child: Form(
          key: _formKey,
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

              ),
          )),
        Expanded(

          child:   Padding(
            padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, _LarguraTela*0.11, 0),
            child: Text(
              "Cadastrar Calendário",
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
                padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                    _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Color(0xFF7697ce),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7697ce))),
                        hintText: "Nome do Calendário",
                        hintStyle: TextStyle(color: Color(0xFF939393)),
                        labelStyle: TextStyle(color: Color(0xFF939393))),
                    controller: procedimentoController,
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    validator: PatternValidator('^[a-zA-Z]+\$',
                        errorText: 'O Nome não pode ter caracter'
                            ' especial ou números')),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                    _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [maskFormatterHora],
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7697ce))),
                        hintText: "Parceiro(Prenchimento automatico)",
                        hintStyle: TextStyle(color: Color(0xFF939393)),
                        labelStyle: TextStyle(color: Color(0xFF939393))),
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: horaminController,
                    ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, _alturaTela*0.07, _LarguraTela*0.5, 0),
                child: Text(
                  "Procedimentos",
                  style: TextStyle(
                      color: Color(0xFF7697ce),
                      fontSize: _alturaTela * 0.03,
                      fontFamily: "Generic"),
                  textAlign: TextAlign.center,
                ),
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.02, _alturaTela * 0.02, 0, 0),
                    child: CheckboxListTile(
                        value: _value1,
                        activeColor: Color(0xFF7697ce),
                        title: Text(
                          'Progressiva',
                          style: TextStyle(
                            color: Color(0xFF0f0f0f),
                            fontSize: _LarguraTela * 0.04,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            _value1 = value;
                          });
                        })),
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            _LarguraTela * 0.02,0, 0, 0),
                        child: CheckboxListTile(
                            value: _value1,
                            activeColor: Color(0xFF7697ce),
                            title: Text(
                              'Alongamento de unha ',
                              style: TextStyle(
                                color: Color(0xFF0f0f0f),
                                fontSize: _LarguraTela * 0.04,
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool value) {
                              setState(() {
                                _value1 = value;
                              });
                            })),
              ]),
              Padding(
                padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.05, 0, 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.6, 0, _LarguraTela * 0.02, 0),
                  height: _alturaTela * 0.055,
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          color: Color(0xFFededed),
                          fontSize: _LarguraTela * 0.061),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xFFededed))),
                    color: Color(0xFF7697ce),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
