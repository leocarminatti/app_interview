import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:app_interview/app/presentation/widgets/label_information_widget.dart';
import 'package:app_interview/app/presentation/widgets/my_contact_widget.dart';
import 'package:app_interview/app/presentation/widgets/user_avater_widget.dart';
import 'package:app_interview/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;
  final bool isMyContact;

  const UserCard({
    Key? key,
    required this.isMyContact,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: UserAvatar(
                  url: user.avatarUrl,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              isMyContact
                  ? MyContact(
                      text: AppLocalizations.of(context)!.isYourContact,
                      color: AppColor.green,
                    )
                  : MyContact(
                      text: AppLocalizations.of(context)!.isntYourContact,
                      color: AppColor.red,
                    ),
              const SizedBox(
                height: 20,
              ),
              LabelInformation(
                label: '${AppLocalizations.of(context)!.name}: ',
                text: user.name ?? user.login,
              ),
              const SizedBox(
                height: 20,
              ),
              LabelInformation(
                label: '${AppLocalizations.of(context)!.email}: ',
                text: user.email ?? AppLocalizations.of(context)!.undefined,
              ),
              const SizedBox(
                height: 20,
              ),
              LabelInformation(
                label: '${AppLocalizations.of(context)!.location}: ',
                text: user.location ?? AppLocalizations.of(context)!.undefined,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
