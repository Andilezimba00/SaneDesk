import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'invoicepagecreate_f_l_widget.dart' show InvoicepagecreateFLWidget;
import 'package:flutter/material.dart';

class InvoicepagecreateFLModel
    extends FlutterFlowModel<InvoicepagecreateFLWidget> {
  ///  Local state fields for this page.

  List<ItemsStruct> items = [];
  void addToItems(ItemsStruct item) => items.add(item);
  void removeFromItems(ItemsStruct item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, ItemsStruct item) =>
      items.insert(index, item);
  void updateItemsAtIndex(int index, Function(ItemsStruct) updateFn) =>
      items[index] = updateFn(items[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Bottom Sheet - createinvoice2] action in IconButton widget.
  ItemsStruct? newItem;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getDocRefFromID] action in Button widget.
  DocumentReference? clientRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? existingInvoices2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
