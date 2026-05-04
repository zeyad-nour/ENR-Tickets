import 'package:equatable/equatable.dart';
import 'user.in_model.dart';

class LogInModel extends Equatable {
  final String? token;
  final User? user;

  const LogInModel({this.token, this.user});

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return LogInModel(
      token: data?['token'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'token': token, 'user': user?.toJson()};

  @override
  List<Object?> get props => [token, user];

  @override
  bool get stringify => true;
}
