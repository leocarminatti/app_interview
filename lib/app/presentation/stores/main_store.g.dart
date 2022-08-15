// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on MainStoreBase, Store {
  late final _$stateAtom = Atom(name: 'MainStoreBase.state', context: context);

  @override
  MainState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(MainState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$searchBoxAtom =
      Atom(name: 'MainStoreBase.searchBox', context: context);

  @override
  bool get searchBox {
    _$searchBoxAtom.reportRead();
    return super.searchBox;
  }

  @override
  set searchBox(bool value) {
    _$searchBoxAtom.reportWrite(value, super.searchBox, () {
      super.searchBox = value;
    });
  }

  late final _$MainStoreBaseActionController =
      ActionController(name: 'MainStoreBase', context: context);

  @override
  void setState(MainState value) {
    final _$actionInfo = _$MainStoreBaseActionController.startAction(
        name: 'MainStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enableSearchBox(bool value) {
    final _$actionInfo = _$MainStoreBaseActionController.startAction(
        name: 'MainStoreBase.enableSearchBox');
    try {
      return super.enableSearchBox(value);
    } finally {
      _$MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
searchBox: ${searchBox}
    ''';
  }
}
