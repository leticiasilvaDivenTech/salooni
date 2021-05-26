import 'dart:convert';
import 'package:salooni/Models/agendamento.dart';
import 'cliente.dart';
import 'procedimento.dart';

List<AgendaProc> agendaProcFromJson(String str) => List<AgendaProc>.from(json.decode(str).map((x) => AgendaProc.agendaProcFromJson(x)));

String agendaProcoToJson(List<AgendaProc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgendaProc {
  String objectId;
  Procedimento ProcFK;
  Agendamento AgendFK;
  Cliente ClienteFK;

  AgendaProc({
    this.objectId,
    this.ClienteFK,
    this.ProcFK,
    this.AgendFK
  });


  factory AgendaProc.agendaProcFromJson(Map<String, dynamic> json) => AgendaProc(
      objectId: json["objectId"],
      ClienteFK: json["IdClienteFK"],
      ProcFK: json["IdProcFK"],
      AgendFK : json["IdAgenFK"]

  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdClienteFK": ClienteFK,
    "IdProcFK": ProcFK,
    "IdAgenFK": AgendFK
  };
}
