import 'package:equatable/equatable.dart';

class Location extends Equatable {
  Location({this.name, this.type});

  String? name;
  String? type;

  @override
  List<Object?> get props => [name, type];
}
