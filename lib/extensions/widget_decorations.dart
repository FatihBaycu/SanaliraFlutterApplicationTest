import 'package:flutter/material.dart';

BoxDecoration get boxDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(spreadRadius: 3, color: Colors.white),
      ],
    );

InputDecoration get textFiledDecoration => InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(243, 244, 246, 255),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 3, color: Colors.transparent),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

OutlineInputBorder get textFiledBorder => OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: Colors.transparent),
      borderRadius: BorderRadius.circular(20.0),
    );