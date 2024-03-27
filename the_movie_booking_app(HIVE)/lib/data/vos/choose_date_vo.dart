

import 'package:intl/intl.dart';

class ChooseDateVO {
  String date = "";
  bool isSelected = false;

  ChooseDateVO(this.date, this.isSelected);
}

List<ChooseDateVO> chooseDate = List.generate(
  14,
  (index) {
    DateTime currentDate = DateTime.now().add(Duration(days: index));
    String formattedDate = DateFormat("yyyy-M-d").format(currentDate);
    return ChooseDateVO(formattedDate, false);
  },
);


String convertDateFormatForView(String dateString) {

  DateFormat inputFormat = DateFormat('yyyy-M-d');

  DateTime date = inputFormat.parse(dateString);

  DateFormat outPutFormat = DateFormat.MMMEd();

  String formattedDate = outPutFormat.format(date);

  return formattedDate;
}

// DateTime currentDate = DateTime.now();
// String formatDateForView = DateFormat.MMMEd().format(currentDate);