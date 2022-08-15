import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:app_interview/core/usecases/use_case.dart';

class GetRandomUsersUseCase implements UseCase<List<UserEntity>, NoParams> {
  final GithubRepository repository;

  GetRandomUsersUseCase(this.repository);

  @override
  Future<List<UserEntity>> call(NoParams) async {
    return await repository.getRandomUsers();
  }
}
