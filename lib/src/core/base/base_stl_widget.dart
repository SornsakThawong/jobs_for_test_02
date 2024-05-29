import 'package:flutter/material.dart';

import '../../../flavor/build_config.dart';
import '../../language/language_widget.dart';

abstract class BaseStlScreen extends StatelessWidget {
  BaseStlScreen({super.key});

  @protected
  final AppBar appBar = AppBar(
    title: Text(
      BuildConfig.instance.config.appName,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    actions: [LanguageWidget()],
  );

  String get appName => BuildConfig.instance.config.appName;
}
