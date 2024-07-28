import 'package:MyApp/src/utils/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/R.dart';
import 'doulingo.dart';

class DoulingoPage extends StatefulWidget {
  const DoulingoPage({Key? key}) : super(key: key);

  @override
  _DoulingoPageState createState() => _DoulingoPageState();
}

class _DoulingoPageState extends State<DoulingoPage> {
  late DoulingoCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = DoulingoCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<DoulingoCubit, DoulingoState>(
          listener: (context, state) {},
          child: BlocBuilder<DoulingoCubit, DoulingoState>(
            builder: (context, state) {
              return _buildPage(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, DoulingoState state) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          R.string.label_duolingo.tr(),
          style: Theme.of(context).textTheme.bold20Style,
        ),
        backgroundColor: R.color.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      R.drawable.png_close,
                      fit: BoxFit.fill,
                      height: 22.h,
                      width: 22.w,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(right: 250.h),
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: R.color.outlineColor,
                        border: Border.all(width: 1.r),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: R.color.green,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    )),
                  ]),
              SizedBox(
                height: 15.w,
              ),
              Text(
                R.string.label_content.tr(),
                style: Theme.of(context).textTheme.bold23Style,
              ),
              SizedBox(
                height: 120.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _cubit.questions.length,
                  itemBuilder: (context, inx) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 52.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        padding: EdgeInsets.only(
                            top: 2.h, left: 2.w, right: 2.w, bottom: 6.w),
                        decoration: BoxDecoration(
                          color: R.color.outlineColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: R.color.backgroundColor,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Center(
                            child: Text(
                              _cubit.questions[inx],
                              style: Theme.of(context).textTheme.bold23Style,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 80.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: R.color.outlineColor,
                    border: Border.all(width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text(
                      R.string.label_continuous.tr(),
                      style: Theme.of(context).textTheme.bold20Style,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
