import 'package:equatable/equatable.dart';

class TripModel extends Equatable {
  final String id;
  final int trainNumber;
  final String departureTime;
  final String arrivalTime;
  final int price;
  final int availableSeats;

  const TripModel({
    required this.id,
    required this.trainNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.availableSeats,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['_id'] ?? '',
      trainNumber: json['trainNumber'] ?? 0,
      departureTime: json['departureTime'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      price: json['price'] ?? 0,
      availableSeats: json['availableSeats'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        trainNumber,
        departureTime,
        arrivalTime,
        price,
        availableSeats,
      ];
}