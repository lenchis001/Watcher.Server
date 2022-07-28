// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return _$DataSignIn.fromJson(json);
}

/// @nodoc
mixin _$SignIn {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInCopyWith<SignIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInCopyWith<$Res> {
  factory $SignInCopyWith(SignIn value, $Res Function(SignIn) then) =
      _$SignInCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInCopyWithImpl<$Res> implements $SignInCopyWith<$Res> {
  _$SignInCopyWithImpl(this._value, this._then);

  final SignIn _value;
  // ignore: unused_field
  final $Res Function(SignIn) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$DataSignInCopyWith<$Res> implements $SignInCopyWith<$Res> {
  factory _$$DataSignInCopyWith(
          _$DataSignIn value, $Res Function(_$DataSignIn) then) =
      __$$DataSignInCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$$DataSignInCopyWithImpl<$Res> extends _$SignInCopyWithImpl<$Res>
    implements _$$DataSignInCopyWith<$Res> {
  __$$DataSignInCopyWithImpl(
      _$DataSignIn _value, $Res Function(_$DataSignIn) _then)
      : super(_value, (v) => _then(v as _$DataSignIn));

  @override
  _$DataSignIn get _value => super._value as _$DataSignIn;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$DataSignIn(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_$DataSignIn implements _$DataSignIn {
  _$_$DataSignIn({required this.email, required this.password});

  factory _$_$DataSignIn.fromJson(Map<String, dynamic> json) =>
      _$$_$DataSignInFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignIn(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSignIn &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$DataSignInCopyWith<_$DataSignIn> get copyWith =>
      __$$DataSignInCopyWithImpl<_$DataSignIn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_$DataSignInToJson(this);
  }
}

abstract class _$DataSignIn implements SignIn {
  factory _$DataSignIn(
      {required final String email,
      required final String password}) = _$_$DataSignIn;

  factory _$DataSignIn.fromJson(Map<String, dynamic> json) =
      _$_$DataSignIn.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DataSignInCopyWith<_$DataSignIn> get copyWith =>
      throw _privateConstructorUsedError;
}
