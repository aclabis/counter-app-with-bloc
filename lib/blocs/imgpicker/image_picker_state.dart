import 'package:equatable/equatable.dart';

abstract class ImagePickerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageInitialState extends ImagePickerState {}

class ImagePickedState extends ImagePickerState {
  final String imagepath;

  ImagePickedState({required this.imagepath});

  @override
  List<Object?> get props => [imagepath];
}
