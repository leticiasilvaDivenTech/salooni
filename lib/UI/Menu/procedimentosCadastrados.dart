import 'package:flutter/material.dart';
import 'package:salooni/UI//Menu/procedimento.dart';
import 'cadastroproc.dart';

class ProdedimentoCad extends StatefulWidget {
  @override
  _ProdedimentoCadState createState() => _ProdedimentoCadState();
}

class _ProdedimentoCadState extends State<ProdedimentoCad> {
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
                     Padding(
                          padding: EdgeInsets.fromLTRB(
                              _LarguraTela*0.055, _alturaTela * 0.1, _LarguraTela * 0.05, 0),
                          child: Text(
                            "Procedimentos Cadastrados",
                            style: TextStyle(
                                color: Color(0xFF9977ae),
                                fontSize: _alturaTela * 0.04,
                                fontFamily: "Generic"),
                            textAlign: TextAlign.center,
                          ),
                        ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                          _alturaTela * 0.05, 0, 0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProcedimentoEdi()));
                        },
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
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0.09, 0, 0, 0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProcedimentoEdi()));
                        },
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
                    )
                  ],
                ))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => cadastroProc()));
            },
            tooltip: 'Increment Counter',
            backgroundColor: Color(0xFF9977ae),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.add,
                  size: 40,
                )))

    );
  }
}
