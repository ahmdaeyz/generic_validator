import 'package:freezed_annotation/freezed_annotation.dart';
part 'validation_result.freezed.dart';

@freezed
class ValidationResult<U> with _$ValidationResult<U> {
  const factory ValidationResult.valid() = Valid<U>;
  factory ValidationResult.invalid({required List<U> reasons}) =
      Invalid<U>;
}
