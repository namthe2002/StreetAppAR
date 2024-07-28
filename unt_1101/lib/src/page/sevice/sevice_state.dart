abstract class SeviceState {
  const SeviceState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class SeviceInitial extends SeviceState {
  @override
  String toString() => 'SeviceInitial';
}

class SeviceUnInitial extends SeviceState {
  @override
  String toString() => 'SeviceUnInitial';
}

class SeviceLoading extends SeviceState {
  @override
  String toString() => 'SeviceLoading';
}

class SeviceSuccess extends SeviceState {
  final String? message;

  const SeviceSuccess({this.message});

  @override
  String toString() => 'SeviceSuccess { message: $message }';
}

class SeviceFailure extends SeviceState {
  final String error;

  const SeviceFailure(this.error);

  @override
  String toString() => 'SeviceFailure { error: $error }';
}