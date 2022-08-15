import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/entities/repository_entity.dart';
import 'package:app_interview/core/usecases/use_case.dart';

class GetUserRepositoriesUseCase
    implements UseCase<List<RepositoryEntity>, RepositoryParams> {
  final GithubRepository repository;

  GetUserRepositoriesUseCase(this.repository);

  @override
  Future<List<RepositoryEntity>> call(RepositoryParams params) async {
    return await repository.getUserRepositories(params.userLoginId);
  }
}

class RepositoryParams {
  RepositoryParams(this.userLoginId);

  final String userLoginId;
}
