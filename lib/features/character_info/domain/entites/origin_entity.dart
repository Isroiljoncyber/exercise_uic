import 'package:equatable/equatable.dart';

class Origin extends Equatable {
  final String? dimension;
  final String? name;
  final String? type;

  const Origin({required this.dimension, required this.name, required this.type});

  @override
  List<Object?> get props => [dimension, name, type];
}
