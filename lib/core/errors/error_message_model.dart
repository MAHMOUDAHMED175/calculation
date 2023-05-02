import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String status_message;
  final bool success;
  final int status_code;

  const ErrorMessageModel(
      {required this.status_message,
      required this.success,
      required this.status_code});

  factory ErrorMessageModel.formJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        status_message: json["status_message"],
        success: json["success"],
        status_code: json["status_code"],
      );

  @override
  List<Object?> get props => [status_code, success, status_message];
}
