import 'package:flutter/material.dart';
import 'package:salooni/Menu/navbar.dart';

class detalhe extends StatefulWidget {
  @override
  _detalheState createState() => _detalheState();
}

class _detalheState extends State<detalhe> {
  bool _checkValue1 = true;
  bool _checkValue2 = true;

  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      "images/roxo.png",
                      width: _LarguraTela * 0.08,
                      height: _alturaTela * 0.08,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, _alturaTela * 0.09, _LarguraTela * 0.19, 0),
                  child: Text(
                    "Detalhe do Agendamento ",
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
              padding: EdgeInsets.fromLTRB(
                  _LarguraTela * 0.09, _alturaTela * 0.09, 0, 0),
              child: CheckboxListTile(
                  // leading: Icon(
                  //   Icons.circle,
                  //   size: 18,
                  //   color: Color(0xFF9977ae),
                  // ),
                  title: Text(
                    'Alongamento',
                    style: TextStyle(fontSize: 15),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFF9977ae),
                  checkColor: Color(0xFF9977ae),
                  value: _checkValue1,
                  onChanged: (bool value) {
                    setState(() {
                      _checkValue1 = value;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09, 0, 0, 0),
              child: CheckboxListTile(
                  // leading: Icon(
                  //   Icons.circle,
                  //   size: 18,
                  //   color: Color(0xFF9977ae),
                  // ),
                  title: Text(
                    'Alongamento',
                    style: TextStyle(fontSize: 15),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFF9977ae),
                  checkColor: Color(0xFF9977ae),
                  value: _checkValue2,
                  onChanged: (bool value) {
                    setState(() {
                      _checkValue2 = value;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(_LarguraTela * 0.15, 30, 0, 0),
              child: Text(
                "Valor Total",
                style: TextStyle(
                    color: Color(0xFF9977ae),
                    fontSize: 20,
                    fontFamily: "Generic"),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(_LarguraTela * 0.15, 0, 0, 0),
              child: Text(
                r'R$ 30,00',
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontFamily: "Generic", fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ))));
  }
}
