import 'package:equatable/equatable.dart';
import 'trip_model.dart';

class TripSearchResponse extends Equatable {
  final bool success;
  final String msg;
  final List<TripModel> trips;

  const TripSearchResponse({
    required this.success,
    required this.msg,
    required this.trips,
  });

  factory TripSearchResponse.fromJson(Map<String, dynamic> json) {
    return TripSearchResponse(
      success: json['success'] ?? false,
      msg: json['msg'] ?? '',
      trips: (json['data'] as List<dynamic>)
          .map((e) => TripModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [success, msg, trips];
}