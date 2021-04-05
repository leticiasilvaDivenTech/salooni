import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:salooni/Menu/menu.dart';
import 'package:salooni/Menu/menuLateral.dart';

class Parceiro extends StatefulWidget {
  @override
  _ParceiroState createState() => _ParceiroState();
}

class _ParceiroState extends State<Parceiro> {
  var maskFormatterCelular = new MaskTextInputFormatter(
      mask: '(##) ####-#####', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterCNPJ = new MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController nparceiroController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Selecione o procedimento realizado';

  // ignore: unused_element
  void _resetFields() {
    nparceiroController.text = "";
    cnpjController.text = "";
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
                  padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, 0, 0),
                  child: Text(
                    "Parceiros",
                    style: TextStyle(
                        color: Color(0xFF9977ae),
                        fontSize: _alturaTela * 0.04,
                        fontFamily: "Generic"),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.07,
                      _alturaTela * 0.01, _LarguraTela * 0.07, 0),
                  child: Text(
                    "Adicione os seus parceiros do seu salão."
                    " Depois dessa parte, logo mais você já vai poder usar "
                    " o Salooni tranquilamente",
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.05,
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
                        hintText: "Nome",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: nparceiroController,
                    validator: PatternValidator('^[a-zA-Z]+\$',
                        errorText: 'O Nome não pode ter caracter'
                            ' especial ou números'),
                  ),
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
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      controller: emailController,
                      validator:
                          EmailValidator(errorText: 'Inserir e-mail válido')),
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
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      controller: celularController,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o celular";
                        else
                          return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                      _alturaTela * 0.03, _LarguraTela * 0.09, 0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatterCNPJ],
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "CNPJ",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: cnpjController,
                  ),
                ),
                SizedBox(
                    height: _alturaTela*0.09,
                    child: Column(
                      children: <Widget>[
                        DropdownButton<String>(
                          value: dropdownValue,
                          style: TextStyle(color: Color(0xFF9977ae)),
                          underline: Container(
                            height: 3,
                            color: Color(0xFF9977ae),
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Selecione o procedimento realizado',
                            'Manicure',
                            'Desgner de sobrançelha'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(_LarguraTela * 0.1,
                                      _alturaTela * 0, _LarguraTela * 0.09, 0),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Color(0xFF9977ae),
                                      fontSize: _LarguraTela * 0.04,
                                    ),
                                  ),
                                ));
                          }).toList(),
                        ),

                      ],
                    )),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, 0, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.2, 0, _LarguraTela * 0.2, 0),
                    height: _alturaTela * 0.055,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Adicionar",
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
                  padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.04, 0, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.5, 0, _LarguraTela * 0.02, 0),
                    height: _alturaTela * 0.055,
                    child: RaisedButton(
                      onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MenuLateral()));

                      },
                      child: Text(
                        "Concluir",
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
