import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'languageselector_model.dart';
export 'languageselector_model.dart';

class LanguageselectorWidget extends StatefulWidget {
  const LanguageselectorWidget({super.key});

  @override
  State<LanguageselectorWidget> createState() => _LanguageselectorWidgetState();
}

class _LanguageselectorWidgetState extends State<LanguageselectorWidget> {
  late LanguageselectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageselectorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowLanguageSelector(
      width: 200.0,
      height: 40.0,
      backgroundColor: Color(0x4D2E2E2E),
      borderColor: Colors.transparent,
      dropdownIconColor: FlutterFlowTheme.of(context).tertiary,
      borderRadius: 50.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.poppins(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).tertiary,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      hideFlags: false,
      flagSize: 24.0,
      flagTextGap: 8.0,
      currentLanguage: FFLocalizations.of(context).languageCode,
      languages: FFLocalizations.languages(),
      onChanged: (lang) => setAppLanguage(context, lang),
    );
  }
}
