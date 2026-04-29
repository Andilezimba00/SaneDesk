import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Screenshot_2026-04-25_at_8.32.55_PM.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Settings': ParameterData.none(),
  'listforjournal': ParameterData.none(),
  'CALENDAR2': ParameterData.none(),
  'medipage': ParameterData.none(),
  'voicerecording': ParameterData.none(),
  'Support': ParameterData.none(),
  'security': ParameterData.none(),
  'editproofile': ParameterData.none(),
  'changepassword': ParameterData.none(),
  'journal11Copy': (data) async => ParameterData(
        allParams: {
          'initialSelctedDate':
              getParameter<DateTime>(data, 'initialSelctedDate'),
          'onSelectedDateAction':
              getParameter<DateTime>(data, 'onSelectedDateAction'),
        },
      ),
  'desky': ParameterData.none(),
  'createproject': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'meditationtech': ParameterData.none(),
  'enterCopy2': ParameterData.none(),
  'Auth3': ParameterData.none(),
  'homepage': ParameterData.none(),
  'ProjectManagementpageCopy': ParameterData.none(),
  'event': ParameterData.none(),
  'journalpageCopy': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
          'journalRef':
              await getDocumentParameter<JournalentriesCollectionRecord>(data,
                  'journalRef', JournalentriesCollectionRecord.fromSnapshot),
        },
      ),
  'createmilstoneCopy': (data) async => ParameterData(
        allParams: {
          'manageclientsref':
              getParameter<DocumentReference>(data, 'manageclientsref'),
        },
      ),
  'createtaskCopyCopy': (data) async => ParameterData(
        allParams: {
          'manageclientsref':
              getParameter<DocumentReference>(data, 'manageclientsref'),
        },
      ),
  'project': (data) async => ParameterData(
        allParams: {
          'manageClientsRef':
              getParameter<DocumentReference>(data, 'manageClientsRef'),
        },
      ),
  'Clients': ParameterData.none(),
  'asabusiness': ParameterData.none(),
  'asafreelance': ParameterData.none(),
  'profile': ParameterData.none(),
  'profileCopy': ParameterData.none(),
  'pickandchooseCopy': ParameterData.none(),
  'invoicepagE': ParameterData.none(),
  'invoicepagecreate': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'invoicepagecreateFL': ParameterData.none(),
  'invoicedetailsFL': (data) async => ParameterData(
        allParams: {
          'invoicedoc': await getDocumentParameter<InvoicesRecord>(
              data, 'invoicedoc', InvoicesRecord.fromSnapshot),
        },
      ),
  'invoicepageFL': ParameterData.none(),
  'ClientsFL': ParameterData.none(),
  'recordingpageCopy': ParameterData.none(),
  'invoicedetailsCopy': (data) async => ParameterData(
        allParams: {
          'invoicedoc': await getDocumentParameter<InvoicesRecord>(
              data, 'invoicedoc', InvoicesRecord.fromSnapshot),
        },
      ),
  'SubscriptionPayment': ParameterData.none(),
  'wait': ParameterData.none(),
  'wait2': ParameterData.none(),
  'Auth3Copy': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
