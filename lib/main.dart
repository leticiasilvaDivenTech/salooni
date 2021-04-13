import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'Inicial/home_page.dart';
import 'package:salooni/config.dart';

void main() async  {
  runApp(MaterialApp(
    home: HomePage(),
  ));

  await Parse().initialize(kParseApplicationId, kParseServerUrl,
      clientKey: kParseClienteKey, autoSendSessionId: true);
}
