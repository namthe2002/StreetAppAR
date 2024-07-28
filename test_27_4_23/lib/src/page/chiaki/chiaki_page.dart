import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/R.dart';
import 'chiaki.dart';

class ChiakiPage extends StatefulWidget {
  const ChiakiPage({Key? key}) : super(key: key);

  @override
  _ChiakiPageState createState() => _ChiakiPageState();
}

class _ChiakiPageState extends State<ChiakiPage> {
  late ChiakiCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ChiakiCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<ChiakiCubit, ChiakiState>(
          listener: (context, state) {},
          child: BlocBuilder<ChiakiCubit, ChiakiState>(
            builder: (context, state) {
              return _buildPage(context, state);
            },
          ),
        ),
      ),
    );
  }


  Widget _buildPage(BuildContext context, ChiakiState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Expanded(
            child:  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.w),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
          ),
          ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your cart icon action here
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              
            ],
          ),
          SizedBox(
              height: 80.h,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: FutureBuilder<List<ProductDataModel>>(
                  future: _cubit.readJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      List<ProductDataModel>? items = snapshot.data;
                      return  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items?.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.all(10.w),
                                width: 70.w,
                                height: 70.h,
                                child:
                                    Image(
                                      image: NetworkImage(items![index].imageURL.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                    // Expanded(
                                    //   child: Padding(
                                    //     padding: EdgeInsets.only(left: 8),
                                    //     child: Column(
                                    //       mainAxisAlignment: MainAxisAlignment.center,
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           items[index].name.toString(),
                                    //           style: TextStyle(
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.bold,
                                    //           ),
                                    //         ),
                                    //         Text(
                                    //           items[index].price.toString(),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                              );
                          },
                        );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
