import 'dart:convert';
import 'package:salooni/Models/cliente.dart';
import 'package:salooni/Models/procedimento.dart';

List<Historico> historicoFromJson(String str) => List<Historico>.from(json.decode(str).map((x) => Historico.fromJson(x)));

String historicoToJson(List<Historico> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Historico{
  String objectId;
  Procedimento IdProcFK;
  String Valor;
  Cliente ClienteFK;
  String DataManutencao;


  Historico({
    this.objectId,
    this.IdProcFK,
    this.Valor,
    this.DataManutencao,
    this.ClienteFK
  });

  factory Historico.fromJson(Map<String, dynamic> json) => Historico(
    objectId: json["objectId"],
      IdProcFK: json["IdProcFK"],
    Valor: json["Valor"],
    DataManutencao: json["DataManutencao"],
      ClienteFK: json["Cliente"]

  );
  Map<String, dynamic> toJson() =>{
    "objectId":objectId,
    "IdProcFK":IdProcFK,
    "Valor":Valor,
    "DataManutencao":DataManutencao,
    "Cliente": ClienteFK
  };
}


