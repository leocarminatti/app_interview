import 'package:app_interview/app/data/model/user_model.dart';
import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/usecases/get_random_users_use_case.dart';
import 'package:app_interview/core/usecases/use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GithubRepositoryMock extends Mock implements GithubRepository {}

main() {
  late GetRandomUsersUseCase usecase;
  late GithubRepositoryMock repository;

  setUp(() {
    repository = GithubRepositoryMock();
    usecase = GetRandomUsersUseCase(repository);
  });

  test('should return list of UserModel', () async {
    when(() => repository.getRandomUsers())
        .thenAnswer((_) async => <UserModel>[]);

    var result = await usecase(const NoParams());
    expect(result, isA<List<UserModel>>());
  });

  test('should return empty case the return is empty', () async {
    when(() => repository.getRandomUsers()).thenAnswer((_) async => []);

    var result = await usecase(const NoParams());
    expect(result, []);
  });
}
