import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:epson_pos_printer/epson_pos_printer_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEpsonPosPrinter platform = MethodChannelEpsonPosPrinter();
  const MethodChannel channel = MethodChannel('epson_pos_printer');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
