import 'package:equatable/equatable.dart';

class Organization extends Equatable {
  final String orgCode;
  final String orgName;

  const Organization(this.orgCode, this.orgName);

  @override
  List<Object?> get props => [orgCode];

  static Organization fromJson(dynamic data) {
    return Organization(data["orgCode"], data["orgName"]);
  }
}