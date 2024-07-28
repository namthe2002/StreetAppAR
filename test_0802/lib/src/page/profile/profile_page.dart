import 'package:MyApp/src/utils/custom_theme.dart';
import 'package:MyApp/src/widget/button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/R.dart';
import 'profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit _cubit;

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
      appBar: appBarCustom(),
      body: Container(
        padding: EdgeInsets.only(
          right: 20.w,
          left: 20.w,
          top: 24.h,
        ),
        child: buildCarItem(),
      ),
    );
  }


  Widget buildCarItem() {
    return FutureBuilder<List>(
      future: _cubit.fetchVehicles(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: R.color.borderColor, width: 1.w),
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
                              SizedBox(
                                width: 84.w,
                                height: 84.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: CachedNetworkImage(
                                      imageUrl: _cubit.url_image,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      // errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // snapshot.data![index]['fields']['model'], //
                                    R.string.bsx.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .body16Style
                                        .copyWith(color: R.color.buttonColor),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 2.h),
                                        child: Image.asset(
                                          R.drawable.ic_repair_1,
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text.rich(
                                        style: Theme.of(context)
                                            .textTheme
                                            .normal14Style_1
                                            .copyWith(color: R.color.darkColor),
                                        TextSpan(
                                            text: R.string.date_repair.tr(),
                                            children: [
                                              const TextSpan(text: "\n"),
                                              TextSpan(
                                                  text: snapshot.data![index]
                                                          ['fields'][
                                                      'createdon']) /*Ngay sua chua*/
                                            ]),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        R.drawable.ic_repair,
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text.rich(
                                        style: Theme.of(context)
                                            .textTheme
                                            .normal14Style_1
                                            .copyWith(color: R.color.darkColor),
                                        TextSpan(
                                            text: R.string.total_repair.tr(),
                                            children: [
                                              TextSpan(
                                                  text: snapshot.data![index]
                                                          ['fields']['displ']
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
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .inner600_14
                                    .copyWith(color: R.color.white),
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
                                borderColor: R.color.borderButton,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .inner600_14
                                    .copyWith(color: R.color.buttonColor),
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
        return const CircularProgressIndicator();
      },
    );
  }

  AppBar appBarCustom() {
    return AppBar(
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
    );
  }
}
