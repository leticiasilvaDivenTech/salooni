import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:salooni/Models/cliente.dart';
import 'package:salooni/Models/historico.dart';
import 'historicocadastrado.dart';

class historico extends StatefulWidget {

  @override
  _historicoState createState() => _historicoState();
}

class _historicoState extends State<historico> {

  Future<List<Historico>> carregahistorico() async{
    var DataManutencao;
    List<Historico> historicoList = [];
    List<Cliente> cliente = [];

    //Obtem dados do histórico
    QueryBuilder<ParseObject> queryParceiro =
    QueryBuilder<ParseObject>(ParseObject('Historico'));
    queryParceiro.includeObject(['IdClienteFK']);
    final ParseResponse apiResponse = await queryParceiro.query();

    if (apiResponse.statusCode == 200) {

     var te =  apiResponse.count;
     for(var i=0; i<te; i++){
       DataManutencao = apiResponse.results[i].get<String>('DataManutencao');
      var Nome = apiResponse.results[i].get('IdClienteFK').get<String>('Nome');
      var Telefone = apiResponse.results[i].get('IdClienteFK').get<String>('Telefone');
       var objhistorico = apiResponse.results[i].get<String>('objectId');
      var Cli = Cliente(
        Nome: Nome,
        Telefone: Telefone
      );
       var hi = Historico(
        DataManutencao: DataManutencao,
           ClienteFK: Cli,
         objectId: objhistorico
       );
       historicoList.add(hi);
     }
    }
 return historicoList;
  }

  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: Container(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Tab(icon: new Image.asset("images/icone7.png")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.03, 0, 0),
                    child: Text(
                      "Histórico de Cliente",
                      style: TextStyle(
                          color: Color(0xFF7697ce),
                          fontSize: _alturaTela * 0.04,
                          fontFamily: "Generic"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        _LarguraTela * 0.6, _alturaTela * 0.03, 0, 0),
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        "Filtrar ",
                        style: TextStyle(
                          color: Color(0xFF9977ae),
                          fontFamily: "SaniTrixieSans",
                          fontSize: _LarguraTela * 0.05,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child:  FutureBuilder(builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          List<Historico> historicoList = snapshot.data;

                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Container(
                                margin:  EdgeInsets.fromLTRB
                                  (1, 10, 1, 0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF575ba8)),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child:Column(children: <Widget>[
                                  Row(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          _LarguraTela * 0.04,
                                          _alturaTela * 0.02,
                                          _LarguraTela * 0.4,
                                          _alturaTela * 0.02),
                                      child: Text("Cliente",
                                          style: TextStyle(
                                              color: Color(0xFF7697ce),
                                              fontSize: _LarguraTela * 0.04)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, _alturaTela * 0.02, 0, _alturaTela * 0.02),
                                      child: Text(historicoList[index].ClienteFK.Nome,
                                          style: TextStyle(
                                              color: Color(0xFF0f0f0f),
                                              fontSize: _LarguraTela * 0.04)),
                                    )
                                  ]),
                                  Row(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          _LarguraTela * 0.04,
                                          _alturaTela * 0.01,
                                          _LarguraTela * 0.4,
                                          _alturaTela * 0.02),
                                      child: Text("Telefone",
                                          style: TextStyle(
                                              color: Color(0xFF7697ce),
                                              fontSize: _LarguraTela * 0.04)),
                                    ),
                                    Expanded(child:
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, _alturaTela * 0.01, _LarguraTela * 0.04,
                                          _alturaTela * 0.02),
                                      child: Text(historicoList[index].ClienteFK.Telefone,
                                          style: TextStyle(
                                              color: Color(0xFF0f0f0f),
                                              fontSize: _LarguraTela * 0.04)),
                                    )
                                    )
                                  ]),
                                  Row(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          _LarguraTela * 0.04,
                                          _alturaTela * 0.01,
                                          _LarguraTela * 0.4,
                                          _alturaTela * 0.02),
                                      child: Text("Data",
                                          style: TextStyle(
                                              color: Color(0xFF7697ce),
                                              fontSize: _LarguraTela * 0.04)),
                                    ),
                                    Expanded(child:
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, _alturaTela * 0.01, _LarguraTela * 0.04,
                                          _alturaTela * 0.02),
                                      child: Text(historicoList[index].DataManutencao,
                                          style: TextStyle(
                                              color: Color(0xFF0f0f0f),
                                              fontSize: _LarguraTela * 0.04)),
                                    )
                                    )
                                  ]),
                                  Row(children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(_LarguraTela * 0.55,
                                          _alturaTela * 0.01, _LarguraTela * 0.09, _alturaTela * 0.02),
                                      child: Container(
                                        height: _alturaTela * 0.04,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => historiodetalhes(detalheshistorico:historicoList[index].objectId )));
                                          },
                                          child: Text(
                                            "Detalhes",
                                            style: TextStyle(
                                                color: Color(0xFF88d1ce),
                                                fontSize: _LarguraTela * 0.03),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                              side: BorderSide(color: Color(0xFF88d1ce))),
                                          color: Color(0xFFededed),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ]),
                              );
                            },
                            itemCount: historicoList.length,
                          );

                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                        future: carregahistorico(),
                      ),
                    ),
                  ),
                ])),
       );
  }
}
