abstract class DoulingoState {
  const DoulingoState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class DoulingoInitial extends DoulingoState {
  @override
  String toString() => 'DoulingoInitial';
}

class DoulingoUnInitial extends DoulingoState {
  @override
  String toString() => 'DoulingoUnInitial';
}

class DoulingoLoading extends DoulingoState {
  @override
  String toString() => 'DoulingoLoading';
}

class DoulingoSuccess extends DoulingoState {
  final String? message;

  const DoulingoSuccess({this.message});

  @override
  String toString() => 'DoulingoSuccess { message: $message }';
}

class DoulingoFailure extends DoulingoState {
  final String error;

  const DoulingoFailure(this.error);

  @override
  String toString() => 'DoulingoFailure { error: $error }';
}