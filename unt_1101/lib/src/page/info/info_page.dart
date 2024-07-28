//
// import 'package:MyApp/src/utils/custom_theme.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../res/R.dart';
// import 'info.dart';
//
// class InfoPage extends StatefulWidget {
//   final String phoneNumber;
//   final String passWord;
//   const InfoPage(
//       {Key? key,
//       required String this.phoneNumber,
//       required String this.passWord})
//       : super(key: key);
//
//   @override
//   _InfoPageState createState() =>
//       _InfoPageState(phoneNumber: phoneNumber, passWord: passWord);
// }
//
// class _InfoPageState extends State<InfoPage> {
//   late final String phoneNumber;
//   late final String passWord;
//   late InfoCubit _cubit;
//   @override
//   void initState() {
//     super.initState();
//     _cubit = InfoCubit();
//   }
//
//   _InfoPageState({
//     required this.phoneNumber,
//     required this.passWord,
//   });
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => _cubit,
//         child: BlocListener<InfoCubit, InfoState>(
//           listener: (context, state) {},
//           child: BlocBuilder<InfoCubit, InfoState>(
//             builder: (context, state) {
//               return _buildPage(context, state);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPage(BuildContext context, InfoState state) {
//     ScreenUtil.init(context);
//     return SingleChildScrollView(
//       child: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: Image.asset(
//                 R.drawable.car,
//                 height: 312.h,
//               ),
//             ),
//           ),
//           Container(
//               margin: EdgeInsets.only(top: 198.h),
//               padding: EdgeInsets.fromLTRB(20.h, 24.h, 20.h, 14.h),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(width: 0, color: Colors.white),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24.r),
//                   topRight: Radius.circular(24.r),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(R.string.info,
//                       style: Theme.of(context).textTheme.inner700_32),
//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   Text(R.string.phone,
//                       style: Theme.of(context).textTheme.inner600_14),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   Text(phoneNumber),
//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   Text(R.string.password,
//                       style: Theme.of(context).textTheme.inner600_14),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   Text(passWord),
//                   SizedBox(
//                     height: 100.h,
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
