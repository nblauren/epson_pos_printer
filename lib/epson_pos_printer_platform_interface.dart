import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'epson_pos_printer_method_channel.dart';

abstract class EpsonPosPrinterPlatform extends PlatformInterface {
  /// Constructs a EpsonPosPrinterPlatform.
  EpsonPosPrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static EpsonPosPrinterPlatform _instance = MethodChannelEpsonPosPrinter();

  /// The default instance of [EpsonPosPrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelEpsonPosPrinter].
  static EpsonPosPrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EpsonPosPrinterPlatform] when
  /// they register themselves.
  static set instance(EpsonPosPrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
