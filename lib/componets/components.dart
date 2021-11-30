

import 'package:flutter/material.dart';

void navegatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navegatToAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) {
  return false;
});