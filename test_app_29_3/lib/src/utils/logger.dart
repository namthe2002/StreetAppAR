import 'dart:io';

import 'package:MyApp/main.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

var logger = Logger(
    printer: PrettyPrinter(
      printTime: true,
    ),
    /*
  Output of log to Console or File
   */
    output: ConsoleOutput(),
    //<-----File----->
    // output: FileOutput(
    //   file: File("cdg_log_1.txt")
    // ),
    //<-----Console----->
    // output: ConsoleOutput(),

    /*
  Filter of log for Debug and Release mode:
  DevelopmentFilter:
  - Debug: Log on
  - Production: Log off
  ProductionFilter
  - Debug: Log on
  - Production: Log on
   */
    // filter: isLogConsole ? DevelopmentFilter() : ProductionFilter(),
    //<-----Development----->
    // filter: DevelopmentFilter(),
    //<-----Production----->
    // filter: ProductionFilter(),
    //<-----No Log----->
    filter: DevelopmentFilter());

// var logger = Logger(
//   filter: MyFilter()
// );
//
class NoLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return false;
  }
}
