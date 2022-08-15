// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RepositoriesStore on RepositoriesStoreBase, Store {
  late final _$stateAtom =
      Atom(name: 'RepositoriesStoreBase.state', context: context);

  @override
  RepositoriesState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(RepositoriesState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$RepositoriesStoreBaseActionController =
      ActionController(name: 'RepositoriesStoreBase', context: context);

  @override
  void setState(RepositoriesState value) {
    final _$actionInfo = _$RepositoriesStoreBaseActionController.startAction(
        name: 'RepositoriesStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$RepositoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
