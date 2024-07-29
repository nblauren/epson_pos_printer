import 'package:flutter_test/flutter_test.dart';
import 'package:epson_pos_printer/epson_pos_printer.dart';
import 'package:epson_pos_printer/epson_pos_printer_platform_interface.dart';
import 'package:epson_pos_printer/epson_pos_printer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEpsonPosPrinterPlatform
    with MockPlatformInterfaceMixin
    implements EpsonPosPrinterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EpsonPosPrinterPlatform initialPlatform = EpsonPosPrinterPlatform.instance;

  test('$MethodChannelEpsonPosPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEpsonPosPrinter>());
  });

  test('getPlatformVersion', () async {
    EpsonPosPrinter epsonPosPrinterPlugin = EpsonPosPrinter();
    MockEpsonPosPrinterPlatform fakePlatform = MockEpsonPosPrinterPlatform();
    EpsonPosPrinterPlatform.instance = fakePlatform;

    expect(await epsonPosPrinterPlugin.getPlatformVersion(), '42');
  });
}
