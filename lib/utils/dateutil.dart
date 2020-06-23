import 'package:jiffy/jiffy.dart';

class DateUtil {
  static String getElapsedTimeFromNow(DateTime targetDateTime) {
    return Jiffy(targetDateTime).fromNow(); //TODO check verb
  }
}
