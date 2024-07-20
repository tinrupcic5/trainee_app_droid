// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LogoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? error, bool fromSignIn) unauthenticated,
    required TResult Function() loading,
    required TResult Function(MessageBody messageBody) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(MessageBody messageBody)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult Function()? loading,
    TResult Function(MessageBody messageBody)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure? error, bool fromSignIn});

  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? fromSignIn = null,
  }) {
    return _then(_$UnauthenticatedImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      fromSignIn: null == fromSignIn
          ? _value.fromSignIn
          : fromSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl({this.error, required this.fromSignIn});

  @override
  final Failure? error;
  @override
  final bool fromSignIn;

  @override
  String toString() {
    return 'LogoutState.unauthenticated(error: $error, fromSignIn: $fromSignIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthenticatedImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.fromSignIn, fromSignIn) ||
                other.fromSignIn == fromSignIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, fromSignIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthenticatedImplCopyWith<_$UnauthenticatedImpl> get copyWith =>
      __$$UnauthenticatedImplCopyWithImpl<_$UnauthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? error, bool fromSignIn) unauthenticated,
    required TResult Function() loading,
    required TResult Function(MessageBody messageBody) logout,
  }) {
    return unauthenticated(error, fromSignIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(MessageBody messageBody)? logout,
  }) {
    return unauthenticated?.call(error, fromSignIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult Function()? loading,
    TResult Function(MessageBody messageBody)? logout,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(error, fromSignIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) logout,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? logout,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? logout,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements LogoutState {
  const factory _Unauthenticated(
      {final Failure? error,
      required final bool fromSignIn}) = _$UnauthenticatedImpl;

  Failure? get error;
  bool get fromSignIn;
  @JsonKey(ignore: true)
  _$$UnauthenticatedImplCopyWith<_$UnauthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LogoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? error, bool fromSignIn) unauthenticated,
    required TResult Function() loading,
    required TResult Function(MessageBody messageBody) logout,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(MessageBody messageBody)? logout,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult Function()? loading,
    TResult Function(MessageBody messageBody)? logout,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) logout,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? logout,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? logout,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LogoutState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MessageBody messageBody});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageBody = null,
  }) {
    return _then(_$AuthenticatedImpl(
      null == messageBody
          ? _value.messageBody
          : messageBody // ignore: cast_nullable_to_non_nullable
              as MessageBody,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl(this.messageBody);

  @override
  final MessageBody messageBody;

  @override
  String toString() {
    return 'LogoutState.logout(messageBody: $messageBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.messageBody, messageBody) ||
                other.messageBody == messageBody));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageBody);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? error, bool fromSignIn) unauthenticated,
    required TResult Function() loading,
    required TResult Function(MessageBody messageBody) logout,
  }) {
    return logout(messageBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(MessageBody messageBody)? logout,
  }) {
    return logout?.call(messageBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? error, bool fromSignIn)? unauthenticated,
    TResult Function()? loading,
    TResult Function(MessageBody messageBody)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(messageBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements LogoutState {
  const factory _Authenticated(final MessageBody messageBody) =
      _$AuthenticatedImpl;

  MessageBody get messageBody;
  @JsonKey(ignore: true)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
