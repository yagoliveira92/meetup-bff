import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:args/args.dart' show ArgParser;

import 'app/routes/routes.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  var parser = ArgParser()
    ..addOption('port', abbr: 'p', defaultsTo: '8080')
    ..addOption('isolates', abbr: 'i', defaultsTo: '3');
  var arguments = parser.parse(args);

  var nbOfIsolates = int.parse(arguments['port']);
  for (int i = 1; i < nbOfIsolates; i++) {
    Isolate.spawn(_startShelfServer, [int.parse(arguments['port'])]);
  }
  _startShelfServer([int.parse(arguments['port'])]);

}

_startShelfServer(List args) async {
  int port = args[0];


  var handler = const Pipeline()
  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(
        logRequests(),
      )
      .addHandler(
        Routes.routes(),
      );

  final server = await shelf_io.serve(
  // For running in containers, we respect the PORT environment variable.
    handler,
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
    InternetAddress.anyIPv4, // Allows external connections
  final server = await serve(handler, ip, port);
    port,
  print('Server listening on port ${server.port}');
    shared: true,
  );
  print(
      'Serving at http://${server.address.host}:${server.port} - isolate: ${Isolate.current.hashCode}');
}