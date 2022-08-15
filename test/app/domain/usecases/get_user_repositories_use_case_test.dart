import 'package:app_interview/app/data/model/repository_model.dart';
import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/usecases/get_user_repositories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GithubRepositoryMock extends Mock implements GithubRepository {}

main() {
  late GetUserRepositoriesUseCase usecase;
  late GithubRepositoryMock repository;

  setUp(() {
    repository = GithubRepositoryMock();
    usecase = GetUserRepositoriesUseCase(repository);
  });

  test('should return list of RepositoryModel', () async {
    when(() => repository.getUserRepositories(any()))
        .thenAnswer((_) async => <RepositoryModel>[]);

    var result = await usecase(RepositoryParams('octocat'));
    expect(result, isA<List<RepositoryModel>>());
  });

  test('should return empty case the return is empty', () async {
    when(() => repository.getUserRepositories(any()))
        .thenAnswer((_) async => []);

    var result = await usecase(RepositoryParams('octocat'));
    expect(result, []);
  });
}
