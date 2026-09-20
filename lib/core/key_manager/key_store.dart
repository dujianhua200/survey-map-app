import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyStore {
  static final KeyStore _instance = KeyStore._internal();
  factory KeyStore() => _instance;
  KeyStore._internal();

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const String _tiandituKeyPrefix = 'tianditu_key_';
  static const String _mapboxTokenKey = 'mapbox_token';

  Future<void> setTiandituKey(String key, {int index = 0}) async {
    await _storage.write(key: '$_tiandituKeyPrefix$index', value: key);
  }

  Future<String?> getTiandituKey({int index = 0}) async {
    return await _storage.read(key: '$_tiandituKeyPrefix$index');
  }

  Future<void> deleteTiandituKey({int index = 0}) async {
    await _storage.delete(key: '$_tiandituKeyPrefix$index');
  }

  Future<List<String>> getAllTiandituKeys() async {
    final all = await _storage.readAll();
    return all.entries
        .where((e) => e.key.startsWith(_tiandituKeyPrefix))
        .map((e) => e.value)
        .where((v) => v != null && v.isNotEmpty)
        .cast<String>()
        .toList();
  }

  Future<void> setMapboxToken(String token) async {
    await _storage.write(key: _mapboxTokenKey, value: token);
  }

  Future<String?> getMapboxToken() async {
    return await _storage.read(key: _mapboxTokenKey);
  }

  Future<void> deleteMapboxToken() async {
    await _storage.delete(key: _mapboxTokenKey);
  }
}
