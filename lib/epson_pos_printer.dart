
import 'epson_pos_printer_platform_interface.dart';

class EpsonPosPrinter {
  Future<String?> getPlatformVersion() {
    return EpsonPosPrinterPlatform.instance.getPlatformVersion();
  }
}
