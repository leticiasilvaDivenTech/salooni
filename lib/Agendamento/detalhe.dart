import 'package:flutter/material.dart';
import 'package:salooni/Menu/navbar.dart';

class detalhe extends StatefulWidget {
  @override
  _detalheState createState() => _detalheState();
}

class _detalheState extends State<detalhe> {
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
                    child:  Image.asset(
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
              padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                  _alturaTela * 0.09, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  size: 18,
                  color: Color(0xFF9977ae),
                ),
                title: Text(
                  'Alongamento',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  _LarguraTela * 0.09, 0, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  size: 18,
                  color: Color(0xFF9977ae),
                ),
                title: Text(
                  'Esmaltação',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  _LarguraTela * 0.6, 0, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.monetization_on_rounded,
                  color: Color(0xFF9977ae),
                ),
                title: Text(
                  '160.00',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            )
          ],
        ))));
  }
}
