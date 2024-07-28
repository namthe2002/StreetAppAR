import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'repair.dart';

class RepairPage extends StatefulWidget {
  const RepairPage({Key? key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  late RepairCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = RepairCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<RepairCubit, RepairState>(
          listener: (context, state) {},
          child: BlocBuilder<RepairCubit, RepairState>(
            builder: (context, state) {
              return _buildPage(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, RepairState state) {
    return Container(
      padding : EdgeInsets.all(5.w),
      child: GridView.count(
        crossAxisCount: 6, // Số cột cho hàng đầu tiên
        children: List.generate(36, (index) {
          if (index < 6) { // Hàng đầu tiên có 6 ô vuông
            return Container(
              color: Colors.blue,
              height: 50,
              width: 50,
            );
          } else if (index < 14) { // Hàng thứ hai và ba có 8 ô vuông
            return Container(
              color: Colors.green,
              height: 50,
              width: 50,
            );
          } else if (index < 28) { // Hàng thứ tư và năm có 7 ô vuông
            return Container(
              color: Colors.yellow,
              height: 50,
              width: 50,
            );
          } else {
            return Container(); // Trả về Container trống cho các ô vuông không hiển thị
          }
        }),
      ),
    );
  }
}