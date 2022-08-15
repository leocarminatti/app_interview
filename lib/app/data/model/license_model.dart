import 'package:app_interview/app/domain/entities/license_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_model.freezed.dart';
part 'license_model.g.dart';

@freezed
class LicenseModel extends LicenseEntity with _$LicenseModel {
  factory LicenseModel({
    required String key,
    required String name,
    @JsonKey(name: 'spdx_id') required String spdxId,
    String? url,
    @JsonKey(name: 'node_id') required String nodeId,
  }) = _LicenseModel;

  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);
}
