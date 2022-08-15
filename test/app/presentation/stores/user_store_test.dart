import 'dart:convert';

import 'package:app_interview/app/data/model/user_model.dart';
import 'package:app_interview/app/domain/usecases/get_user_information_use_case.dart';
import 'package:app_interview/app/presentation/states/user_state.dart';
import 'package:app_interview/app/presentation/stores/user_store.dart';
import 'package:app_interview/core/services/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class GetUserInformationUseCaseMock extends Mock
    implements GetUserInformationUseCase {}

class UserParamsMock extends Mock implements UserParams {}

class ContactsServiceMock extends Mock implements ContactsService {}

void main() {
  late GetUserInformationUseCaseMock getUserInformationUseCase;
  late UserStore controller;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const MethodChannel('github.com/QuisApp/flutter_contacts')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'select') {
        return [
          {'displayName': 'ella fitzgerald'},
          {'displayName': 'ezra koenig'},
          {'displayName': 'Elon Musk'},
          {'displayName': 'Édouart Manet'},
        ];
      }
    });
    await ContactsService.init();
    registerFallbackValue(UserParamsMock());
    getUserInformationUseCase = GetUserInformationUseCaseMock();
    controller = UserStore(getUserInformationUseCase);
  });

  group('init', () {
    final tResponse = UserModel.fromJson(jsonDecode(fixture('user.json')));

    test('should return LoadedState if the return is a success', () async {
      when(() => getUserInformationUseCase(any()))
          .thenAnswer((_) async => tResponse);

      await controller.init('octocat');

      expect(controller.state, isA<LoadedState>());
    });

    test('should return ErrorState if the return is a failure', () async {
      when(() => getUserInformationUseCase(any())).thenThrow(Exception());

      await controller.init('octocat');

      expect(controller.state, isA<ErrorState>());
    });
  });
}
