import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if (value.isEmpty) {
    return "Field is required";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid Username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not Valid Email";
    }
  }

   if (type == "region") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid Region";
    }
  }

  if (type == "city") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid City";
    }
  }

  if (type == "street") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid Street";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Not Valid Phone Number";
    }
  }

  if (value.length < min) {
    return "Can't be less than $min";
  }

  if (value.length > max) {
    return "Can't be larger than $max";
  }
}
