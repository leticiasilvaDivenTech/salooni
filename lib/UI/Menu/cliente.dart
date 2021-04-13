import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:salooni/UI//Agendamento/detalhe.dart';
import 'package:salooni/UI//Cliente/registrar_cliente.dart';
import 'package:salooni/Models/cliente.dart';
import 'package:salooni/Services/cliente_service.dart';

class cliente extends StatefulWidget {
  @override
  _clienteState createState() => _clienteState();
}

class _clienteState extends State<cliente> {
  Future <List<Cliente>> carregarClientes() async{

    List<Cliente> clienteList = [];

    Response response = await ClienteService.carregarClientes();

    if (response.statusCode == 200) {

      var body = json.decode(response.body);
      var results = body["results"];

      results.forEach((cliente) => {
        clienteList.add(Cliente.fromJson(cliente))
      });

    } else {

    }

    return clienteList;
  }




  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFededed),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, 0, 0),
                    child: Text(
                      "Cliente",
                      style: TextStyle(
                          color: Color(0xFF88d1ce),
                          fontSize: _alturaTela * 0.04,
                          fontFamily: "Generic"),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB
                      (_LarguraTela*0.6, _alturaTela*0.03, 0, 0),
                    child: FlatButton(
                      onPressed: () {

                      },
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
                      child:  FutureBuilder(
                        builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          List<Cliente> clienteList = snapshot.data;

                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Container(
                                margin:  EdgeInsets.fromLTRB
                                  (1, 10, 1, 0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF88d1ce)),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Column(children: <Widget>[
                                  Row(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          _LarguraTela * 0.04,
                                          _alturaTela * 0.02,
                                          _LarguraTela * 0.4,
                                          _alturaTela * 0.02),
                                      child: Text("Nome",
                                          style: TextStyle(
                                              color: Color(0xFF88d1ce),
                                              fontSize: _LarguraTela * 0.04)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, _alturaTela * 0.02, 0, _alturaTela * 0.02),
                                      child: Text(clienteList[index].Nome,
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
                                              color: Color(0xFF88d1ce),
                                              fontSize: _LarguraTela * 0.04)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, _alturaTela * 0.01, _LarguraTela * 0.04,
                                          _alturaTela * 0.02),
                                      child: Text(clienteList[index].Telefone,
                                          style: TextStyle(
                                              color: Color(0xFF0f0f0f),
                                              fontSize: _LarguraTela * 0.04)),
                                    )
                                  ]),
                                  Row(children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.fromLTRB
                                        (_LarguraTela * 0.55, _alturaTela * 0.01, 0,
                                          _alturaTela * 0.02),
                                      child: Container(
                                        height: _alturaTela * 0.04,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => detalhe()));
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
                                    )
                                  ]),
                                ]),
                              );
                            },
                            itemCount: clienteList.length,
                          );

                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                        future: carregarClientes(),
                      ),
                    ),

                  ),
                ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrarCliente()));
            },
            tooltip: 'Increment Counter',
            backgroundColor: Color(0xFF88d1ce),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.add,
                  size: 40,
                ))));
  }
}
