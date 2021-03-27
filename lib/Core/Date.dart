import 'package:intl/intl.dart';

class Date {
  final DateTime dateNow = DateTime.now();

  String get weekDay {
    switch (DateFormat('EEEE').format(dateNow)) {
      case 'Sunday':
        {
          return 'Ahad';
        }
        break;
      case 'Monday':
        {
          return 'Isnin';
        }
        break;
      case 'Tuesday':
        {
          return 'Selasa';
        }
        break;
      case 'Wednesday':
        {
          return 'Rabu';
        }
        break;
      case 'Thursday':
        {
          return 'Khamis';
        }
        break;
      case 'Friday':
        {
          return 'Jumaat';
        }
        break;
      case 'Saturday':
        {
          return 'Sabtu';
        }
        break;

      default:
        {
          return 'error';
        }
        break;
    }
  }

  String get date {
    return '$_day $_month $_year';
  }

  String get _day {
    return DateFormat('d').format(dateNow);
  }

  String get _month {
    switch (DateFormat('MMMM').format(dateNow)) {
      case 'January':
        {
          return 'Januari';
        }
        break;
      case 'February':
        {
          return 'Februari';
        }
        break;
      case 'March':
        {
          return 'Mac';
        }
        break;
      case 'April':
        {
          return 'April';
        }
        break;
      case 'May':
        {
          return 'Mei';
        }
        break;
      case 'June':
        {
          return 'Jun';
        }
        break;
      case 'July':
        {
          return 'Julai';
        }
        break;
      case 'August':
        {
          return 'Ogos';
        }
        break;
      case 'September':
        {
          return 'September';
        }
        break;
      case 'October':
        {
          return 'Oktober';
        }
        break;
      case 'November':
        {
          return 'November';
        }
        break;
      case 'December':
        {
          return 'Disember';
        }
        break;

      default:
        {
          return 'error';
        }
        break;
    }
  }

  String get _year {
    return DateFormat('y').format(dateNow);
  }
}
