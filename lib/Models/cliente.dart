import 'dart:convert';

List<Cliente> clienteFromJson(String str) => List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

String clienteToJson(List<Cliente> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cliente {
  String objectId;
  String Nome;
  String Email;
  String CPF;
  String Telefone;
  String Telefone2;
  DateTime Aniversario;


  Cliente({
    this.objectId,
    this.Nome,
    this.Email,
    this.CPF,
    this.Telefone,
    this.Telefone2,
    this.Aniversario
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
    objectId: json["objectId"],
    Nome: json["Nome"],
    Email: json["Email"],
    CPF: json["CPF"],
    Telefone: json["Telefone"],
    Telefone2: json["Telefone2"],
    Aniversario: json["Aniversario"],
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "Nome": Nome,
    "Email": Email,
    "CPF": CPF,
    "Telefone": Telefone,
    "Telefone2": Telefone2,
    "Aniversario": Aniversario,
  };
}
