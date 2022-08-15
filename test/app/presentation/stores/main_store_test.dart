import 'dart:convert';

import 'package:app_interview/app/data/model/user_model.dart';
import 'package:app_interview/app/domain/entities/user_entity.dart';
import 'package:app_interview/app/domain/usecases/get_random_users_use_case.dart';
import 'package:app_interview/app/domain/usecases/get_user_information_use_case.dart';
import 'package:app_interview/app/presentation/states/main_state.dart';
import 'package:app_interview/app/presentation/stores/main_store.dart';
import 'package:app_interview/core/usecases/use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class GetRandomUsersUseCaseMock extends Mock implements GetRandomUsersUseCase {}

class GetUserInformationUseCaseMock extends Mock
    implements GetUserInformationUseCase {}

class UserParamsMock extends Mock implements UserParams {}

void main() {
  late GetRandomUsersUseCaseMock getRandomUsersUseCase;
  late GetUserInformationUseCaseMock getUserInformationUseCase;
  late MainStore controller;

  setUp(() {
    registerFallbackValue(UserParamsMock());
    getRandomUsersUseCase = GetRandomUsersUseCaseMock();
    getUserInformationUseCase = GetUserInformationUseCaseMock();
    controller = MainStore(getRandomUsersUseCase, getUserInformationUseCase);
  });

  test('should change the value false to true', () {
    expect(controller.searchBox, false);

    controller.enableSearchBox(true);
    expect(controller.searchBox, true);
  });

  group('loadRandomUsers', () {
    final json = jsonDecode(fixture('users.json'));
    final tResponse =
        List<UserEntity>.from(json.map((e) => UserModel.fromJson(e)).toList());

    test('should return LoadedUserListState if the return is a success',
        () async {
      when(() => getRandomUsersUseCase(const NoParams()))
          .thenAnswer((_) async => tResponse);

      await controller.loadRandomUsers();

      expect(controller.state, isA<LoadedUserListState>());
    });

    test('should return ErrorState if the return is a failure', () async {
      when(() => getRandomUsersUseCase(const NoParams()))
          .thenThrow(Exception());

      await controller.loadRandomUsers();

      expect(controller.state, isA<ErrorState>());
    });
  });

  group('searchUserInformation', () {
    final tResponse = UserModel.fromJson(jsonDecode(fixture('user.json')));

    test('should return LoadedUserState if the return is a success', () async {
      when(() => getUserInformationUseCase(any()))
          .thenAnswer((_) async => tResponse);

      await controller.searchUserInformation('octocat');

      expect(controller.state, isA<LoadedUserState>());
    });

    test('should return ErrorState if the return is a failure', () async {
      when(() => getUserInformationUseCase(any())).thenThrow(Exception());

      await controller.searchUserInformation('octocat');

      expect(controller.state, isA<ErrorState>());
    });
  });
}
