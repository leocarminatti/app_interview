import 'dart:convert';

import 'package:app_interview/app/data/model/user_model.dart';
import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/usecases/get_user_information_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class GithubRepositoryMock extends Mock implements GithubRepository {}

main() {
  late GetUserInformationUseCase usecase;
  late GithubRepositoryMock repository;

  setUp(() {
    repository = GithubRepositoryMock();
    usecase = GetUserInformationUseCase(repository);
  });

  final tResponse = UserModel.fromJson(
    jsonDecode(fixture('user.json')),
  );

  test('should return list of UserModel', () async {
    when(() => repository.getUserInformation(any()))
        .thenAnswer((_) async => tResponse);

    var result = await usecase(UserParams('octocat'));
    expect(result, isA<UserModel>());
  });
}
