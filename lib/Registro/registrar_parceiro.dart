import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrarParceiro extends StatefulWidget {
  @override
  _RegistrarParceiroState createState() => _RegistrarParceiroState();
}

class _RegistrarParceiroState extends State<RegistrarParceiro> {
  TextEditingController emailController = TextEditingController();
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
                //Tab(icon: new Image.asset("images/icone7.png")),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.1,
                      _alturaTela * 0.18, _LarguraTela * 0.1, 0),
                  child: Text(
                      "Tranquilo! Só vamos precisar do seu e-mail"
                          " para que você possa pegar sua senha e entrar no nossa aplicativo",
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.049)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.1,
                      _alturaTela * 0.04,
                      _LarguraTela * 0.1,
                      _alturaTela * 0.07),
                  child: Text(
                      "Observação: o proprietario já deve ter cadastrado a sua conta :D",
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.049)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.12, 0,
                      _LarguraTela * 0.12, _alturaTela * 0.01),
                  child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Color(0xFF9977ae),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      controller: emailController,
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.05,
                          fontFamily: "SaniTrixieSans"),
                      validator: EmailValidator(errorText: 'Inserir e-mail válido')),
                  ),

                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.2,
                      _alturaTela * 0.03, _LarguraTela * 0.2, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, _alturaTela * 0.27, 0, 0),
                    height: _alturaTela * 0.059,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                        {}
                      },
                      child: Text(
                        "Enviar",
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
