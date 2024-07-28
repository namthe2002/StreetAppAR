import 'package:MyApp/res/R.dart';
import 'package:MyApp/src/page/sevice/service_page.dart';
import 'package:MyApp/src/utils/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sevice/bloc/service_cubit.dart';
import 'repair.dart';

class RepairPage extends StatefulWidget {
  const RepairPage({Key? key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  late ServiceCubit _serviceCubit;
  late RepairCubit _cubit;
  late TextEditingController _condition = TextEditingController();
  late final  TextEditingController _km = TextEditingController();
  @override
  void initState() {
    super.initState();
    _serviceCubit = ServiceCubit();
    _cubit = RepairCubit();
    _cubit.getInfo(R.string.condition, _condition.text);
    _cubit.getInfo(R.string.km, _km.text);
    print(_condition.text);
    print(_km.text);
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
    return Scaffold(
      appBar: mainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: R.color.white),
          padding: EdgeInsets.fromLTRB(13.w, 23.h, 27.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      R.string.services.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .normal14Style_1
                          .copyWith(color: R.color.gray),
                    ),
                  ),
                  Text(
                    R.string.rs_diagnose.tr(),
                    style: Theme.of(context).textTheme.normal14Style_2,
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  Image.asset(
                    R.drawable.ic_diagnose,
                    width: 18.w,
                    height: 20.h,
                  ),
                ],
              ),
              SizedBox(
                height: 23.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    R.drawable.img_car,
                    width: 44.w,
                    height: 44.h,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    R.string.bsx.tr(),
                    style: Theme.of(context).textTheme.body16Style,
                  )
                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              conditionField(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                R.string.label_total_km.tr(),
                style: Theme.of(context).textTheme.normal14Style_1,
              ),
              SizedBox(
                height: 4.h,
              ),
              editKmField(),
              SizedBox(
                height: 20.h,
              ),
              Text.rich(
                  style: Theme.of(context).textTheme.normal14Style_1,
                  TextSpan(children: [
                    TextSpan(text: R.string.label_choose_services),
                    TextSpan(
                        text: R.string.label_asterisk,
                        style: Theme.of(context)
                            .textTheme
                            .normal14Style_1
                            .copyWith(color: R.color.red))
                  ])),
              SizedBox(
                height: 4.h,
              ),
              chooseServicesField(),
              SizedBox(
                height: 4.h,
              ),
              // (_serviceCubit.selectedServices.isNotEmpty)
            ],
          ),
        ),
      ),
    );
  }

  Widget editKmField() {
    return TextField(
      maxLines: 1,
      controller: _km,
      onSubmitted: (_) => _cubit.saveInfo(_km.text, R.string.km),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        labelText: R.string.label_edit_km.tr(),
        alignLabelWithHint: true, // Insert this line
        // R.string.des_1,
      ),
    );
  }

  Widget conditionField() {
    return TextField(
      controller: _condition,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      maxLines: 4,
      style: TextStyle(color: R.color.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        labelText: R.string.label_des_st.tr(),
        alignLabelWithHint: true, // Insert this line
        // R.string.des_1,
      ),
      onSubmitted: (_) =>
          _cubit.saveInfo(_condition.text, R.string.condition),
    );
  }

  Widget chooseServicesField() {
    return TextField(
      readOnly: true,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.none,
      maxLines: 1,
      // controller: _nameController,
      style: Theme.of(context)
          .textTheme
          .normal14Style_1
          .copyWith(color: R.color.black),
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          minHeight: 15.w,
          minWidth: 15.h,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Image.asset(
            R.drawable.ic_arrow_down,
            width: 15.w,
            height: 15.h,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        labelText: R.string.label_choose_services,
        alignLabelWithHint: true, // Insert this line
        // R.string.des_1,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServicePage()),
        );
      },
    );
  }
  AppBar mainAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(left: 13.w),
          child: Image.asset(
            R.drawable.ic_arro_left,
          ),
        ),
        onTap: () {
          if(Navigator.canPop(context)) {
          Navigator.of(context).pop();
          }
        },
      ),
      leadingWidth: 40.w,
      title: Text(
        R.string.repair.tr(),
        style: Theme.of(context).textTheme.title_5,
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
