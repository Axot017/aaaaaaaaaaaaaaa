const MAX_PAGES = 100;
const PAGES_STRING = ' page(s)';

String parseToPages(double value) => '${(value * MAX_PAGES).floor() * 10}$PAGES_STRING';

double parseFromPages(String pages) {
  if (pages != null) {
    return (int.parse(pages.replaceFirst(PAGES_STRING, '')) / 10) / MAX_PAGES;
  } else {
    return 0.0;
  }
}

const MAX_SEASONS = 50;
const SEASONS_STRING = ' season(s)';

String parseToSeasons(double value) => '${(value * MAX_SEASONS).floor()}$SEASONS_STRING';

double parseFromSeasons(String pages) {
  if (pages != null) {
    return (int.parse(pages.replaceFirst(SEASONS_STRING, ''))) / MAX_SEASONS;
  } else {
    return 0.0;
  }
}

const MAX_TIME = 240;
const HOURS_STRING = 'h';
const MINUTES_STRING = 'm';

String parseToTime(double value) {
  int intValue = (value * MAX_TIME).floor();
  int hours = (intValue / 60).floor();
  int minutes = (intValue % 60).floor();
  final result = StringBuffer();
  if (hours != 0) result.write('$hours $HOURS_STRING');
  if (hours != 0 && minutes != 0) result.write(' ');
  if (minutes != 0 || (hours == 0 && minutes == 0)) result.write('$minutes $MINUTES_STRING');
  return result.toString();
}

double parseFromTime(String time) {
  if (time == null) return 0.0;
  String withoutWhitespace = time.replaceAll(' ', '');
  int minutes;
  if (withoutWhitespace.contains(HOURS_STRING) && withoutWhitespace.contains(MINUTES_STRING)) {
    final split = withoutWhitespace.split(HOURS_STRING);
    final h = int.parse(split[0]) * 60;
    final m = int.parse(split[1].replaceFirst(MINUTES_STRING, ''));
    minutes = h + m;
  } else if (withoutWhitespace.contains(HOURS_STRING)) {
    minutes = int.parse(withoutWhitespace.replaceFirst(HOURS_STRING, '')) * 60;
  } else {
    minutes = int.parse(withoutWhitespace.replaceFirst(MINUTES_STRING, ''));
  }
  return minutes / MAX_TIME.toDouble();
}