import 'package:app_interview/app/domain/usecases/get_user_repositories_use_case.dart';
import 'package:app_interview/app/presentation/states/repositories_state.dart';
import 'package:mobx/mobx.dart';
part 'repositories_store.g.dart';

class RepositoriesStore = RepositoriesStoreBase with _$RepositoriesStore;

abstract class RepositoriesStoreBase with Store {
  final GetUserRepositoriesUseCase getUserRepositoriesUseCase;

  RepositoriesStoreBase(this.getUserRepositoriesUseCase);

  @observable
  RepositoriesState state = const StartState();

  Future<void> init(String userId) async {
    setState(const LoadingState());
    try {
      final repositories =
          await getUserRepositoriesUseCase(RepositoryParams(userId));
      setState(LoadedState(repositories));
    } on Exception catch (e) {
      setState(ErrorState(e));
    }
  }

  @action
  void setState(RepositoriesState value) => state = value;
}
