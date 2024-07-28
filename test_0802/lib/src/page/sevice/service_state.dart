abstract class ServiceState {
  const ServiceState([List props = const []]) : super();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {
  @override
  String toString() => 'SeviceInitial';
}

class ServiceUnInitial extends ServiceState {
  @override
  String toString() => 'SeviceUnInitial';
}

class ServiceLoading extends ServiceState {
  @override
  String toString() => 'SeviceLoading';
}

class ServiceSuccess extends ServiceState {
  final String? message;

  const ServiceSuccess({this.message});

  @override
  String toString() => 'ServiceSuccess { message: $message }';
}

class ServiceFailure extends ServiceState {
  final String error;

  const ServiceFailure(this.error);

  @override
  String toString() => 'ServiceFailure { error: $error }';
}