import '/flutter_flow/flutter_flow_util.dart';
import '/journal/calendar3/calendar3_widget.dart';
import '/index.dart';
import 'calendar2_widget.dart' show Calendar2Widget;
import 'package:flutter/material.dart';

class Calendar2Model extends FlutterFlowModel<Calendar2Widget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // Model for calendar3 component.
  late Calendar3Model calendar3Model;

  @override
  void initState(BuildContext context) {
    calendar3Model = createModel(context, () => Calendar3Model());
  }

  @override
  void dispose() {
    calendar3Model.dispose();
  }
}
