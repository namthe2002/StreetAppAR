import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theater.dart';

class TheaterCubit extends Cubit<TheaterState> {
  TheaterCubit() : super(TheaterInitial()) {
    // TODO
  }

  List<Seat> seats = [];

  List<Seat> selectedSeats = [];

  var count = 0;
  void initSeats() {
    for (int i = 1; i <= 6; i++) {
      for (int j = 1; j <= 12; j++) {
        seats.add(Seat(row: i, number: j));
      }
    }
  }
  void toggleSeatSelection(Seat seat) {
    emit(TheaterLoading());
    if (selectedSeats.contains(seat)) {
      selectedSeats.remove(seat);
      count = count - 60;
      emit(TheaterLoading());
    } else {
      selectedSeats.add(seat);
      count = count + 60;
      emit(TheaterLoading());
    }
    emit(TheaterInitial());
  }

  void submitSeats() {
    emit(TheaterLoading());
    for (var i = 0; i < selectedSeats.length; i++) {
      selectedSeats[i].isOccupied = true;
      emit(TheaterInitial());
    }

    selectedSeats.clear();
    count = 0;
    emit(TheaterInitial());
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(size.width / 2, 0, size.width / 1, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Seat {
  final int row;
  final int number;
  bool isOccupied;

  Seat({required this.row, required this.number, this.isOccupied = false});
}
