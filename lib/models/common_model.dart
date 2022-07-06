import 'package:animations/models/data_model.dart';

class CommonModel {
  List<DataDb> result;
  String? message;
  CommonModel.fromJson(Map<String, dynamic> json)
      : result =
            List<DataDb>.from(json['result'].map((e) => DataDb.fromJson(e))),
        message = json['message'];
}
