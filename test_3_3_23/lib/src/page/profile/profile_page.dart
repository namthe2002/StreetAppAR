import 'package:MyApp/services/data_api.dart';
import 'package:MyApp/src/utils/custom_theme.dart';
import 'package:MyApp/src/widget/button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/R.dart';
import 'profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit _cubit;

  List _vehicles = [];

  Future<List> fetchVehicles() async {
    final response = await http.get(Uri.parse(
        'https://public.opendatasoft.com/api/records/1.0/search/?dataset=all-vehicles-model&q=&facet=make&facet=model&facet=cylinders&facet=drive&facet=eng_dscr&facet=fueltype&facet=fueltype1&facet=mpgdata&facet=phevblended&facet=trany&facet=vclass&facet=year'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _vehicles = data['records'];
    }
    return _vehicles;
  }

  @override
  void initState() {
    super.initState();
    _cubit = ProfileCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return SafeArea(child: _buildPage(context, state));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, ProfileState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: R.color.white,
        centerTitle: true,
        title: Text(
          R.string.repair.tr(),
          style: Theme.of(context)
              .textTheme
              .inner700_18
              .copyWith(color: R.color.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              child: Image.asset(
                R.drawable.ic_add_square,
                height: 24.h,
                width: 24.w,
              ),
              onTap: () {},
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.only(
          right: 20.w,
          left: 20.w,
          top: 24.h,
        ),
        child:
        FutureBuilder<List>(
          future: fetchVehicles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: R.color.blue, width: 1.w),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 84.w,
                                    height: 84.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                          'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?auto=compress&cs=tinysrgb&w=1600',
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          // errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // snapshot.data![index]['fields']['model'], //
                                        R.string.bsx.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .body16Style
                                            .copyWith(color: R.color.blue),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            R.drawable.ic_arro_left,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          SizedBox(width: 6.w,),
                                          Text.rich(
                                            style: Theme.of(context)
                                                .textTheme
                                                .normal14Style_1.copyWith(color: R.color.darkColor),
                                            TextSpan(
                                                text: R.string.date_repair.tr(),
                                                children: [
                                                  TextSpan(text: "\n"),
                                                  TextSpan(
                                                      text: snapshot
                                                          .data![index]
                                                      ['fields'][
                                                      'createdon']) /*Ngay sua chua*/
                                                ]),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            R.drawable.ic_arro_left,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          SizedBox(width: 6.w,),
                                          Text.rich(
                                            style: Theme.of(context)
                                                .textTheme
                                                .normal14Style_1.copyWith(color: R.color.darkColor),
                                            TextSpan(
                                                text: R.string.total_repair.tr(),
                                                children: [
                                                  TextSpan(
                                                      text: snapshot
                                                          .data![index]
                                                      ['fields']
                                                      ['displ']
                                                          .toString())
                                                ]),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ButtonWidget(
                                    textStyle: Theme.of(context).textTheme.inner600_14.copyWith(color: R.color.white),
                                    title: R.string.detail.tr(),
                                    onPressed: () {},
                                    filledBackground: true,
                                    height: 20.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: ButtonWidget(
                                    textStyle: Theme.of(context).textTheme.inner600_14.copyWith(color: R.color.buttonColor),
                                    title: R.string.label_profile_repair.tr(),
                                    onPressed: () {},
                                    filledBackground: false,
                                    height: 20.h,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Car {
  final String model;
  final String createdOn;
  final String displ;

  Car({required this.model, required this.createdOn, required this.displ});

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      model: map['fields']['license'],
      createdOn: map['fields']['createdon'],
      displ: map['fields']['displ'],
    );
  }
}
