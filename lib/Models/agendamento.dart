import 'dart:convert';
import 'cliente.dart';
import 'procedimento.dart';
import 'funcionario.dart';

List<Agendamento> agendamentoFromJson(String str) => List<Agendamento>.from(json.decode(str).map((x) => Agendamento.fromJson(x)));

String agendamentoToJson(List<Agendamento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Agendamento {
  String objectId;
  Object IdClienteFK;
  Funcionario IdFuncFK;
  Procedimento IdProcFK;
  String Observacao;
  String DataAgendamento;


  Agendamento({
    this.objectId,
    this.IdClienteFK,
    this.IdFuncFK,
    this.IdProcFK,
    this.Observacao,
    this.DataAgendamento
  });

  factory Agendamento.fromJson(Map<String, dynamic> json) => Agendamento(
    objectId: json["objectId"],
    IdClienteFK: json["IdClienteFK"],
      IdFuncFK: json["IdFuncFK"],
    IdProcFK: json["IdProcFK"],
    Observacao: json["Observacao"],
    DataAgendamento: json["DataAgendamento"]
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdClienteFK": IdClienteFK,
    "IdFuncFK": IdFuncFK,
    "IdProcFK": IdProcFK,
    "Observacao": Observacao,
    "DataAgendamento": DataAgendamento
  };
}
