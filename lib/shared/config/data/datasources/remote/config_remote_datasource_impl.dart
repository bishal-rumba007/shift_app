import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shift_app/shared/config/data/datasources/remote/config_remote_datasource.dart';

import '../../models/feature_config_model.dart';

class FirebaseConfigDataSource implements ConfigRemoteDataSource {
  final FirebaseRemoteConfig rc;

  FirebaseConfigDataSource(this.rc);

  @override
  Future<FeatureConfigModel> getConfig() async {
    await rc.fetchAndActivate();

    final json = jsonDecode(rc.getString("config"));

    return FeatureConfigModel.fromJson(json);
  }
}