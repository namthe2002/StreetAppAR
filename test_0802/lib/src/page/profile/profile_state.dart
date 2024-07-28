abstract class ProfileState {
  const ProfileState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  @override
  String toString() => 'ProfileInitial';
}

class ProfileUnInitial extends ProfileState {
  @override
  String toString() => 'ProfileUnInitial';
}

class ProfileLoading extends ProfileState {
  @override
  String toString() => 'ProfileLoading';
}

class ProfileSuccess extends ProfileState {
  final String? message;

  const ProfileSuccess({this.message});

  @override
  String toString() => 'ProfileSuccess { message: $message }';
}

class ProfileFailure extends ProfileState {
  final String error;

  const ProfileFailure(this.error);

  @override
  String toString() => 'ProfileFailure { error: $error }';
}