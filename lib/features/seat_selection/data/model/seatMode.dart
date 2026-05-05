// ignore_for_file: file_names

enum SeatStatus { available, selected, booked }

class SeatModel {
  final int number;
  final SeatStatus status;
  final int price;

  SeatModel({
    required this.number,
    required this.status,
    required this.price,
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      number: json['number'],
      price: json['price'] ?? 0,
      status: _mapStatus(json['status']),
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
      number: number,
      price: price,
      status: status ?? this.status,
    );
  }
}