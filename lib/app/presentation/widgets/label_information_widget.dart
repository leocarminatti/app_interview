import 'package:app_interview/core/theme/app_colors.dart';
import 'package:app_interview/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class LabelInformation extends StatelessWidget {
  final String text;
  final String label;

  const LabelInformation({
    Key? key,
    required this.text,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTextStyle.Label().copyWith(color: AppColor.lightBlack),
        children: [
          TextSpan(
            text: text,
            style: AppTextStyle.h6().copyWith(color: AppColor.darkBlue),
          ),
        ],
      ),
    );
  }
}
