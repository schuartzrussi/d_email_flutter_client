import 'package:d_email_flutter_client/data/email/model.dart';

class WriteEmailArguments {
  Email? responseTo;
  List<String>? to;

  WriteEmailArguments({this.responseTo, this.to});
}
