import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class parceirocadastrados extends StatefulWidget {
  @override
  _parceirocadastradosState createState() => _parceirocadastradosState();
}

class _parceirocadastradosState extends State<parceirocadastrados> {
  var maskFormatterCelular = new MaskTextInputFormatter
    (mask: '(##) ####-#####', filter: { "#": RegExp(r'[0-9]') });
  var maskFormatterCNPJ = new MaskTextInputFormatter
    (mask: '##.###.###/####-##', filter: { "#": RegExp(r'[0-9]') });
  TextEditingController nparceiroController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Selecione o procedimento realizado';
  // ignore: unused_element
  void _resetFields(){
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
          child:Form(
            key: _formKey,
            child:Column(
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
                          "images/roxo.png",
                          width: _LarguraTela * 0.08,
                          height: _alturaTela * 0.08,

                        ),
                      )),
                  Expanded(

                    child:   Padding(
                      padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, _LarguraTela*0.2, 0),
                      child: Text("Cadastro de Parceiros",
                        style: TextStyle(color: Color(0xFF9977ae),
                            fontSize:_alturaTela* 0.04,
                            fontFamily:"Generic"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),

                Padding(
                  padding: EdgeInsets.fromLTRB
                    (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                  child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFF9977ae),
                      decoration: InputDecoration(
                          focusedBorder:
                          UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "Nome",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(color: Color(0xFF0f0f0f),
                          fontSize:_LarguraTela * 0.04),
                      controller: nparceiroController,
                      validator: PatternValidator('^[a-zA-Z]+\$',
                          errorText: 'O Nome não pode ter caracter'
                              ' especial ou números')

                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB
                    (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: emailController,
                    validator:EmailValidator(errorText: 'Inserir e-mail válido'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB
                    (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                  child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskFormatterCelular],
                      decoration: InputDecoration(
                          focusedBorder:
                          UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "Celular",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      controller: celularController,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o celular";
                        else
                          return null;
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB
                    (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatterCNPJ],
                    decoration: InputDecoration(
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "CNPJ",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(color: Color(0xFF0f0f0f),
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
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.1, 0, 0),
                      child: Container(
                        height: _alturaTela * 0.055,
                        padding: EdgeInsets.only(right: _LarguraTela * 0.08),
                        margin: EdgeInsets.only(left: _LarguraTela * 0.15),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "   Excluir   ",
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
                      padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.1, 0, 0),
                      child: Container(
                        height: _alturaTela * 0.055,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "   Salvar   ",
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
                )
              ],

            ),
          ),
        )
    );
  }
}
