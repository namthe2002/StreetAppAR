import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../res/R.dart';
import '../doulingo.dart';


class DoulingoCubit extends Cubit<DoulingoState> {
  DoulingoCubit() : super(DoulingoInitial()) {
    // TODO
  }
   List questions = [
    R.string.label_rice.tr(),
     R.string.label_noodles.tr(),
     R.string.label_hot.tr(),
  ];
}