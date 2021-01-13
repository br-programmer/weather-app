import 'package:meta/meta.dart' show required;

class ApiException {
  final String text;
  final int code;

  ApiException({@required this.text, @required this.code});
}
