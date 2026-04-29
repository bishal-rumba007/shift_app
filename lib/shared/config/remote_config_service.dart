import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService(this.remoteConfig);

  Future<void> init() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),

        // DEV MODE: instant updates
        minimumFetchInterval: Duration.zero,
      ),
    );

    await remoteConfig.setDefaults({
      "config": "{}",
    });
  }

  Future<void> fetch() async {
    await remoteConfig.fetchAndActivate();
  }

  String get rawConfig => remoteConfig.getString("config");
}