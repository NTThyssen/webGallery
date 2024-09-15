import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';

class AppTextStyles {
  static final TextStyle paragraph = TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'SourceCodePro',
    fontSize: 14,
    color: Colors.white,
  );

  static final TextStyle smallTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'SourceCodePro',
    fontSize: 20,
    color: Colors.white,
  );

  static final TextStyle price = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'SourceCodePro',
    fontSize: 18,
    color: AppColors.primary400,
  );

  static final TextStyle link = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'SourceCodePro',
    fontSize: 18,
    color: AppColors.link,
  );

  static final TextStyle formLabel = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'SourceCodePro',
    fontSize: 14,
    color: AppColors.primary300,
  );

  static final TextStyle list = TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'SourceCodePro',
    fontSize: 14,
    color: AppColors.listText,
  );

  static final TextStyle snackbarText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'SourceCodePro',
    fontSize: 16,
    color: AppColors.snackbarText,
  );

  static final TextStyle header = TextStyle(
    color: AppColors.primary,
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'SourceCodePro',
  );

  static final TextStyle headerLarge = TextStyle(
    color: Colors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'SourceCodePro',
  );

  static final TextStyle subheader = TextStyle(
    color: Color.fromARGB(255, 196, 196, 196),
    fontSize: 28.0,
    fontWeight: FontWeight.w100,
    fontFamily: 'SourceCodePro',
    fontStyle: FontStyle.italic,
  );

  static final TextStyle menuText = TextStyle(
    fontSize: 16.0,
    fontFamily: 'SourceCodePro',
    fontWeight: FontWeight.w400,
    color: AppColors.primary400,
  );
}
