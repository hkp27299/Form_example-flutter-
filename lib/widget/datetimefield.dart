import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

String validator(DateTime value) {
  if (value == null) {
    return "This field can not be empty";
  } else {
    return null;
  }
}

Widget dateTimeField() {
  final format = DateFormat("yyyy-MM-dd");
  return DateTimeField(
    validator: validator,
    format: format,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.calendar_today),
      hintText: 'Select Date',
      labelText: 'Next Review',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    ),
    onShowPicker: (context, currentValue) {
      return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100));
    },
  );
}
