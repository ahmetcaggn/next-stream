import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/upload/mixin/mixin_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/cubit_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/state_upload.dart';

/// The dialog for uploading a video
class DialogUpload extends StatefulWidget {
  /// Creates the dialog for uploading a video
  const DialogUpload({super.key});

  /// Shows the dialog for uploading a video
  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CubitUpload()),
          ],
          child: BlocListener<CubitUpload, StateUpload>(
            listener: (context, state) {
              if (state is StateUploadSuccess) {
                Navigator.of(context).pop();
              }
            },
            child: const DialogUpload(),
          ),
        );
      },
    );
  }

  @override
  State<DialogUpload> createState() => _DialogUploadState();
}

class _DialogUploadState extends State<DialogUpload> with MixinUpload {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Upload a video'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          const SizedBox(height: 16),
          _VideoPicker(onPickPressed: pickFile),
          _UploadButton(onPressed: uploadFile),
        ],
      ),
    );
  }
}

class _VideoPicker extends StatelessWidget {
  const _VideoPicker({
    required this.onPickPressed,
  });

  final VoidCallback onPickPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitUpload, StateUpload>(
      builder: (_, state) {
        return Column(
          children: [
            if (state is StateUploadFilePicked) Text(state.file.name),
            ElevatedButton(
              onPressed: onPickPressed,
              child: const Text('Pick a video'),
            ),
          ],
        );
      },
    );
  }
}

class _UploadButton extends StatelessWidget {
  const _UploadButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitUpload, StateUpload>(
      builder: (_, state) {
        final enabled = state is StateUploadFilePicked;

        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          child: const Text('Upload'),
        );
      },
    );
  }
}
