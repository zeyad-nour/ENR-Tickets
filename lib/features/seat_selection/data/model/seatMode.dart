enum SeatStatus { available, selected, booked }

class SeatModel {
  final String seatId;
  final int number;
  final SeatStatus status;
  final int row;
  final String position;
  final int price;

  SeatModel({
    required this.seatId,
    required this.number,
    required this.status,
    required this.row,
    required this.position,
    required this.price,
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      seatId: json['seatId'],
      number: json['number'],
      status: _mapStatus(json['status']),
      row: json['row'],
      position: json['position'],
      price: json['price'],
    );
  }

  static SeatStatus _mapStatus(String status) {
    switch (status) {
      case "available":
        return SeatStatus.available;
      case "booked":
        return SeatStatus.booked;
      default:
        return SeatStatus.available;
    }
  }

  SeatModel copyWith({SeatStatus? status}) {
    return SeatModel(
      seatId: seatId,
      number: number,
      status: status ?? this.status,
      row: row,
      position: position,
      price: price,
    );
  }
}