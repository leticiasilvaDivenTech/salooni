import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:salooni/UI/Registro/procedimento.dart';


class RegistrarProprietario extends StatefulWidget {
  @override
  _RegistrarProprietarioState createState() => _RegistrarProprietarioState();
}

class _RegistrarProprietarioState extends State<RegistrarProprietario> {
  var maskFormatterCelular = new MaskTextInputFormatter
    (mask: '(##) ####-#####', filter: { "#": RegExp(r'[0-9]') });

  TextEditingController proprietarioController = TextEditingController();
  TextEditingController nsalaoController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_element
  void _resetFields(){
    proprietarioController.text = "";
    nsalaoController.text = "";
    celularController.text = "";
    emailController.text = "";
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
                //Tab(icon: new Image.asset("images/icone7.png")),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.12, 0, 0),
                  child: Text(
                    "Proprietário",
                    style: TextStyle(
                        color: Color(0xFF9977ae),
                        fontSize: _alturaTela * 0.04,
                        fontFamily: "Generic"),
                    textAlign: TextAlign.center,

                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.05,
                      _alturaTela * 0.01,
                      _LarguraTela * 0.05,
                      _alturaTela * 0.04),
                  child: Text(
                    "Nos informe alguns dados para podermos ie em frente."
                    " Não vai demorar muito",
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.056,
                        fontFamily: "SanitrixieSans"),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                      _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                  child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFF9977ae),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "Nome do salão",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                  controller: proprietarioController,
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o nome do salão";
                        else
                          return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                      _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "Nome do proprietário",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    controller: nsalaoController,
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o nome do proprietário";
                        else
                          return null;
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                      _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [maskFormatterCelular],
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "Celular",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    controller: celularController,
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o celular";
                        else
                          return null;
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                      _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    controller: emailController,
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o email";
                        else
                          return null;
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.04, 0, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.4, 0, _LarguraTela * 0.05, 0),
                    height: _alturaTela * 0.054,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Procedimento()));
                        }

                      },
                      child: Text(
                        "Avançar",
                        style: TextStyle(
                            color: Color(0xFFededed),
                            fontSize: _LarguraTela * 0.061),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Color(0xFFededed))),
                      color: Color(0xFF9977ae),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
