import 'package:app_interview/app/domain/entities/repository_entity.dart';

abstract class RepositoriesState {}

class StartState implements RepositoriesState {
  const StartState();
}

class LoadingState implements RepositoriesState {
  const LoadingState();
}

class LoadedState implements RepositoriesState {
  final List<RepositoryEntity> list;
  const LoadedState(this.list);
}

class ErrorState implements RepositoriesState {
  final Exception error;
  const ErrorState(this.error);
}
