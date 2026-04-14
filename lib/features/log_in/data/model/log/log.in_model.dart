import 'package:equatable/equatable.dart';

import 'user.in_model.dart';

class Log extends Equatable {
  final String? token;
  final User? user;

  const Log({this.token, this.user});

  factory Log.fromJson(Map<String, dynamic> json) => Log(
    token: json['token'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'token': token, 'user': user?.toJson()};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token, user];
}
