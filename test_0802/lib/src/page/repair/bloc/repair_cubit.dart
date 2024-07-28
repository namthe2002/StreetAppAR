import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repair.dart';

class RepairCubit extends Cubit<RepairState> {
  RepairCubit() : super(RepairInitial()) {
    // TODO
  }
  List<String> list = [];
  void saveInfo(String? s,String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, s ?? '');
  }
  void getInfo(String? name, String ? text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    text == prefs.getString(name!);
  }
}