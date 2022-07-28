// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddUser _$AddUserFromJson(Map<String, dynamic> json) {
  return _$DataAddUser.fromJson(json);
}

/// @nodoc
mixin _$AddUser {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddUserCopyWith<AddUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserCopyWith<$Res> {
  factory $AddUserCopyWith(AddUser value, $Res Function(AddUser) then) =
      _$AddUserCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$AddUserCopyWithImpl<$Res> implements $AddUserCopyWith<$Res> {
  _$AddUserCopyWithImpl(this._value, this._then);

  final AddUser _value;
  // ignore: unused_field
  final $Res Function(AddUser) _then;

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
abstract class _$$DataAddUserCopyWith<$Res> implements $AddUserCopyWith<$Res> {
  factory _$$DataAddUserCopyWith(
          _$DataAddUser value, $Res Function(_$DataAddUser) then) =
      __$$DataAddUserCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$$DataAddUserCopyWithImpl<$Res> extends _$AddUserCopyWithImpl<$Res>
    implements _$$DataAddUserCopyWith<$Res> {
  __$$DataAddUserCopyWithImpl(
      _$DataAddUser _value, $Res Function(_$DataAddUser) _then)
      : super(_value, (v) => _then(v as _$DataAddUser));

  @override
  _$DataAddUser get _value => super._value as _$DataAddUser;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$DataAddUser(
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
class _$_$DataAddUser implements _$DataAddUser {
  _$_$DataAddUser({required this.email, required this.password});

  factory _$_$DataAddUser.fromJson(Map<String, dynamic> json) =>
      _$$_$DataAddUserFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AddUser(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataAddUser &&
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
  _$$DataAddUserCopyWith<_$DataAddUser> get copyWith =>
      __$$DataAddUserCopyWithImpl<_$DataAddUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_$DataAddUserToJson(this);
  }
}

abstract class _$DataAddUser implements AddUser {
  factory _$DataAddUser(
      {required final String email,
      required final String password}) = _$_$DataAddUser;

  factory _$DataAddUser.fromJson(Map<String, dynamic> json) =
      _$_$DataAddUser.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DataAddUserCopyWith<_$DataAddUser> get copyWith =>
      throw _privateConstructorUsedError;
}
