import 'package:flutter/material.dart';

import '../config/app_values.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  });
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppValues.mobileWidth) {
          return mobileBody;
        } else if (constraints.maxWidth < AppValues.tabletWidth) {
          return tabletBody ?? mobileBody;
        }
        return desktopBody ?? mobileBody;
      },
    );
  }
}
