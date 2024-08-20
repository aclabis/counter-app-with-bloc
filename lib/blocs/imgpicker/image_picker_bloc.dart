import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/blocs/imgpicker/image_picker_event.dart';
import 'package:counter_app/blocs/imgpicker/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePicker _imagePicker = ImagePicker();

  ImagePickerBloc() : super(ImageInitialState()) {
    on<GalleryImagePickerEvent>(galleryimagepickerevent);
  }

  FutureOr<void> galleryimagepickerevent(
      GalleryImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    final pickedimage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      emit(
        ImagePickedState(imagepath: pickedimage.path),
      );
    } else {
      emit(ImageInitialState());
    }
  }
}
