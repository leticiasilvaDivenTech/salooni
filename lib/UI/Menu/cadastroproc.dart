import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:salooni/UI//Registro/parceiros.dart';

class cadastroProc extends StatefulWidget {
  @override
  _cadastroProcState createState() => _cadastroProcState();
}

class _cadastroProcState extends State<cadastroProc> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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

  void adicionarProcedimento() {
    Procedimento procedimento = new Procedimento();
    procedimento.Nome = procedimentoController.text;
    procedimento.Tempo = int.parse(horaminController.text);
    procedimento.Valor = int.parse(precoController.text);

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Adicionando Procedimento"),
            CircularProgressIndicator(),
          ],
        ),
        duration: Duration(minutes: 1),
      ),
    );

    ProcedimentoService.adicionarProcedimento(procedimento).then((res) {
      _scaffoldKey.currentState.hideCurrentSnackBar();

      Response response = res;
      if (response.statusCode == 200) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: (Text("Adicionado!"))));
      } else {
        //Handle error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
                      child: Image.asset(
                        "images/azul.png",
                        width: _LarguraTela * 0.08,
                        height: _alturaTela * 0.08,
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, _alturaTela * 0.09, _LarguraTela * 0.11, 0),
                    child: Text(
                      "Cadastro de Procedimentos",
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
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "Procedimento",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    controller: procedimentoController,
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    validator: (value) {
                      if (value.isEmpty)
                        return "Insira o procedimento";
                      else
                        return null;
                    }),
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
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "Hora:Min",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: horaminController,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Insira a hora:min";
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
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9977ae))),
                        hintText: "R\$ 0,00 (Preço)",
                        hintStyle: TextStyle(color: Color(0xFF9977ae)),
                        labelStyle: TextStyle(color: Color(0xFF9977ae))),
                    style: TextStyle(
                        color: Color(0xFF0f0f0f),
                        fontSize: _LarguraTela * 0.04),
                    controller: precoController,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Insira o preço";
                      else
                        return null;
                    }),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                  Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.02, _alturaTela * 0.02, 0, 0),
                    child: CheckboxListTile(
                        value: _value1,
                        activeColor: Color(0xFF9977ae),
                        title: Text(
                          'Comissão',
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
                new Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(_LarguraTela * 0.05, 0, 0, 0),
                    child: new Radio(
                      value: 1,
                      groupValue: null,
                      onChanged: null,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, _LarguraTela * 0.5, 0),
                    child: TextField(
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9977ae))),
                          hintText: "% (Porcentagem)",
                          hintStyle: TextStyle(color: Color(0xFF9977ae)),
                          labelStyle: TextStyle(color: Color(0xFF9977ae))),
                      style: TextStyle(
                          color: Color(0xFF0f0f0f),
                          fontSize: _LarguraTela * 0.04),
                      // controller: precoController,
                    ),
                  )),
                ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            _LarguraTela * 0.05, _alturaTela * 0.03, 0, 0),
                        child: new Radio(
                          value: 1,
                          groupValue: null,
                          onChanged: null,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, 0, _LarguraTela * 0.5, 0),
                        child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF9977ae))),
                              hintText: "R\$ (Valor fixo)",
                              hintStyle: TextStyle(color: Color(0xFF9977ae)),
                              labelStyle: TextStyle(color: Color(0xFF9977ae))),
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04),
                          //controller: precoController,
                        ),
                      )),
                    ]),
              ]),
              Padding(
                padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.05, 0, 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      _LarguraTela * 0.5, 0, _LarguraTela * 0.02, 0),
                  height: _alturaTela * 0.055,
                  child: RaisedButton(
                    onPressed: () {
                      adicionarProcedimento();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Parceiro())); Esse navigator está correto?
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
                    color: Color(0xFF9977ae),
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
