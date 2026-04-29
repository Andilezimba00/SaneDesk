import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth3_copy_widget.dart' show Auth3CopyWidget;
import 'package:flutter/material.dart';

class Auth3CopyModel extends FlutterFlowModel<Auth3CopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();
  }
}
