import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'procedimento.dart';
import 'package:salooni/Models/procedimento.dart';
import 'package:salooni/Services/procedimento_service.dart';

import 'cadastroproc.dart';

class ProdedimentoCad extends StatefulWidget {
  @override
  _ProdedimentoCadState createState() => _ProdedimentoCadState();
}

class _ProdedimentoCadState extends State<ProdedimentoCad> {

  Future <List<Procedimento>> carregarProcedimentos() async{

    List<Procedimento> procedimentoList = [];

    Response response = await ProcedimentoService.carregarProcedimentos();
    // print("Code is ${response.statusCode}");
    // print("Response is ${response.body}");

    if (response.statusCode == 200) {

      var body = json.decode(response.body);
      var results = body["results"];

      results.forEach((cliente) => {
        procedimentoList.add(Procedimento.fromJson(cliente))
      });

    } else {

    }

    return procedimentoList;
  }



  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: Container(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(_LarguraTela * 0.055,
                  _alturaTela * 0.1, _LarguraTela * 0.05, 0),
              child: Text(
                "Procedimentos Cadastrados",
                style: TextStyle(
                    color: Color(0xFF9977ae),
                    fontSize: _alturaTela * 0.04,
                    fontFamily: "Generic"),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: FutureBuilder(builder: (context, snapshot) {
                      if(snapshot.data != null) {
                        List<Procedimento> procedimentoList = snapshot.data;

                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return  Padding(
                                padding: EdgeInsets.fromLTRB(_LarguraTela * 0.09,
                                    _alturaTela * 0.05, 0, 0),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProcedimentoEdi(procedimentoId: procedimentoList[index].objectId)));
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.circle,
                                      size: 18,
                                      color: Color(0xFF9977ae),
                                    ),
                                    title: Text(
                                      procedimentoList[index].Nome,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              );
                        },
                      itemCount: procedimentoList.length,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                      future: carregarProcedimentos(),
                    )))
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
                ))));
  }
}
