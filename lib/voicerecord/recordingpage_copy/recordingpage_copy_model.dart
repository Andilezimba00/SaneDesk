import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recordingpage_copy_widget.dart' show RecordingpageCopyWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class RecordingpageCopyModel extends FlutterFlowModel<RecordingpageCopyWidget> {
  ///  Local state fields for this page.

  bool isrecording = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  AudioRecorder? audioRecorder;
  String? outputAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  AudioPlayer? soundPlayer;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
