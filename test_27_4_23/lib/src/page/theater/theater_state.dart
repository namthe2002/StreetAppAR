abstract class TheaterState {
  const TheaterState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class TheaterInitial extends TheaterState {
  @override
  String toString() => 'TheaterInitial';
}

class TheaterUnInitial extends TheaterState {
  @override
  String toString() => 'TheaterUnInitial';
}


class TheaterLoading extends TheaterState {
  @override
  String toString() => 'TheaterLoading';
}

class TheaterSuccess extends TheaterState {
  final String? message;

  const TheaterSuccess({this.message});

  @override
  String toString() => 'TheaterSuccess { message: $message }';
}

class TheaterFailure extends TheaterState {
  final String error;

  const TheaterFailure(this.error);

  @override
  String toString() => 'TheaterFailure { error: $error }';
}