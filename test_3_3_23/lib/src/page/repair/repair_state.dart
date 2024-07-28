abstract class RepairState {
  const RepairState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class RepairInitial extends RepairState {
  @override
  String toString() => 'RepairInitial';
}

class RepairUnInitial extends RepairState {
  @override
  String toString() => 'RepairUnInitial';
}

class RepairLoading extends RepairState {
  @override
  String toString() => 'RepairLoading';
}

class RepairSuccess extends RepairState {
  final String? message;

  const RepairSuccess({this.message});

  @override
  String toString() => 'RepairSuccess { message: $message }';
}

class RepairFailure extends RepairState {
  final String error;

  const RepairFailure(this.error);

  @override
  String toString() => 'RepairFailure { error: $error }';
}