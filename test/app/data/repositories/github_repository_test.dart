import 'dart:convert';

import 'package:app_interview/app/data/data_sources/remote/github_api.dart';
import 'package:app_interview/app/data/model/repository_model.dart';
import 'package:app_interview/app/data/model/user_model.dart';
import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class GithubApiMock extends Mock implements GitHubApi {}

void main() {
  late GithubRepository repository;
  late GithubApiMock datasource;

  setUp(() {
    datasource = GithubApiMock();
    repository = GithubRepository(datasource);
  });

  group('getRandomUsers', () {
    final tResponse = List<Map<String, dynamic>>.from(
      jsonDecode(
        fixture('users.json'),
      ),
    );

    test('should return list of UserModel', () async {
      when(() => datasource.getRandomUsers()).thenAnswer(
        (_) async => tResponse,
      );

      final result = await repository.getRandomUsers();

      expect(result, isA<List<UserModel>>());
    });

    test('should return error if datasource failure', () async {
      when(() => datasource.getRandomUsers()).thenThrow(Exception());

      expect(() => repository.getRandomUsers(), throwsA(isA<Exception>()));
    });
  });

  group('getUserInformation', () {
    final tResponse = jsonDecode(
      fixture('user.json'),
    );

    test('should return UserModel', () async {
      when(() => datasource.getUserInformation(any())).thenAnswer(
        (_) async => tResponse,
      );

      final result = await repository.getUserInformation('octocat');

      expect(result, isA<UserModel>());
    });

    test('should return error if datasource failure', () async {
      when(() => datasource.getUserInformation(any())).thenThrow(Exception());

      expect(() => repository.getUserInformation('octocat'),
          throwsA(isA<Exception>()));
    });
  });

  group('getUserRepositories', () {
    final tResponse = List<Map<String, dynamic>>.from(
      jsonDecode(
        fixture('users_repositories.json'),
      ),
    );

    test('should return list of RepositoryModel', () async {
      when(() => datasource.getUserRepositories(any()))
          .thenAnswer((_) async => tResponse);

      final result = await repository.getUserRepositories('octocat');

      expect(result, isA<List<RepositoryModel>>());
    });

    test('should return error if datasource failure', () async {
      when(() => datasource.getUserRepositories(any())).thenThrow(Exception());

      expect(() => repository.getUserRepositories('octocat'),
          throwsA(isA<Exception>()));
    });
  });
}
