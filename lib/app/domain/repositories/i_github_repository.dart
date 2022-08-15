import 'package:app_interview/app/data/model/repository_model.dart';
import 'package:app_interview/app/data/model/user_model.dart';

abstract class IGithubRepository {
  Future<List<UserModel>> getRandomUsers();
  Future<UserModel> getUserInformation(String userLoginId);
  Future<List<RepositoryModel>> getUserRepositories(String userLoginId);
}
