import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'epson_pos_printer_platform_interface.dart';

/// An implementation of [EpsonPosPrinterPlatform] that uses method channels.
class MethodChannelEpsonPosPrinter extends EpsonPosPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('epson_pos_printer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
