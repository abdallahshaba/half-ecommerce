import 'package:e_commerce_app14/core/class/status_request.dart';

handlingData(response) {
  if (response is StatusRequest) {
    if (response == StatusRequest.offlineFailure) {
      return StatusRequest.offlineFailure;
    } else {
      return StatusRequest.serverFaliure;
    }
  } else {
    return StatusRequest.success;
  }
}
