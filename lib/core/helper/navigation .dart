import 'package:flutter/material.dart';

void PushNavigation(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void popNavigation(BuildContext context){

  Navigator.pop(context);
}
