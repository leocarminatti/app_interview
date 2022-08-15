import 'package:app_interview/app/data/data_sources/remote/github_api.dart';
import 'package:app_interview/app/data/model/repository_model.dart';
import 'package:app_interview/app/data/model/user_model.dart';
import 'package:app_interview/app/domain/repositories/i_github_repository.dart';

class GithubRepository implements IGithubRepository {
  final GitHubApi dataSource;

  GithubRepository(this.dataSource);

  @override
  Future<List<UserModel>> getRandomUsers() async {
    try {
      final result = await dataSource.getRandomUsers();

      return result.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error get Random Users');
    }
  }

  @override
  Future<UserModel> getUserInformation(String userLoginId) async {
    try {
      final result = await dataSource.getUserInformation(userLoginId);

      return UserModel.fromJson(result);
    } catch (e) {
      throw Exception('Error get User Information');
    }
  }

  @override
  Future<List<RepositoryModel>> getUserRepositories(String userLoginId) async {
    try {
      final result = await dataSource.getUserRepositories(userLoginId);

      return result.map((e) => RepositoryModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error get User Repositories');
    }
  }
}
