import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<VoiceNotesASStruct> _voiceNotesAS = [];
  List<VoiceNotesASStruct> get voiceNotesAS => _voiceNotesAS;
  set voiceNotesAS(List<VoiceNotesASStruct> value) {
    _voiceNotesAS = value;
  }

  void addToVoiceNotesAS(VoiceNotesASStruct value) {
    voiceNotesAS.add(value);
  }

  void removeFromVoiceNotesAS(VoiceNotesASStruct value) {
    voiceNotesAS.remove(value);
  }

  void removeAtIndexFromVoiceNotesAS(int index) {
    voiceNotesAS.removeAt(index);
  }

  void updateVoiceNotesASAtIndex(
    int index,
    VoiceNotesASStruct Function(VoiceNotesASStruct) updateFn,
  ) {
    voiceNotesAS[index] = updateFn(_voiceNotesAS[index]);
  }

  void insertAtIndexInVoiceNotesAS(int index, VoiceNotesASStruct value) {
    voiceNotesAS.insert(index, value);
  }

  List<SavedQuotesStruct> _savedQuotes = [];
  List<SavedQuotesStruct> get savedQuotes => _savedQuotes;
  set savedQuotes(List<SavedQuotesStruct> value) {
    _savedQuotes = value;
  }

  void addToSavedQuotes(SavedQuotesStruct value) {
    savedQuotes.add(value);
  }

  void removeFromSavedQuotes(SavedQuotesStruct value) {
    savedQuotes.remove(value);
  }

  void removeAtIndexFromSavedQuotes(int index) {
    savedQuotes.removeAt(index);
  }

  void updateSavedQuotesAtIndex(
    int index,
    SavedQuotesStruct Function(SavedQuotesStruct) updateFn,
  ) {
    savedQuotes[index] = updateFn(_savedQuotes[index]);
  }

  void insertAtIndexInSavedQuotes(int index, SavedQuotesStruct value) {
    savedQuotes.insert(index, value);
  }
}
