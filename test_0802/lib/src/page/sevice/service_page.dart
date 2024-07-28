import 'package:MyApp/res/R.dart';
import 'package:MyApp/src/page/repair/repair.dart';
import 'package:MyApp/src/utils/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'service.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final TextEditingController _sr = TextEditingController();
  late ServiceCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ServiceCubit();
    _cubit.setSelected();
    _cubit.showServices = _cubit.service;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<ServiceCubit, ServiceState>(
          listener: (context, state) {},
          child: BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, state) {
              return _buildPage(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, ServiceState state) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: mainAppBar(), // AppBar of page
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: R.color.white),
          padding: EdgeInsets.fromLTRB(13.w, 23.h, 27.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              textFieldSerch(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _cubit.showServices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: _cubit.showServices[index].isSelected
                          ? Image.asset(
                              R.drawable.ic_picking, width: 20.w,
                              // color: Colors.green[700],
                            )
                          : Image.asset(
                              R.drawable.ic_box_pick,
                              width: 20.w,
                            ),
                      title: Text(
                        _cubit.showServices[index].name,
                        style: Theme.of(context).textTheme.normal14Style_1,
                      ),
                      onTap: () {
                        setState(() {
                          _cubit.selectService(
                              _cubit.showServices[index].name, index);
                        });
                      },
                    );
                  },
                ),
              ),
              _cubit.selectedServices.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      decoration: BoxDecoration(
                        color: R.color.blue,
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 10.w,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          child: Text(
                            R.string.label_continuous.tr(),
                            style: Theme.of(context).textTheme.bold16Style,
                          ),
                          // onPressed: () {
                          // },
                          onPressed: () {
                            _cubit.setSelected_2(_cubit.selectedServices);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RepairPage()),
                            );
                            // print(_cubit.getData(_cubit.selectedServices));
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
  Widget mainAppBar() {
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
            Navigator.of(context).pop();
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

  Widget textFieldSerch() {
    return TextField(
      controller: _sr,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        setState(() {
          _cubit.searchService(value);
        });
      },
      onSubmitted: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        labelText: R.string.label_search.tr(),
      ),
    );
  }
}
