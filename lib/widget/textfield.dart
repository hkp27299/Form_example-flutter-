import 'package:flutter/material.dart';
  String validator(String value) {
    if (value.isEmpty) {
      return "This field can not be empty";
    } else {
      return null;
    }
  }

Widget textfield(String hint,String lable,ctrl,icon){
  return TextFormField(
              decoration: InputDecoration(
                suffixIcon: icon == null ? null : icon,
                hintText: hint,
                labelText: lable,
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
              controller: ctrl,
              validator: validator,
            );
}