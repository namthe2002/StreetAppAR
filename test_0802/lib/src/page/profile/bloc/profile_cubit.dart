import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    // TODO
  }
  List _cars = [];
  Future<List> fetchVehicles() async {
    final response = await http.get(Uri.parse(
        'https://public.opendatasoft.com/api/records/1.0/search/?dataset=all-vehicles-model&q=&facet=make&facet=model&facet=cylinders&facet=drive&facet=eng_dscr&facet=fueltype&facet=fueltype1&facet=mpgdata&facet=phevblended&facet=trany&facet=vclass&facet=year'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _cars = data['records'];
    }
    return _cars;
  }
  String url_image = 'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?auto=compress&cs=tinysrgb&w=1600';
  // Future<String> convertDate() async {
  //   DateTime parsedDate = DateTime.parse(inputDate);
  //   var formatter = DateFormat('EEE, MMM d, ''yy');
  //   String formattedDate = formatter.format(parsedDate);
}
// class Car {
//   final String model;
//   final String createdOn;
//   final String displ;
//
//   Car({required this.model, required this.createdOn, required this.displ});
//
//   factory Car.fromMap(Map<String, dynamic> map) {
//     return Car(
//       model: map['fields']['license'],
//       createdOn: map['fields']['createdon'],
//       displ: map['fields']['displ'],
//     );
//   }
// }