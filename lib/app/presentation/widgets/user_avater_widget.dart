import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String url;
  const UserAvatar({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(url, fit: BoxFit.fill),
    );
  }
}
