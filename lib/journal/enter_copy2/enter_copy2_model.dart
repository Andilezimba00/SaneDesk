import '/flutter_flow/flutter_flow_util.dart';
import '/journal/howareyoufeeling/howareyoufeeling_widget.dart';
import '/index.dart';
import 'enter_copy2_widget.dart' show EnterCopy2Widget;
import 'package:flutter/material.dart';

class EnterCopy2Model extends FlutterFlowModel<EnterCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for howareyoufeeling component.
  late HowareyoufeelingModel howareyoufeelingModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '07uk4hu1' /* Give your day a title... is re... */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        's8nsfp60' /* Share your thoughts, feelings,... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    howareyoufeelingModel = createModel(context, () => HowareyoufeelingModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    howareyoufeelingModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
