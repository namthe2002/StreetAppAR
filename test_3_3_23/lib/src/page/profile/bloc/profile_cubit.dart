import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    // TODO
  }
}