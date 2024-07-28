// import 'package:MyApp/src/utils/custom_theme.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../res/R.dart';
// import '../info/info.dart';
// import 'login.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   late LoginCubit _cubit;
//
//   @override
//   void initState() {
//     super.initState();
//     _cubit = LoginCubit();
//   }
//
//   final TextEditingController _passController = TextEditingController();
//   // @override
//   // void _toggle() {
//   //   setState(() {
//   //     _obscureText = !_obscureText;
//   //   });
//   // }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => _cubit,
//         child: BlocListener<LoginCubit, LoginState>(
//           listener: (context, state) {
//             if (state is LoginSuccess) {
//               N  avigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage(phoneNumber: _nameController.text.trim(), passWord: _passController.text)));
//             }
//             if (state is LoginFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
//             }
//           },
//           child: BlocBuilder<LoginCubit, LoginState>(
//             builder: (context, state) {
//               return _buildPage(context, state);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPage(BuildContext context, LoginState state) {
//     ScreenUtil.init(context);
//     return Stack(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Image.asset(
//               R.drawable.car,
//               height: 312.h,
//             ),
//           ),
//         ),
//         Container(
//             margin: EdgeInsets.only(top: 198.h),
//             padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 14.w),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(width: 0, color: Colors.white),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(24.r),
//                 topRight: Radius.circular(24.r),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(R.string.login.tr(),
//
//                       style: Theme.of(context).textTheme.inner700_32),
//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   Text(R.string.phone,
//                       style: Theme.of(context).textTheme.inner600_14),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.text,
//                     controller: _nameController,
//                     style: TextStyle(color: Colors.black87),
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(8.h))),
//                       labelText: R.string.phone,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   Text(R.string.password,
//                       style: Theme.of(context).textTheme.inner600_14),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.text,
//                     controller: _passController,
//                     obscureText: true,
//                     style: TextStyle(color: Colors.blueGrey),
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//                         ),
//                         labelText: R.string.password,
//                         suffixIcon: IconButton(
//                           icon: const Icon(
//                             Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             // _toggle();
//                           },
//                         )),
//                     onSubmitted: (_) => _cubit.submitData(name: _nameController.text.trim(), password: _passController.text.trim()),
//                   ),
//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   Text(R.string.forgotpass,
//                       style: Theme.of(context)
//                           .textTheme
//                           .inner600_14
//                           .copyWith(color: Colors.blue)),
//                   SizedBox(height: 32.h),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(8.r)),
//                       color: R.color.blue,
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                        _cubit.submitData(name: _nameController.text.trim(), password: _passController.text.trim());
//                       },
//                       style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 20),
//                           textStyle: const TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.bold)),
//                       child: Text(
//                         R.string.login,
//                         style: Theme.of(context).textTheme.inner600_14,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 224.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         R.string.register,
//                         style: Theme.of(context).textTheme.raleway500_16,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // _cubit.submitData(name: _nameController.text.trim(), password: _passController.text.trim());
//                         },
//                         child: Text(
//                           R.string.signin,
//                           style: Theme.of(context)
//                               .textTheme
//                               .raleway500_16
//                               .copyWith(color: Colors.blue),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )),
//       ],
//     );
//   }
// }
