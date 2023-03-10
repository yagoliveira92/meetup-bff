import 'package:shelf_router/shelf_router.dart' as shelf_router;

import '../controllers/hello_world_controller.dart';
import '../controllers/name_details_controller.dart';

class Routes {
  static shelf_router.Router routes() {
    final router = shelf_router.Router()
      ..get(
        '/helloworld',
        HelloWorldController.helloWorldHandler,
      )
      ..get(
        '/namedetails',
        NameDetailsController.nameDetailsController,
      );
    return router;
  }
}
