import 'package:app_interview/app/domain/entities/user_entity.dart';

abstract class MainState {}

class StartState implements MainState {
  const StartState();
}

class LoadingState implements MainState {
  const LoadingState();
}

class LoadedUserListState implements MainState {
  final List<UserEntity> list;
  const LoadedUserListState(this.list);
}

class LoadedUserState implements MainState {
  final UserEntity user;
  const LoadedUserState(this.user);
}

class ErrorState implements MainState {
  final Exception error;
  const ErrorState(this.error);
}
