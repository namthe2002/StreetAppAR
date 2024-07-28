abstract class ChiakiState {
  const ChiakiState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class ChiakiInitial extends ChiakiState {
  @override
  String toString() => 'ChiakiInitial';
}

class ChiakiUnInitial extends ChiakiState {
  @override
  String toString() => 'ChiakiUnInitial';
}

class ChiakiLoading extends ChiakiState {
  @override
  String toString() => 'ChiakiLoading';
}

class ChiakiSuccess extends ChiakiState {
  final String? message;

  const ChiakiSuccess({this.message});

  @override
  String toString() => 'ChiakiSuccess { message: $message }';
}

class ChiakiFailure extends ChiakiState {
  final String error;

  const ChiakiFailure(this.error);

  @override
  String toString() => 'ChiakiFailure { error: $error }';
}