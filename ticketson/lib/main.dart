import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO do we need this???
  GestureBinding.instance.resamplingEnabled = true;
  runApp(const App());
}
