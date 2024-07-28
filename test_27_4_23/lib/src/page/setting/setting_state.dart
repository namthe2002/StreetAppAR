abstract class SettingState {
  const SettingState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {
  @override
  String toString() => 'SettingInitial';
}

class SettingUnInitial extends SettingState {
  @override
  String toString() => 'SettingUnInitial';
}

class SettingLoading extends SettingState {
  @override
  String toString() => 'SettingLoading';
}

class SettingSuccess extends SettingState {
  final String? message;

  const SettingSuccess({this.message});

  @override
  String toString() => 'SettingSuccess { message: $message }';
}

class SettingFailure extends SettingState {
  final String error;

  const SettingFailure(this.error);

  @override
  String toString() => 'SettingFailure { error: $error }';
}