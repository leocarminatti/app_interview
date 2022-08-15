import 'package:app_interview/app/app_widget.dart';
import 'package:app_interview/core/services/contacts_service.dart';
import 'package:app_interview/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  if (!kIsWeb) {
    await ContactsService.init();
  }

  runApp(App());
}
