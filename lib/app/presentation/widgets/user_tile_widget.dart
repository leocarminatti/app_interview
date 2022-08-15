import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserEntity user;
  final Function()? onTap;

  const UserTile(
    this.user, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
      title: Text(user.login),
      onTap: onTap,
    );
  }
}
