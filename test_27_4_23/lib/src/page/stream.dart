// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   final Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 1), (int count) => count).take(10);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('StreamBuilder Example'),
//         ),
//         body: StreamBuilder<int>(
//           stream: numberStream,
//           builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text('Number ${snapshot.data[index]}'),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }