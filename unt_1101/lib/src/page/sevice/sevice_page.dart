import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sevice.dart';

class SevicePage extends StatefulWidget {
  const SevicePage({Key? key}) : super(key: key);

  @override
  _SevicePageState createState() => _SevicePageState();
}

class _SevicePageState extends State<SevicePage> {
  late SeviceCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SeviceCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<SeviceCubit, SeviceState>(
          listener: (context, state) {},
          child: BlocBuilder<SeviceCubit, SeviceState>(
            builder: (context, state) {
              return _buildPage(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, SeviceState state) {
    return Container();
  }
}