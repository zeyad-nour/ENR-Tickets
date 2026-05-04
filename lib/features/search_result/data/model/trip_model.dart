class TripModel {
  final String tripId;
  final int trainNumber;
  final String trainType;
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final int price;
  final int availableTickets;
  final int totalSeats;

  TripModel({
    required this.tripId,
    required this.trainNumber,
    required this.trainType,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    required this.availableTickets,
    required this.totalSeats,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      tripId: json['tripId'] ?? '',
      trainNumber: json['trainNumber'] ?? 0,
      trainType: json['trainType'] ?? '',
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      departureTime: json['departureTime'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      duration: json['duration'] ?? '',
      price: json['price'] ?? 0,
      availableTickets: json['availableTickets'] ?? 0,
      totalSeats: json['totalSeats'] ?? 0,
    );
  }
}