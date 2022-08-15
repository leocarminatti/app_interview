// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'license_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LicenseModel _$LicenseModelFromJson(Map<String, dynamic> json) {
  return _LicenseModel.fromJson(json);
}

/// @nodoc
mixin _$LicenseModel {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'spdx_id')
  String get spdxId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicenseModelCopyWith<LicenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseModelCopyWith<$Res> {
  factory $LicenseModelCopyWith(
          LicenseModel value, $Res Function(LicenseModel) then) =
      _$LicenseModelCopyWithImpl<$Res>;
  $Res call(
      {String key,
      String name,
      @JsonKey(name: 'spdx_id') String spdxId,
      String? url,
      @JsonKey(name: 'node_id') String nodeId});
}

/// @nodoc
class _$LicenseModelCopyWithImpl<$Res> implements $LicenseModelCopyWith<$Res> {
  _$LicenseModelCopyWithImpl(this._value, this._then);

  final LicenseModel _value;
  // ignore: unused_field
  final $Res Function(LicenseModel) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? spdxId = freezed,
    Object? url = freezed,
    Object? nodeId = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spdxId: spdxId == freezed
          ? _value.spdxId
          : spdxId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeId: nodeId == freezed
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LicenseModelCopyWith<$Res>
    implements $LicenseModelCopyWith<$Res> {
  factory _$$_LicenseModelCopyWith(
          _$_LicenseModel value, $Res Function(_$_LicenseModel) then) =
      __$$_LicenseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String key,
      String name,
      @JsonKey(name: 'spdx_id') String spdxId,
      String? url,
      @JsonKey(name: 'node_id') String nodeId});
}

/// @nodoc
class __$$_LicenseModelCopyWithImpl<$Res>
    extends _$LicenseModelCopyWithImpl<$Res>
    implements _$$_LicenseModelCopyWith<$Res> {
  __$$_LicenseModelCopyWithImpl(
      _$_LicenseModel _value, $Res Function(_$_LicenseModel) _then)
      : super(_value, (v) => _then(v as _$_LicenseModel));

  @override
  _$_LicenseModel get _value => super._value as _$_LicenseModel;

  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? spdxId = freezed,
    Object? url = freezed,
    Object? nodeId = freezed,
  }) {
    return _then(_$_LicenseModel(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spdxId: spdxId == freezed
          ? _value.spdxId
          : spdxId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeId: nodeId == freezed
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LicenseModel implements _LicenseModel {
  _$_LicenseModel(
      {required this.key,
      required this.name,
      @JsonKey(name: 'spdx_id') required this.spdxId,
      this.url,
      @JsonKey(name: 'node_id') required this.nodeId});

  factory _$_LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$$_LicenseModelFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  @JsonKey(name: 'spdx_id')
  final String spdxId;
  @override
  final String? url;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;

  @override
  String toString() {
    return 'LicenseModel(key: $key, name: $name, spdxId: $spdxId, url: $url, nodeId: $nodeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LicenseModel &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.spdxId, spdxId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.nodeId, nodeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(spdxId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(nodeId));

  @JsonKey(ignore: true)
  @override
  _$$_LicenseModelCopyWith<_$_LicenseModel> get copyWith =>
      __$$_LicenseModelCopyWithImpl<_$_LicenseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LicenseModelToJson(
      this,
    );
  }
}

abstract class _LicenseModel implements LicenseModel {
  factory _LicenseModel(
          {required final String key,
          required final String name,
          @JsonKey(name: 'spdx_id') required final String spdxId,
          final String? url,
          @JsonKey(name: 'node_id') required final String nodeId}) =
      _$_LicenseModel;

  factory _LicenseModel.fromJson(Map<String, dynamic> json) =
      _$_LicenseModel.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  @JsonKey(name: 'spdx_id')
  String get spdxId;
  @override
  String? get url;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(ignore: true)
  _$$_LicenseModelCopyWith<_$_LicenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
