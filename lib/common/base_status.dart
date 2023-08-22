import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_status.freezed.dart';

@freezed
class BaseStatus with _$BaseStatus {
  const BaseStatus._();
  const factory BaseStatus.initial() = _Initial;
  const factory BaseStatus.loading() = _Loading;
  const factory BaseStatus.failed(Exception exception) = _Failed;
  const factory BaseStatus.success() = _Success;

  bool get isLoading => this == const BaseStatus.loading();
  bool get isInitial => this == const BaseStatus.initial();
  bool get isFailed => this == BaseStatus.failed(Exception("Error"));
  bool get isSuccess => this == const BaseStatus.success();
}
