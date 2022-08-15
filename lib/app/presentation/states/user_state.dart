import 'package:app_interview/app/domain/entities/user_entity.dart';

abstract class UserState {}

class StartState implements UserState {
  const StartState();
}

class LoadingState implements UserState {
  const LoadingState();
}

class LoadedState implements UserState {
  final UserEntity user;
  const LoadedState(this.user);
}

class ErrorState implements UserState {
  final Exception error;
  const ErrorState(this.error);
}
