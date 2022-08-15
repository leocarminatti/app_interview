import 'package:app_interview/app/domain/usecases/get_user_information_use_case.dart';
import 'package:app_interview/app/presentation/states/user_state.dart';
import 'package:app_interview/core/services/contacts_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final GetUserInformationUseCase getUserInformationUseCase;

  UserStoreBase(this.getUserInformationUseCase);

  @observable
  UserState state = const StartState();

  @observable
  bool isMyContact = false;

  Future<void> init(String userId) async {
    setState(const LoadingState());
    try {
      final user = await getUserInformationUseCase(UserParams(userId));
      if (!kIsWeb) {
        isMyContact = ContactsService.comparerContact(user.login);
      }

      setState(LoadedState(user));
    } on Exception catch (e) {
      setState(ErrorState(e));
    }
  }

  @action
  void setState(UserState value) => state = value;
}
