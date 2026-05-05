import 'package:enr_tickets/features/seat_selection/data/model/seatMode.dart';

class SeatResponse {
  final String tripId;
  final int totalSeats;
  final List<SeatModel> seats;

  SeatResponse({
    required this.tripId,
    required this.totalSeats,
    required this.seats,
  });

  factory SeatResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return SeatResponse(
      tripId: data['tripId'],
      totalSeats: data['totalSeats'],
      seats: (data['seats'] as List)
          .map((e) => SeatModel.fromJson(e))
          .toList(),
    );
  }
}