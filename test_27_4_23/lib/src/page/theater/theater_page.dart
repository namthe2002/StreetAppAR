import 'package:MyApp/src/utils/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/R.dart';
import 'theater.dart';

class TheaterPage extends StatefulWidget {
  const TheaterPage({Key? key}) : super(key: key);

  @override
  _TheaterPageState createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  late TheaterCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = TheaterCubit();
    _cubit.initSeats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<TheaterCubit, TheaterState>(
          listener: (context, state) {
            if (state is TheaterUnInitial) {}
          },
          child: BlocBuilder<TheaterCubit, TheaterState>(
            builder: (context, state) {
              return _buildPage(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, TheaterState state) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 2.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 38.r,
                    child: Image.asset(R.drawable.joker),
                  ),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      R.string.joker.tr(),
                      style: Theme.of(context).textTheme.semi20Style,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          R.drawable.ic_calendar,
                          height: 17.h,
                          width: 17.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          R.string.date.tr(),
                          style: Theme.of(context).textTheme.bold11Style,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          R.drawable.ic_time,
                          height: 17.h,
                          width: 17.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          R.string.time.tr(),
                          style: Theme.of(context).textTheme.bold11Style,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: CustomPaint(
                painter: CurvePainter(),
                size: Size(double.infinity, 50.h),
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              height: 175.w,
              padding: EdgeInsets.all(3.w),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 12,
                mainAxisSpacing: 9.w,
                crossAxisSpacing: 9.w,
                children: _cubit.seats.map((seat) {
                  return InkWell(
                    onTap: () => seat.isOccupied
                        ? null
                        : _cubit.toggleSeatSelection(seat),
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: seat.isOccupied
                            ? R.color.pickedColor
                            : (_cubit.selectedSeats.contains(seat)
                                ? R.color.pickingColor
                                : R.color.backgroundColor),
                        borderRadius: BorderRadius.circular(5.r),
                        border:
                            Border.all(width: 3.w, color: R.color.pickedColor),
                      ),
                      child: _cubit.selectedSeats.contains(seat)
                          ? Image.asset(
                              R.drawable.ic_check,
                              fit: BoxFit.fill,
                            )
                          : const SizedBox(),
                    ),
                  );
                }).toList(),
              ),
            ),
            Divider(
              thickness: 2.h,
              color: R.color.gray,
            ),
            _buildOption(),
            SizedBox(
              height: 24.h,
            ),
            _cubit.selectedSeats.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      _buildSelectedSeatsList(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 15.w),
                        child: Text(
                          '${R.string.total.tr()} ${_cubit.count} \$',
                          style: Theme.of(context)
                              .textTheme
                              .bold20Style
                              .copyWith(color: R.color.blueColor),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: R.color.blueColor),
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: _cubit.submitSeats,
                            child: Text(R.string.comfirm_seats.tr(),
                                style: Theme.of(context).textTheme.semi16Style),
                          ),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildOption() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(R.string.selected.tr(),
                style: Theme.of(context).textTheme.semi14Style),
            SizedBox(
              width: 5.w,
            ),
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: R.color.pickingColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(width: 3.w, color: R.color.pickedColor),
              ),
              height: 18.h,
              width: 18.w,
              child: Image.asset(
                R.drawable.ic_check,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(R.string.reserved.tr(),
                style: Theme.of(context).textTheme.semi14Style),
            SizedBox(
              width: 5.w,
            ),
            Container(
              decoration: BoxDecoration(
                color: R.color.pickedColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(width: 3.w, color: R.color.pickedColor),
              ),
              height: 18.h,
              width: 18.w,
            ),
          ],
        ),
        Row(
          children: [
            Text(R.string.available.tr(),
                style: Theme.of(context).textTheme.semi14Style),
            SizedBox(
              width: 5.w,
            ),
            Container(
              decoration: BoxDecoration(
                color: R.color.backgroundColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(width: 3.w, color: R.color.pickedColor),
              ),
              height: 18.h,
              width: 18.w,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectedSeatsList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(R.string.your_selected.tr(),
              style: Theme.of(context).textTheme.semi14Style),
          SizedBox(height: 10.h),
          SizedBox(
            height: 145.h,
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _cubit.selectedSeats.length,
              itemBuilder: (BuildContext context, int index) {
                Seat seat = _cubit.selectedSeats[index];
                return Container(
                  decoration: BoxDecoration(
                    color: R.color.listtileTheme,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 3.h, 0, 3.h),
                  padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 13.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: R.color.pickingColor,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                    width: 3.w, color: R.color.pickedColor),
                              ),
                              padding: EdgeInsets.all(2.w),
                              height: 18.h,
                              width: 18.h,
                              child: Image.asset(
                                R.drawable.ic_check,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            // Text('fsffsf'),
                            Text(
                              '${R.string.row.tr()} ${String.fromCharCode(64 + seat.row)}, ${R.string.seat.tr()} ${seat.number}',
                              style: Theme.of(context).textTheme.semi14Style,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        R.string.price.tr(),
                        style: Theme.of(context).textTheme.semi14Style,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
