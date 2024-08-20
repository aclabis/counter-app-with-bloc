import 'dart:io';

import 'package:counter_app/blocs/counter/counter_bloc.dart';
import 'package:counter_app/blocs/counter/counter_event.dart';
import 'package:counter_app/blocs/counter/counter_state.dart';
import 'package:counter_app/blocs/imgpicker/image_picker_bloc.dart';
import 'package:counter_app/blocs/imgpicker/image_picker_event.dart';
import 'package:counter_app/blocs/imgpicker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '${state.counter}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<CounterBloc>().add(EventIncreament());
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      context.read<CounterBloc>().add(EventDecreament());
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "sub",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<ImagePickerBloc>()
                          .add(GalleryImagePickerEvent());
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: state is ImagePickedState
                          ? Image.file(File(state.imagepath), fit: BoxFit.cover)
                          : const Icon(
                              Icons.add,
                              size: 34,
                              color: Colors.white,
                            ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
