import 'package:flutter/material.dart';

InputDecoration InputDecorationStyle(String lebelText) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    border: OutlineInputBorder(),
    labelText: lebelText,
  );
}

ButtonStyle ButtonStyleApp() {
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(17),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),

  );
}

SizedBox SizedBox50(child) {
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(08),
      child: child,
    ),
  );
}
