abstract class InfoState {
  const InfoState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {
  @override
  String toString() => 'InfoInitial';
}

class InfoUnInitial extends InfoState {
  @override
  String toString() => 'InfoUnInitial';
}

class InfoLoading extends InfoState {
  @override
  String toString() => 'InfoLoading';
}

class InfoSuccess extends InfoState {
  final String? message;

  const InfoSuccess({this.message});

  @override
  String toString() => 'InfoSuccess { message: $message }';
}

class InfoFailure extends InfoState {
  final String error;

  const InfoFailure(this.error);

  @override
  String toString() => 'InfoFailure { error: $error }';
}