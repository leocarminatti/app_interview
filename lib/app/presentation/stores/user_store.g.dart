// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$stateAtom = Atom(name: 'UserStoreBase.state', context: context);

  @override
  UserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$isMyContactAtom =
      Atom(name: 'UserStoreBase.isMyContact', context: context);

  @override
  bool get isMyContact {
    _$isMyContactAtom.reportRead();
    return super.isMyContact;
  }

  @override
  set isMyContact(bool value) {
    _$isMyContactAtom.reportWrite(value, super.isMyContact, () {
      super.isMyContact = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void setState(UserState value) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isMyContact: ${isMyContact}
    ''';
  }
}
