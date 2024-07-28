// import 'dart:convert';
// import 'dart:io';
//
// import 'dart:math';
// import 'package:http/http.dart' as http;
//
// class Api {
//   List<Car> _vehicles = [];
//
//   Future<List> _fetchVehicles() async {
//     final response = await http.get(Uri.parse(
//         'https://public.opendatasoft.com/api/records/1.0/search/?dataset=all-vehicles-model&q=&facet=make&facet=model&facet=cylinders&facet=drive&facet=eng_dscr&facet=fueltype&facet=fueltype1&facet=mpgdata&facet=phevblended&facet=trany&facet=vclass&facet=year'));
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       _vehicles = data['records'];
//     }
//     return _vehicles;
//   }
// //static Future<User?> getWallet() async {}
//
// }
//
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
//
// class Video {
//   final String id;
//   final int duration;
//   final String thumbnail;
//   final VideoFile files;
//
//   Video({
//     required this.id,
//     required this.duration,
//     required this.thumbnail,
//     required this.files,
//   });
//
//   factory Video.fromJson(Map<String, dynamic> json) {
//     return Video(
//       id: json['id'].toString(),
//       duration: json['duration'],
//       thumbnail: json['image'],
//       files: VideoFile.fromJson(json['video_files'][2]),
//     );
//   }
// }
//
// class VideoFile {
//   final String filetype;
//   final String link;
//
//   VideoFile({
//     required this.filetype,
//     required this.link,
//   });
//
//   factory VideoFile.fromJson(Map<String, dynamic> json) {
//     print(json['link']);
//     print(json['filetype']);
//     return VideoFile(
//       filetype: json['file_type'],
//       link: json['link'],
//     );
//   }
// }
//
// class VideosList {
//   final List<Video> videos;
//
//   VideosList({
//     required this.videos,
//   });
//
//   factory VideosList.fromJson(List<dynamic> jsonList) {
//     return VideosList(
//       videos: jsonList.map((video) => Video.fromJson(video)).toList(),
//     );
//   }
// }
//
// class ErrorModel {
//   final int code;
//   final String message;
//
//   ErrorModel({
//     required this.code,
//     required this.message,
//   });
// }
