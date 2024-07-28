abstract class LoginState {
  const LoginState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginUnInitial extends LoginState {
  @override
  String toString() => 'LoginUnInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginSuccess extends LoginState {
  final String? message;

  const LoginSuccess({this.message});

  @override
  String toString() => 'LoginSuccess { message: $message }';
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  String toString() => 'LoginFailure { error: $error }';
}