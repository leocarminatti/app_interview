import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:app_interview/app/presentation/states/main_state.dart';
import 'package:app_interview/app/presentation/stores/main_store.dart';
import 'package:app_interview/app/presentation/widgets/search_box_widget.dart';
import 'package:app_interview/app/presentation/widgets/user_tile_widget.dart';
import 'package:app_interview/core/routes/app_router.gr.dart';
import 'package:app_interview/core/theme/app_colors.dart';
import 'package:app_interview/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  MainStore controller = getInstance.get<MainStore>()..init();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) => !controller.searchBox
              ? Text(AppLocalizations.of(context)!.search)
              : SearchBox(
                  key: const Key('searchBoxKey'),
                  controller: searchController,
                ),
        ),
        actions: [
          _buildActions(),
        ],
      ),
      body: Observer(
        builder: (_) {
          var state = controller.state;

          if (state is ErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedUserListState) {
            return _buildList(state.list);
          } else if (state is LoadedUserState) {
            return _buildUser(state.user);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Observer _buildActions() {
    return Observer(
      builder: (context) => !controller.searchBox
          ? IconButton(
              key: const Key('searchButtonOpen'),
              icon: const Icon(Icons.search),
              onPressed: () {
                controller.enableSearchBox(true);
              },
            )
          : Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.searchUserInformation(searchController.text);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.enableSearchBox(false);
                    if (searchController.text.isNotEmpty) {
                      searchController.text = '';
                      controller.init();
                    }
                  },
                ),
              ],
            ),
    );
  }

  Widget _buildList(List<UserEntity> list) {
    return ListView.separated(
      key: const Key('listUsers'),
      separatorBuilder: (_, index) => const Divider(color: AppColor.lightBlack),
      itemCount: list.length,
      itemBuilder: (_, index) {
        return UserTile(
          list[index],
          onTap: () => goToUserPage(list[index].login),
        );
      },
    );
  }

  Widget _buildUser(UserEntity user) {
    return UserTile(
      user,
      onTap: () => goToUserPage(user.login),
    );
  }

  void goToUserPage(String userId) {
    controller.disposeStore();
    getInstance.get<AppRouter>().navigate(UserRoute(userId: userId));
  }
}
