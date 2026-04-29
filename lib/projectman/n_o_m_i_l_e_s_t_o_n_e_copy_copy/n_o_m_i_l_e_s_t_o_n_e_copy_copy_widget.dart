import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'n_o_m_i_l_e_s_t_o_n_e_copy_copy_model.dart';
export 'n_o_m_i_l_e_s_t_o_n_e_copy_copy_model.dart';

/// Create a component that says you have no milestones  get started , it
/// should be a clean design with a person holding up a flag
class NOMILESTONECopyCopyWidget extends StatefulWidget {
  const NOMILESTONECopyCopyWidget({super.key});

  @override
  State<NOMILESTONECopyCopyWidget> createState() =>
      _NOMILESTONECopyCopyWidgetState();
}

class _NOMILESTONECopyCopyWidgetState extends State<NOMILESTONECopyCopyWidget> {
  late NOMILESTONECopyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NOMILESTONECopyCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 24.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: Color(0x46DBDBDB),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.business_center_rounded,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 40.0,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'hxuztnef' /* No Projects Yet */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
