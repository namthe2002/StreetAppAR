import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../res/R.dart';
import '../service.dart';




class ServiceCubit extends Cubit<ServiceState> {
  List<ServiceName> service = [
    ServiceName(R.string.account.tr(), false),
    ServiceName(R.string.bsx.tr(), false),
    ServiceName(R.string.label_asterisk.tr(), false),
    ServiceName(R.string.condition.tr(), false),
  ];
  List<String> selectedServices = [];
  List<ServiceName> showServices = [];
  int index = 0;
  ServiceCubit() : super(ServiceInitial()) {
    // TODO
  }

  void searchService(value) {
    showServices = service
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  void selectService(String name, var index) {
    service[index].isSelected = !service[index].isSelected;
    if (service[index].isSelected == true) {
      selectedServices.add(name);
    } else if (service[index].isSelected == false) {
      selectedServices
          .removeWhere((element) => element == service[index].name);
    }
  }

  // Future<List<String>>>
  //
  //
  // Future<List<String>?>> getData(List<String> a) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   a = prefs.getStringList('items') as List<String>;
  // }

    void setSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', selectedServices);
    List<String> choose = prefs.getStringList('items')!.toList();
    for (int i = 0; i < choose.length;i++) {
      for(int j = 0; j < service.length;j++) {
        if (service[j].name == choose[i]) {
          service[j].isSelected == true;
        }
      }
    }
  }
  void setSelected_2(List<String> s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', s);
  }
}

class ServiceName{
  String name;
  bool isSelected;
  ServiceName(this.name, this.isSelected);
}
