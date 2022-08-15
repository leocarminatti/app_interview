import 'dart:convert';

import 'package:app_interview/app/data/model/repository_model.dart';
import 'package:app_interview/app/domain/entities/repository_entity.dart';
import 'package:app_interview/app/domain/usecases/get_user_repositories_use_case.dart';
import 'package:app_interview/app/presentation/states/repositories_state.dart';
import 'package:app_interview/app/presentation/stores/repositories_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class GetUserRepositoriesUseCaseMock extends Mock
    implements GetUserRepositoriesUseCase {}

class RepositoryParamsMock extends Mock implements RepositoryParams {}

void main() {
  late GetUserRepositoriesUseCaseMock getUserRepositoriesUseCase;
  late RepositoriesStore controller;

  setUp(() {
    registerFallbackValue(RepositoryParamsMock());
    getUserRepositoriesUseCase = GetUserRepositoriesUseCaseMock();
    controller = RepositoriesStore(getUserRepositoriesUseCase);
  });

  group('init', () {
    final json = jsonDecode(fixture('users_repositories.json'));
    final tResponse = List<RepositoryEntity>.from(
        json.map((e) => RepositoryModel.fromJson(e)).toList());

    test('should return LoadedState if the return is a success', () async {
      when(() => getUserRepositoriesUseCase(any()))
          .thenAnswer((_) async => tResponse);

      await controller.init('octocat');

      expect(controller.state, isA<LoadedState>());
    });

    test('should return ErrorState if the return is a failure', () async {
      when(() => getUserRepositoriesUseCase(any())).thenThrow(Exception());

      await controller.init('octocat');

      expect(controller.state, isA<ErrorState>());
    });
  });
}
