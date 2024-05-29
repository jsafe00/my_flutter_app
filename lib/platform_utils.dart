import 'dart:io';

String getBaseUrl() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8081/api/v1/quotes';
  } else if (Platform.isIOS) {
    return 'http://127.0.0.1:8081/api/v1/quotes';
  } else {
    throw UnsupportedError('Unsupported platform');
  }
}
