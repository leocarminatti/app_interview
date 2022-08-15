import 'package:app_interview/app/domain/usecases/get_random_users_use_case.dart';
import 'package:app_interview/app/domain/usecases/get_user_information_use_case.dart';
import 'package:app_interview/app/presentation/states/main_state.dart';
import 'package:app_interview/core/usecases/use_case.dart';
import 'package:mobx/mobx.dart';
part 'main_store.g.dart';

class MainStore = MainStoreBase with _$MainStore;

abstract class MainStoreBase with Store {
  final GetRandomUsersUseCase getRandomUsersUseCase;
  final GetUserInformationUseCase getUserInformationUseCase;

  MainStoreBase(
    this.getRandomUsersUseCase,
    this.getUserInformationUseCase,
  );

  late ReactionDisposer dispose;

  @observable
  MainState state = const StartState();

  @observable
  bool searchBox = false;

  void init() async {
    await loadRandomUsers();

    dispose = autorun((_) {
      if (state is LoadedUserListState) {
        Future.delayed(
          const Duration(seconds: 15),
          () async {
            await loadRandomUsers();
          },
        );
      }
    });
  }

  void disposeStore() {
    dispose();
  }

  Future<void> loadRandomUsers() async {
    setState(const LoadingState());
    try {
      setState(
          LoadedUserListState(await getRandomUsersUseCase(const NoParams())));
    } on Exception catch (e) {
      setState(ErrorState(e));
    }
  }

  Future<void> searchUserInformation(String text) async {
    setState(const LoadingState());
    try {
      setState(
          LoadedUserState(await getUserInformationUseCase(UserParams(text))));
    } on Exception catch (e) {
      setState(ErrorState(e));
    }
  }

  @action
  void setState(MainState value) => state = value;

  @action
  void enableSearchBox(bool value) => searchBox = value;
}
