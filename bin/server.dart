import 'dart:io';
import 'dart:isolate';

import 'package:args/args.dart' show ArgParser;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'app/routes/routes.dart';

Future main(List<String> args) async {
  var parser = ArgParser()
    ..addOption('port', abbr: 'p', defaultsTo: '8080')
    ..addOption('isolates', abbr: 'i', defaultsTo: '3');
  var arguments = parser.parse(args);

  var nbOfIsolates = int.parse(arguments['isolates']);
  for (int i = 1; i < nbOfIsolates; i++) {
    Isolate.spawn(_startShelfServer, [int.parse(arguments['port'])]);
  }
  _startShelfServer([int.parse(arguments['port'])]);
}

_startShelfServer(List args) async {
  int port = args[0];

  var handler = const Pipeline()
      .addMiddleware(
        logRequests(),
      )
      .addHandler(
        Routes.routes(),
      );

  final server = await shelf_io.serve(
    handler,
    InternetAddress.anyIPv4, // Allows external connections
    port,
    shared: true,
  );
  print(
      'Serving at http://${server.address.host}:${server.port} - isolate: ${Isolate.current.hashCode}');
}
