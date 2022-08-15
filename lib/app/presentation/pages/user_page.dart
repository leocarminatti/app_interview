import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:app_interview/app/presentation/states/user_state.dart';
import 'package:app_interview/app/presentation/stores/user_store.dart';
import 'package:app_interview/app/presentation/widgets/user_card_widget.dart';
import 'package:app_interview/core/routes/app_router.gr.dart';
import 'package:app_interview/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPage extends StatelessWidget {
  final String userId;
  late UserStore controller;

  UserPage({
    Key? key,
    required this.userId,
  }) : super(key: key) {
    controller = getInstance.get<UserStore>()..init(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.userPage),
      ),
      body: Observer(builder: (context) {
        var state = controller.state;

        if (state is ErrorState) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return _buildUser(state.user, context);
        } else {
          return Container();
        }
      }),
    );
  }

  Widget _buildUser(UserEntity user, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          UserCard(
            user: user,
            isMyContact: controller.isMyContact,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => getInstance.get<AppRouter>().navigate(
                  RepositoriesRoute(userId: userId),
                ),
            child: Text(
              AppLocalizations.of(context)!.myRepository,
            ),
          )
        ],
      ),
    );
  }
}
