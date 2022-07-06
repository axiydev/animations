import 'dart:convert';

import 'package:animations/models/common_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoaderDb {
  static Future<CommonModel> getData(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/database/data.json');

    return CommonModel.fromJson(jsonDecode(data));
  }

  static Future<CommonModel> loadMoreJson(BuildContext context) async {
    return compute(getData, context);
  }
}
