import 'dart:convert';
import 'cliente.dart';
import 'procedimento.dart';
import 'funcionario.dart';

List<Agendamento> agendamentoFromJson(String str) => List<Agendamento>.from(json.decode(str).map((x) => Agendamento.fromJson(x)));

String agendamentoToJson(List<Agendamento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Agendamento {
  String objectId;
  Cliente ClienteFK;
  Funcionario FuncFK;
  Procedimento ProcFK;
  String Observacao;
  String DataAgendamento;
  String Hora;

  Agendamento({
    this.objectId,
    this.ClienteFK,
    this.FuncFK,
    this.ProcFK,
    this.Observacao,
    this.DataAgendamento,
    this.Hora
  });

  factory Agendamento.fromJson(Map<String, dynamic> json) => Agendamento(
    objectId: json["objectId"],
    ClienteFK: json["IdClienteFK"],
      FuncFK: json["IdFuncFK"],
    ProcFK: json["IdProcFK"],
    Observacao: json["Observacao"],
    DataAgendamento: json["DataAgendamento"],
      Hora: json["Hora"]
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdClienteFK": ClienteFK,
    "IdFuncFK": FuncFK,
    "IdProcFK": ProcFK,
    "Observacao": Observacao,
    "DataAgendamento": DataAgendamento,
    "Hora": Hora
  };
}
