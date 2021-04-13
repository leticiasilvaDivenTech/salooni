import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:salooni/UI/Menu/menuLateral.dart';
import 'package:salooni/UI/Registro/registrar.dart';
import 'esqueceu_senha.dart';

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_element
  void _resetFields(){
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Tab(icon: new Image.asset("images/icone7.png")),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, _alturaTela * 0.18, 0, _alturaTela * 0.05),
                  child: Image.asset(
                    "images/icone11.png",
                    width: _LarguraTela * 0.19,
                    height: _alturaTela * 0.19,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.12, 0,
                      _LarguraTela * 0.12, _alturaTela * 0.02),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color(0xFF9977ae),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "Login",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    controller: loginController,
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                      validator:
                          EmailValidator(errorText: 'Inserir e-mail válido')),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.12, 0, _LarguraTela * 0.12, 0),
                  child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "Senha",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      controller: senhaController,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira a sua senha";
                        else
                          return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.38, _alturaTela * 0.01, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EsqueceuSenha()));
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Color(0xFF9977ae),
                        fontFamily: "SaniTrixieSans",
                        fontSize: _LarguraTela * 0.05,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.27,
                      _alturaTela * 0.04, _LarguraTela * 0.27, 0),
                  child: Container(
                    height: _alturaTela * 0.055,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuLateral()));
                        }
                        else
                          return null;
                      },

                      child: Text(
                        "Entrar",
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.035, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Não possui login? ",
                        style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontFamily: "SaniTrixieSans",
                          fontSize: _LarguraTela * 0.054,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registrar()));
                          },
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            "Registre-se ",
                            style: TextStyle(
                              color: Color(0xFF9977ae),
                              fontFamily: "SaniTrixieSans",
                              fontSize: _LarguraTela * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
