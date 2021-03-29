import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:salooni/Menu/menu.dart';


class RegistrarCliente extends StatefulWidget {
  @override
  _RegistrarClienteState createState() => _RegistrarClienteState();
}

class _RegistrarClienteState extends State<RegistrarCliente> {
  String nascimentoData;
  var maskFormatterTelefone = new MaskTextInputFormatter
    (mask: '(##) ####-#####', filter: { "#": RegExp(r'[0-9]') });
  var maskFormatterCPF = new MaskTextInputFormatter
    (mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  TextEditingController nClienteController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController nascimentoDataController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: unused_element
  void _resetFields(){
    cpfController.text = "";
    celularController.text = "";
    emailController.text = "";
    telefoneController.text = "";
    nascimentoDataController.text = "";
    observacaoController.text = "";
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
                //Tab(icon: new Image.asset("images/icone7.png")),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,_alturaTela*0.09,0,0),
                  child: Text("Cliente",
                    style: TextStyle(color: Color(0xFF9977ae),
                        fontSize:_alturaTela* 0.04,
                        fontFamily:"Generic"),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                      controller: nClienteController,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o Nome";
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
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o E-mail";
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
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskFormatterTelefone],
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
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskFormatterTelefone],
                      decoration: InputDecoration(
                          focusedBorder:
                          UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "Telefone (Opcional)",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      controller: telefoneController,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o telefone";
                        else
                          return null;
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB
                    (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                  child: InputDatePickerFormField (
                    autofocus: false,
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime(2016),
                    lastDate: new DateTime(2030),
                    onDateSubmitted: (date) {
                      setState(() {
                        nascimentoData = date.toString();
                      });
                    },
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB
                    (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatterCPF],
                    decoration: InputDecoration(
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "CPF",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: cpfController,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira o CPF";
                        else
                          return null;
                      }

                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB
                      (_LarguraTela*0.09,_alturaTela*0.03,_LarguraTela*0.09,0),
                    child: TextField (
                      minLines: 3,
                      maxLines: 6,
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder:
                          OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "Observação",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      controller: observacaoController,

                    )
                ),
          Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0,_alturaTela*0.04,0,0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB
                      (_LarguraTela*0.05,0,_LarguraTela*0.02,20),
                    height: _alturaTela*0.055,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Menu())
                          );
                        }
                      },
                      child: Text(
                        "Excluir",
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
            Padding(
              padding: EdgeInsets.fromLTRB(0,_alturaTela*0.04,0,0),

              child: Container(
                margin: EdgeInsets.fromLTRB
                  (_LarguraTela*0.3,0,_LarguraTela*0.02,20),
                height: _alturaTela*0.055,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu())
                      );
                    }

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
                ]),


              ],

            ),
          ),
        )
    );
  }
}
