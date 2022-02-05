// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValidationResultTearOff {
  const _$ValidationResultTearOff();

  Valid<U> valid<U>() {
    return Valid<U>();
  }

  Invalid<U> invalid<U>({required List<U> reasons}) {
    return Invalid<U>(
      reasons: reasons,
    );
  }
}

/// @nodoc
const $ValidationResult = _$ValidationResultTearOff();

/// @nodoc
mixin _$ValidationResult<U> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() valid,
    required TResult Function(List<U> reasons) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(List<U> reasons)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(List<U> reasons)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Valid<U> value) valid,
    required TResult Function(Invalid<U> value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Valid<U> value)? valid,
    TResult Function(Invalid<U> value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Valid<U> value)? valid,
    TResult Function(Invalid<U> value)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationResultCopyWith<U, $Res> {
  factory $ValidationResultCopyWith(
          ValidationResult<U> value, $Res Function(ValidationResult<U>) then) =
      _$ValidationResultCopyWithImpl<U, $Res>;
}

/// @nodoc
class _$ValidationResultCopyWithImpl<U, $Res>
    implements $ValidationResultCopyWith<U, $Res> {
  _$ValidationResultCopyWithImpl(this._value, this._then);

  final ValidationResult<U> _value;
  // ignore: unused_field
  final $Res Function(ValidationResult<U>) _then;
}

/// @nodoc
abstract class $ValidCopyWith<U, $Res> {
  factory $ValidCopyWith(Valid<U> value, $Res Function(Valid<U>) then) =
      _$ValidCopyWithImpl<U, $Res>;
}

/// @nodoc
class _$ValidCopyWithImpl<U, $Res>
    extends _$ValidationResultCopyWithImpl<U, $Res>
    implements $ValidCopyWith<U, $Res> {
  _$ValidCopyWithImpl(Valid<U> _value, $Res Function(Valid<U>) _then)
      : super(_value, (v) => _then(v as Valid<U>));

  @override
  Valid<U> get _value => super._value as Valid<U>;
}

/// @nodoc

class _$Valid<U> implements Valid<U> {
  const _$Valid();

  @override
  String toString() {
    return 'ValidationResult<$U>.valid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Valid<U>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() valid,
    required TResult Function(List<U> reasons) invalid,
  }) {
    return valid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(List<U> reasons)? invalid,
  }) {
    return valid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(List<U> reasons)? invalid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Valid<U> value) valid,
    required TResult Function(Invalid<U> value) invalid,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Valid<U> value)? valid,
    TResult Function(Invalid<U> value)? invalid,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Valid<U> value)? valid,
    TResult Function(Invalid<U> value)? invalid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class Valid<U> implements ValidationResult<U> {
  const factory Valid() = _$Valid<U>;
}

/// @nodoc
abstract class $InvalidCopyWith<U, $Res> {
  factory $InvalidCopyWith(Invalid<U> value, $Res Function(Invalid<U>) then) =
      _$InvalidCopyWithImpl<U, $Res>;
  $Res call({List<U> reasons});
}

/// @nodoc
class _$InvalidCopyWithImpl<U, $Res>
    extends _$ValidationResultCopyWithImpl<U, $Res>
    implements $InvalidCopyWith<U, $Res> {
  _$InvalidCopyWithImpl(Invalid<U> _value, $Res Function(Invalid<U>) _then)
      : super(_value, (v) => _then(v as Invalid<U>));

  @override
  Invalid<U> get _value => super._value as Invalid<U>;

  @override
  $Res call({
    Object? reasons = freezed,
  }) {
    return _then(Invalid<U>(
      reasons: reasons == freezed
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<U>,
    ));
  }
}

/// @nodoc

class _$Invalid<U> implements Invalid<U> {
  _$Invalid({required this.reasons});

  @override
  final List<U> reasons;

  @override
  String toString() {
    return 'ValidationResult<$U>.invalid(reasons: $reasons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Invalid<U> &&
            const DeepCollectionEquality().equals(other.reasons, reasons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reasons));

  @JsonKey(ignore: true)
  @override
  $InvalidCopyWith<U, Invalid<U>> get copyWith =>
      _$InvalidCopyWithImpl<U, Invalid<U>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() valid,
    required TResult Function(List<U> reasons) invalid,
  }) {
    return invalid(reasons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(List<U> reasons)? invalid,
  }) {
    return invalid?.call(reasons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? valid,
    TResult Function(List<U> reasons)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(reasons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Valid<U> value) valid,
    required TResult Function(Invalid<U> value) invalid,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Valid<U> value)? valid,
    TResult Function(Invalid<U> value)? invalid,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Valid<U> value)? valid,
    TResult Function(Invalid<U> value)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class Invalid<U> implements ValidationResult<U> {
  factory Invalid({required List<U> reasons}) = _$Invalid<U>;

  List<U> get reasons;
  @JsonKey(ignore: true)
  $InvalidCopyWith<U, Invalid<U>> get copyWith =>
      throw _privateConstructorUsedError;
}
