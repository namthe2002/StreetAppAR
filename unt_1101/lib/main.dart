import 'package:flutter/material.dart';

void main() {
  runApp(SeatingScreen());
}

class Seat {
  final int row;
  final int number;
  bool isOccupied;

  Seat({required this.row, required this.number, this.isOccupied = false});
}

class SeatingScreen extends StatefulWidget {
  @override
  _SeatingScreenState createState() => _SeatingScreenState();
}

class _SeatingScreenState extends State<SeatingScreen> {
  List<Seat> seats = [];

  List<Seat> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list of seats
    for (int i = 1; i <= 5; i++) {
      for (int j = 1; j <= 10; j++) {
        seats.add(Seat(row: i, number: j));
      }
    }
  }

  void toggleSeatSelection(Seat seat) {
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  void submitSeats() {
    setState(() {
      for (var i = 0; i < selectedSeats.length; i++) {
        selectedSeats[i].isOccupied = true;
      }
      selectedSeats.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Chọn ghế rạp chiếu phim')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 5,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: seats.map((seat) {
                  return InkWell(
                    onTap: () => toggleSeatSelection(seat),
                    child: Container(
                      decoration: BoxDecoration(
                        color: seat.isOccupied
                            ? Colors.grey
                            : (selectedSeats.contains(seat)
                            ? Colors.green
                            : Colors.blueGrey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${seat.row}${seat.number}'),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            selectedSeats.isNotEmpty ? _buildSelectedSeatsList() : Container(),

          ],
        ),
      ),
    );
  }

  Widget _buildSelectedSeatsList() {
    return Expanded(
      child: Column(
        children: [
          Divider(thickness: 2.0),
          SizedBox(height: 10.0),
          Text('Thông tin các ghế đã chọn:', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: selectedSeats.length,
              itemBuilder: (BuildContext context, int index) {
                Seat seat = selectedSeats[index];
                return ListTile(
                  title: Text('Ghế ${seat.row}${seat.number}'),
                  subtitle: Text('Giá: 100,000 VND'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


