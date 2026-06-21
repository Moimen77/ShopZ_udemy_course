import 'dart:io';

class InternetConnectionGoogle {
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
}
