library angola_validator;

import 'package:dio/dio.dart';

/*When the return is 'Activate' it means that the bi is existing */
Future<String> validateBI(String value) async {
  try {
    var response = await Dio().post("https://bi-bs.minjusdh.gov.ao/pims-backend/api/v1/progress", data: {
    "affairsReceipt": value,
    "affairsType": "IDCard",
    "captchaValue": ""
  });

  if(response.data case {"affairsProgressState": String state}){
    return state;
  }
  return Future.error(response.data);
  } catch (e) {
    return Future.error(e.toString());
  }
}
