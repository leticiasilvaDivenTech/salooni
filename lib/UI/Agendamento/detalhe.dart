import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:salooni/Models/AgendamentoXProcedimento.dart';
import 'package:salooni/Models/agendamento.dart';
import 'package:salooni/Models/cliente.dart';
import 'package:salooni/Models/funcionario.dart';
import 'package:salooni/Models/procedimento.dart';
import 'package:salooni/Services/agendamentodia_service.dart';
import 'package:salooni/UI//Menu/navbar.dart';

class detalhe extends StatefulWidget {
  detalhe({this.detalhesAgend});
  String detalhesAgend;

  @override
  _detalheState createState() => _detalheState();
}

class _detalheState extends State<detalhe> {
  bool _checkValue1 = true;
  bool _checkValue2 = true;
  String Valor;
  initState(){
    carregarAgendamentoPorProcedimentos(this.widget.detalhesAgend);
  }

  Future<List<AgendaProc>> carregarAgendamentoPorProcedimentos(String detalhesAgend) async{
    List<AgendaProc> AgendamentoPorProc = [];

    QueryBuilder<ParseObject> queryAgendamentoEProcedimento =
    QueryBuilder<ParseObject>(ParseObject('AgendamentoXProcecimento'));
    queryAgendamentoEProcedimento.includeObject(['IdProcFK']);
     QueryBuilder<ParseObject> queryProcedimento =
    QueryBuilder<ParseObject>(ParseObject('Procedimento'));
    queryProcedimento.whereEqualTo('objectId', detalhesAgend);
    queryAgendamentoEProcedimento.whereMatchesQuery('IdProcFK', queryProcedimento);
    final ParseResponse apiResponse = await queryAgendamentoEProcedimento.query();

    if (apiResponse.success && apiResponse.results != null)
    {

      var count = apiResponse.count;

      for(var i=0; i<count; i++){
        var NomeProc = apiResponse.results[i].get('IdProcFK').get<String>('Nome');
         Valor = apiResponse.results[i].get('IdProcFK').get<String>('Valor');

        var proc = Procedimento(
          Nome: NomeProc,
          Valor: Valor
        );
        var AgendProc = AgendaProc(
          ProcFK: proc
        );
        AgendamentoPorProc.add(AgendProc);
      }
    }
    return AgendamentoPorProc;
  }


  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: Container(
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
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(0),
                        child: FutureBuilder(builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            List<AgendaProc> AgendamentoPorProc = snapshot.data;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return
                                     Column(children: <Widget>[
                                      Row(children: <Widget>[
                                        Expanded(
                                          child:
                                        CheckboxListTile(
                                            title: Text(
                                              AgendamentoPorProc[index].ProcFK.Nome,
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

                                      ]),
                                    ]);
                              },
                              itemCount: AgendamentoPorProc.length,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                           future: carregarAgendamentoPorProcedimentos(this.widget.detalhesAgend)
                        ),

                      ),
                  ),
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0.07,
                          _alturaTela * 0.01,
                          _LarguraTela * 0.03,
                          _alturaTela * 0.4),
                      child:Text(
                        "Valor Total",
                        style: TextStyle(
                            color: Color(0xFF9977ae),
                            fontSize: 19,
                            fontFamily: "Generic"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          _LarguraTela * 0,
                          _alturaTela * 0.01,
                          _LarguraTela * 0.3,
                          _alturaTela * 0.4),
                      child: Text(Valor.toString(),
                          style: TextStyle(
                              color: Color(0xFF0f0f0f),
                              fontSize: _LarguraTela * 0.04),


                      ),
                    ),
                  ]),



                ]
            )
        ),
        );
  }
}
