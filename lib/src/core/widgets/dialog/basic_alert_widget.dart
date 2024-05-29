import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../language/language_key.dart';

class BasicAlertWidget {
  static Future alertWarning({
    String contents = "",
    String title = "",
  }) async {
    String textButton = LanguageKey.close;
    await Get.defaultDialog(
      contentPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.white,
      title: title,
      titleStyle: const TextStyle(
          // color: Palette.kBlackColor1,
          // fontFamily: Fonts.fontPromptRegular,
          fontSize: 18),
      content: Column(
        children: [
          Text(
            contents,
            style: const TextStyle(
              // color: Palette.kBlackColor1,
              // fontFamily: Fonts.fontPromptRegular,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      confirm: SizedBox(
        width: 100,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.red,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(
            textButton.tr.toUpperCase(),
            style: const TextStyle(
              // color: Palette.kBlackColor1,
              // fontFamily: Fonts.fontPromptRegular,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
