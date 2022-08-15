import 'package:app_interview/core/theme/app_colors.dart';
import 'package:app_interview/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class MyContact extends StatelessWidget {
  final String text;
  final Color? color;

  const MyContact({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: color ?? AppColor.lightBlack,
              borderRadius: const BorderRadius.all(Radius.circular(50))),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text,
            style: AppTextStyle.h5().copyWith(
              color: color ?? AppColor.lightBlack,
            )),
      ],
    );
  }
}
