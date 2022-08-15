import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:app_interview/core/usecases/use_case.dart';

class GetUserInformationUseCase implements UseCase<UserEntity, UserParams> {
  final GithubRepository repository;

  GetUserInformationUseCase(this.repository);

  @override
  Future<UserEntity> call(UserParams params) async {
    return await repository.getUserInformation(params.userLoginId);
  }
}

class UserParams {
  UserParams(this.userLoginId);

  final String userLoginId;
}
