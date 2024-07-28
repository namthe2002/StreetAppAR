// import 'package:MyApp/src/utils/custom_theme.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../res/R.dart';
// import 'setting.dart';
//
// class SettingPage extends StatefulWidget {
//   const SettingPage({Key? key}) : super(key: key);
//
//   @override
//   _SettingPageState createState() => _SettingPageState();
// }
//
// class _SettingPageState extends State<SettingPage> {
//   late SettingCubit _cubit;
//
//   @override
//   void initState() {
//     super.initState();
//     _cubit = SettingCubit();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => _cubit,
//         child: BlocListener<SettingCubit, SettingState>(
//           listener: (context, state) {},
//           child: BlocBuilder<SettingCubit, SettingState>(
//             builder: (context, state) {
//               return _buildPage(context, state);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPage(BuildContext context, SettingState state) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.fromLTRB(10.w, 80.h, 10.w, 15.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 15.w),
//               child: Text(
//                 R.string.label_setting.tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .inner700_32
//                     .copyWith(color: R.color.white),
//               ),
//             ),
//             SizedBox(height: 8.w),
//             Container(
//               decoration: BoxDecoration(
//                 color: R.color.gray,
//               ),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: SizedBox(
//                       height: 50.w,
//                       width: 50.w,
//                       child: CircleAvatar(
//                         child: ClipOval(
//                           child: Image.asset(
//                             R.drawable.img_car,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       R.string.label_chiaki.tr(),
//                       style: Theme.of(context)
//                           .textTheme
//                           .bold20Style
//                           .copyWith(color: R.color.white),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           R.string.label_des.tr(),
//                           style: TextStyle(
//                             color: R.color.white,
//                           ),
//                           // style: Theme.of(context).textTheme.bold23Style.copyWith(color: R.color.white),
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Divider(
//                           height: 1.h,
//                           color: Colors.grey,
//                           // indent: 40.w,
//                         ),
//                       ],
//                     ),
//                     trailing: Image.asset(
//                       R.drawable.img_qr_3,
//                       height: 30.w,
//                       width: 30.w,
//                     ),
//                   ),
//                   buildListTile(R.color.blue, R.drawable.ic_diagnose,
//                       R.string.label_avatar.tr()),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20.w,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: R.color.gray,
//               ),
//               child: Column(
//                 children: [
//                   buildListTile(R.color.yellow, R.drawable.ic_diagnose,
//                       R.string.label_started.tr()),
//                   Divider(
//                     thickness: 1.h,
//                     color: Colors.grey,
//                     indent: 50.w,
//                   ),
//                   buildListTile(R.color.green, R.drawable.ic_diagnose,
//                       R.string.label_link_devices.tr()),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20.w,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: R.color.gray,
//               ),
//               child: Column(
//                 children: [
//                   buildListTile(R.color.blue, R.drawable.ic_diagnose,
//                       R.string.label_accoung.tr()),
//                   Divider(
//                     thickness: 1.h,
//                     color: Colors.grey,
//                     indent: 50.w,
//                   ),
//                   buildListTile(R.color.buttonColor_1, R.drawable.ic_diagnose,
//                       R.string.label_privacy.tr()),
//                   Divider(
//                     thickness: 1.h,
//                     color: Colors.grey,
//                     indent: 50.w,
//                   ),
//                   buildListTile(R.color.green, R.drawable.ic_diagnose,
//                       R.string.label_chat.tr()),
//                   Divider(
//                     thickness: 1.h,
//                     color: Colors.grey,
//                     indent: 50.w,
//                   ),
//                   buildListTile(R.color.red, R.drawable.ic_diagnose,
//                       R.string.label_noti.tr()),
//                   Divider(
//                     thickness: 1.h,
//                     color: Colors.grey,
//                     indent: 50.w,
//                   ),
//                   buildListTile(R.color.green, R.drawable.ic_diagnose,
//                       R.string.label_storage.tr()),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: R.color.gray,
//               ),
//               child: Column(children: [
//                 buildListTile(R.color.blue, R.drawable.ic_diagnose,
//                     R.string.label_help.tr()),
//                 Divider(
//                   thickness: 1.h,
//                   color: Colors.grey,
//                   indent: 50.w,
//                 ),
//                 buildListTile(R.color.red, R.drawable.ic_diagnose,
//                     R.string.label_tell_friend.tr()),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildListTile(Color color, String image, String description) {
//     return Container(
//       decoration: BoxDecoration(
//         color: R.color.gray,
//       ),
//       padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 15.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Row(children: [
//                     Container(
//                       height: 24.h,
//                       alignment: Alignment.center,
//                       width: 24.h,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6.r),
//                         color: color,
//                       ),
//                       child: Image.asset(
//                         image,
//                         fit: BoxFit.cover,
//                         width: 13.w, // set the width of the image
//                         height: 13.w,
//                         color: R.color.white, // set the height of the image
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15.w,
//                     ),
//                     Text(
//                       description,
//                       style: Theme.of(context)
//                           .textTheme
//                           .body16Style
//                           .copyWith(color: R.color.white),
//                     ),
//                   ]),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Image.asset(
//                     R.drawable.ic_arrow_right,
//                     height: 10.w,
//                     width: 10.w,
//                     color: R.color.white,
//                   ),
//                 ),
//                 GestureDetector(onTap: () {},
//                   child: Image.asset(
//                     R.drawable.ic_arrow_right,
//                     height: 10.w,
//                     width: 10.w,
//                     color: R.color.white,
//                   ),
//                 )
//               ]
//           ),
//         ],
//       ),
//     );
//   }
// }
