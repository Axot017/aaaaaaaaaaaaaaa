import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    printTime: true,
    methodCount: 2,
    errorMethodCount: 8
  )
);