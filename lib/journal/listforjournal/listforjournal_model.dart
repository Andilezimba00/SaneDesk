import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'listforjournal_widget.dart' show ListforjournalWidget;
import 'package:flutter/material.dart';

class ListforjournalModel extends FlutterFlowModel<ListforjournalWidget> {
  ///  Local state fields for this page.

  String selectedMood = '\"\"';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
