import 'package:equatable/equatable.dart';

class StationModel extends Equatable {
  final bool? success;
  final String? msg;

  const StationModel({this.success, this.msg});

  factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
    success: json['success'] as bool?,
    msg: json['msg'] as String?,
  );

  Map<String, dynamic> toJson() => {'success': success, 'msg': msg};

  @override
  List<Object?> get props => [success, msg];
}
