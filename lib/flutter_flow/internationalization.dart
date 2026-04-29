import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
  }) =>
      [enText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Settings
  {
    'q0k9n670': {
      'en': 'Account',
      'zh_Hans': '帐户',
    },
    'u9mtyv5c': {
      'en': 'Payment Options',
      'zh_Hans': '付款方式',
    },
    'wl5r2oup': {
      'en': 'Language',
      'zh_Hans': '语言',
    },
    'lpixlgtv': {
      'en': 'Edit Profile',
      'zh_Hans': '编辑个人资料',
    },
    'g753qrcc': {
      'en': 'Edit Business Profile',
      'zh_Hans': '编辑个人资料',
    },
    '4kgz3arc': {
      'en': 'General',
      'zh_Hans': '一般的',
    },
    'ef3jhdyx': {
      'en': 'Support',
      'zh_Hans': '支持',
    },
    'apkcxv9t': {
      'en': 'Invite Friends',
      'zh_Hans': '邀请好友',
    },
    '5ld7ve5n': {
      'en': 'Settings',
      'zh_Hans': '太平洋标准时间',
    },
  },
  // listforjournal
  {
    'g9ojhcwk': {
      'en': 'All Moods',
      'zh_Hans': '所有心情',
    },
    'so6x8qqy': {
      'en': 'Mood',
      'zh_Hans': '情绪',
    },
    '3eriukgm': {
      'en': 'Very Bad',
      'zh_Hans': '非常糟糕',
    },
    '5d2cxplm': {
      'en': 'Bad',
      'zh_Hans': '坏的',
    },
    'el5m9c3a': {
      'en': 'Okay',
      'zh_Hans': '好的',
    },
    '3yd8rrmp': {
      'en': 'Good',
      'zh_Hans': '好的',
    },
    'j67y3adb': {
      'en': 'Great',
      'zh_Hans': '伟大的',
    },
  },
  // CALENDAR2
  {
    '5zwszjma': {
      'en': 'My Calendar',
      'zh_Hans': '我的日历',
    },
    'er46hanh': {
      'en': 'Events',
      'zh_Hans': '活动',
    },
  },
  // medipage
  {
    'u3ipocb4': {
      'en': 'Tap me for \nmeditation techniques',
      'zh_Hans': '',
    },
    'jrrhkuiv': {
      'en': 'Time remaining',
      'zh_Hans': '剩余分钟数',
    },
    'hu2qo0ey': {
      'en': 'Deep Breathing',
      'zh_Hans': '深呼吸',
    },
    'e98fq06b': {
      'en': 'Focus on your breath and let your mind find peace',
      'zh_Hans': '专注于呼吸，让心灵找到平静',
    },
    '1a8st5pb': {
      'en': '5 min',
      'zh_Hans': '5分钟',
    },
    'kr73363z': {
      'en': '10 min',
      'zh_Hans': '10分钟',
    },
    'taob2fyk': {
      'en': '15 min',
      'zh_Hans': '15分钟',
    },
    'f99bo0ng': {
      'en': '30 min',
      'zh_Hans': '30分钟',
    },
  },
  // voicerecording
  {
    'fuj0wzns': {
      'en': 'Voice Notes',
      'zh_Hans': '语音笔记',
    },
    'ftpb4w8i': {
      'en': 'Tap to begin',
      'zh_Hans': '点按开始',
    },
    'pm655bzk': {
      'en': 'Voice Journal',
      'zh_Hans': '语音日志',
    },
  },
  // Support
  {
    '4h9o2075': {
      'en': 'Need Help?',
      'zh_Hans': '',
    },
    '50s72rs7': {
      'en':
          'We\'re here to support you. Find answers to common questions or get in touch with our team.',
      'zh_Hans': '',
    },
    'stfzxw95': {
      'en': 'Frequently Asked Questions',
      'zh_Hans': '',
    },
    'lc62iro6': {
      'en': 'Browse our most common questions and solutions',
      'zh_Hans': '',
    },
    'nlz4jzq0': {
      'en': 'Email Support',
      'zh_Hans': '',
    },
    '5i4olclq': {
      'en': 'Send us an email and we\'ll get back to you within 24 hours',
      'zh_Hans': '',
    },
    'm5s4jdzy': {
      'en': 'click here for sanedesk support email',
      'zh_Hans': '',
    },
    'rfqcmu6x': {
      'en': 'Still Need Help?',
      'zh_Hans': '',
    },
    '8bhh4bgb': {
      'en':
          'Our support team is standing by to help you resolve any issues you may have.',
      'zh_Hans': '',
    },
  },
  // security
  {
    'huzq254f': {
      'en': 'Terms of Service',
      'zh_Hans': '',
    },
    'mdp6d2bd': {
      'en': 'Last updated: December 15, 2025',
      'zh_Hans': '',
    },
    'kgwzxp80': {
      'en': '1. License Acceptance',
      'zh_Hans': '',
    },
    'ysqc09hu': {
      'en':
          'By accessing and using this application, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service. This agreement constitutes a legally binding contract between you and our company. If you do not agree to these terms, you must discontinue use of the service immediately.',
      'zh_Hans': '',
    },
    'dfdopx8i': {
      'en': '2. User Accounts',
      'zh_Hans': '',
    },
    'caheyo52': {
      'en':
          'To access certain features of our service, you must create an account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to provide accurate, current, and complete information during registration and to update such information as necessary.',
      'zh_Hans': '',
    },
    'lgpq5i20': {
      'en': '3. Information Security',
      'zh_Hans': '',
    },
    'jp6o8iwn': {
      'en':
          'We implement industry-standard security measures to protect your personal information. This includes encryption of sensitive data, secure transmission protocols, and regular security audits. However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.',
      'zh_Hans': '',
    },
    'hezgy5uy': {
      'en': 'Security Commitment',
      'zh_Hans': '',
    },
    'ele8hz9v': {
      'en':
          'Your data is encrypted using AES-256 encryption and stored on secure servers with multi-factor authentication.',
      'zh_Hans': '',
    },
    '3jqy60dh': {
      'en': '4. Data Protection',
      'zh_Hans': '',
    },
    '3geqc6j8': {
      'en':
          'We collect and process your personal information in accordance with our Privacy Policy. By using our service, you consent to the collection, use, and disclosure of your information as described in our Privacy Policy. We do not sell, trade, or rent your personal information to third parties without your explicit consent.',
      'zh_Hans': '',
    },
    '69gpcych': {
      'en': '5. User Responsibilities',
      'zh_Hans': '',
    },
    'n6n6cj8h': {
      'en':
          'You agree to use our service only for lawful purposes and in accordance with these Terms. You are prohibited from:',
      'zh_Hans': '',
    },
    'phkxyxdv': {
      'en': '•',
      'zh_Hans': '',
    },
    'avplvtjv': {
      'en': 'Violating any applicable laws or regulations',
      'zh_Hans': '',
    },
    'jary73kl': {
      'en': '•',
      'zh_Hans': '',
    },
    'gagnwisu': {
      'en': 'Attempting to gain unauthorized access to our systems',
      'zh_Hans': '',
    },
    'a1qxhj2h': {
      'en': '•',
      'zh_Hans': '',
    },
    'e8iaizh2': {
      'en': 'Interfering with the proper functioning of the service',
      'zh_Hans': '',
    },
    'fznzzde3': {
      'en': '6. Account Security',
      'zh_Hans': '',
    },
    'a7jb62mq': {
      'en':
          'You are solely responsible for maintaining the security of your account. This includes choosing a strong password, enabling two-factor authentication when available, and promptly notifying us of any unauthorized use of your account. We recommend regularly updating your password and reviewing your account activity.',
      'zh_Hans': '',
    },
    'v9gzh1g6': {
      'en': '7. Service Availability',
      'zh_Hans': '',
    },
    'i2cpxcme': {
      'en':
          'While we strive to maintain continuous service availability, we do not guarantee uninterrupted access. We reserve the right to modify, suspend, or discontinue any part of our service at any time with or without notice. We are not liable for any interruption of service or loss of data.',
      'zh_Hans': '',
    },
    'y5b35oju': {
      'en': '8. Limitation of Liability',
      'zh_Hans': '',
    },
    '10cafnmt': {
      'en':
          'To the maximum extent permitted by law, we shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of our service. Our total liability shall not exceed the amount paid by you for the service in the twelve months preceding the claim.',
      'zh_Hans': '',
    },
    'w7n2i0dw': {
      'en': '9. Termination',
      'zh_Hans': '',
    },
    'nzjzasp7': {
      'en':
          'Either party may terminate this agreement at any time. We may suspend or terminate your account immediately if you violate these Terms. Upon termination, your right to use the service ceases immediately, and we may delete your account and associated data.',
      'zh_Hans': '',
    },
    'utsghbei': {
      'en': '10. Contact Information',
      'zh_Hans': '',
    },
    'ucbo9gkd': {
      'en':
          'If you have any questions about these Terms of Service, please contact us at legal@company.com or through our support portal. We will respond to your inquiries within 48 hours during business days.',
      'zh_Hans': '',
    },
    's1cpo8kl': {
      'en': 'Your Privacy Matters',
      'zh_Hans': '',
    },
    'pyrovegy': {
      'en':
          'We are committed to protecting your personal information and maintaining the highest standards of data security and privacy.',
      'zh_Hans': '',
    },
  },
  // editproofile
  {
    'fj65lvwl': {
      'en': 'Username',
      'zh_Hans': '',
    },
    'z66nqe17': {
      'en': 'Enter username',
      'zh_Hans': '',
    },
    'j1lmusjn': {
      'en': 'Update Profile',
      'zh_Hans': '',
    },
    'rpj097dl': {
      'en': 'Change password ?',
      'zh_Hans': '',
    },
    '4qapx8lo': {
      'en': 'Log out ',
      'zh_Hans': '',
    },
    'ag6uliik': {
      'en': 'Delete Account',
      'zh_Hans': '',
    },
    'weaaq1po': {
      'en': 'username is required',
      'zh_Hans': '',
    },
    'bvh3opld': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
  },
  // changepassword
  {
    'vafifg9t': {
      'en': 'Update Your Password',
      'zh_Hans': '',
    },
    'rqe1f9ne': {
      'en': 'Enter your current password and choose a new secure password.',
      'zh_Hans': '',
    },
    'mtddwaz8': {
      'en': 'Current Password',
      'zh_Hans': '',
    },
    'oup4454y': {
      'en': 'Enter current password',
      'zh_Hans': '',
    },
    'py0rr8wn': {
      'en': 'New Password',
      'zh_Hans': '',
    },
    '58lotcoe': {
      'en': 'Enter new password',
      'zh_Hans': '',
    },
    '1yiah7lo': {
      'en': 'Confirm New Password',
      'zh_Hans': '',
    },
    '43rgxjxu': {
      'en': 'Confirm new password',
      'zh_Hans': '',
    },
    '962ora11': {
      'en': 'Enter current password is required',
      'zh_Hans': '',
    },
    'mkb0ufp2': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '7ecn0jpt': {
      'en': 'Enter new password is required',
      'zh_Hans': '',
    },
    'w1xs7p8c': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'oth2efid': {
      'en': 'Confirm new password is required',
      'zh_Hans': '',
    },
    '3z11g9v5': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'bv8zj0r5': {
      'en': 'Password Requirements',
      'zh_Hans': '',
    },
    'bczq01ly': {
      'en':
          '• At least 8 characters long\n• Include uppercase and lowercase letters\n• Include at least one number\n• Include at least one special character',
      'zh_Hans': '',
    },
    'ka9pyjqf': {
      'en': 'Update Password',
      'zh_Hans': '',
    },
    'wz7aulca': {
      'en': 'Forgot your current password?',
      'zh_Hans': '',
    },
    'qzewmq07': {
      'en': 'Reset Password Instead',
      'zh_Hans': '',
    },
  },
  // journal11Copy
  {
    'jsh23ydu': {
      'en': 'My Journal',
      'zh_Hans': '我的日记',
    },
    'ubu0z0kw': {
      'en': 'Events',
      'zh_Hans': '',
    },
    'aj9p7tl6': {
      'en': 'Tracker',
      'zh_Hans': '',
    },
    '2qe5ks2k': {
      'en': 'VoiceNotes',
      'zh_Hans': '',
    },
    '6m5286lu': {
      'en': 'Journals',
      'zh_Hans': '杂志',
    },
  },
  // desky
  {
    'gxlf9uwr': {
      'en': 'Invoice \nGenerator ',
      'zh_Hans': '',
    },
    'ghwcphvl': {
      'en': 'Clients',
      'zh_Hans': '',
    },
    '7m0fvbaj': {
      'en': 'Desky\'s level',
      'zh_Hans': '同伴级别',
    },
    'kul0pl8u': {
      'en': 'Streaks',
      'zh_Hans': '条纹',
    },
    'm0gm5mqt': {
      'en': 'Journal ',
      'zh_Hans': '杂志',
    },
    '6mm78jdn': {
      'en': 'Meditation',
      'zh_Hans': '冥想',
    },
    'sl7vqu61': {
      'en': 'Meditation',
      'zh_Hans': '冥想',
    },
    'hdn77gow': {
      'en': 'Desky',
      'zh_Hans': '伴侣',
    },
  },
  // createproject
  {
    '6yosa7fy': {
      'en': 'New Project',
      'zh_Hans': '新项目',
    },
    'bdr87xrd': {
      'en': 'Fill in the details below to create your project proposal',
      'zh_Hans': '填写以下详细信息以创建您的项目提案',
    },
    'u5he8lsl': {
      'en': 'Client Information',
      'zh_Hans': '客户信息',
    },
    '9rvt0fbe': {
      'en': 'Client Name',
      'zh_Hans': '客户名称',
    },
    'fp3sex5d': {
      'en': 'Enter client\'s full name',
      'zh_Hans': '输入客户的全名',
    },
    '3bhzgfll': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件',
    },
    '3qg4vk3d': {
      'en': 'client@example.com',
      'zh_Hans': 'client@example.com',
    },
    '1yid7she': {
      'en': 'Phone Number',
      'zh_Hans': '电话号码',
    },
    '90l8fiui': {
      'en': '+1 (555) 123-4567',
      'zh_Hans': '+1 (555) 123-4567',
    },
    'sledm0q6': {
      'en': 'Project Details',
      'zh_Hans': '项目细节',
    },
    '62s095as': {
      'en': 'Project Title',
      'zh_Hans': '项目名称',
    },
    'es7us8rd': {
      'en': 'Enter project title',
      'zh_Hans': '输入项目标题',
    },
    'pmpfjs0f': {
      'en': 'Project Description',
      'zh_Hans': '项目描述',
    },
    '9mto33fy': {
      'en': 'Describe the project scope, deliverables, and timeline...',
      'zh_Hans': '描述项目范围、可交付成果和时间表...',
    },
    'cxjcbecd': {
      'en': 'Payment Information',
      'zh_Hans': '付款信息',
    },
    'mjqjjver': {
      'en': 'Total Amount',
      'zh_Hans': '总金额',
    },
    'gq7totub': {
      'en': '\$5,000',
      'zh_Hans': '5,000 美元',
    },
    'k0wq7b7t': {
      'en': 'Client Name is required',
      'zh_Hans': '',
    },
    'zv05ggpj': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '6n37ntxw': {
      'en': 'Email Address is required',
      'zh_Hans': '',
    },
    's6vj1egb': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '4jwem7rw': {
      'en': 'Phone Number is required',
      'zh_Hans': '',
    },
    '9003yg5p': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '12bk7wyb': {
      'en': 'Project Title is required',
      'zh_Hans': '',
    },
    '0ln73yyr': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'pb75cbut': {
      'en': 'Project Description is required',
      'zh_Hans': '',
    },
    'c1hzim5r': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'z1j1p88p': {
      'en': 'Total Amount is required',
      'zh_Hans': '',
    },
    '65s2m5m8': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '9wbdasvf': {
      'en': 'Create Project',
      'zh_Hans': '创建项目',
    },
    '6don44rb': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // meditationtech
  {
    '80nzi8r4': {
      'en': 'Meditation Guide',
      'zh_Hans': '',
    },
    'y0zd0c87': {
      'en': 'Find inner peace through mindful practice',
      'zh_Hans': '',
    },
    'lrj7wl21': {
      'en': 'Breathing Meditation',
      'zh_Hans': '',
    },
    'uwcvvh7t': {
      'en': 'Focus on your breath to calm the mind',
      'zh_Hans': '',
    },
    'zzgcjyud': {
      'en': 'Steps:',
      'zh_Hans': '',
    },
    'zn218cge': {
      'en': 'Sit comfortably with your back straight',
      'zh_Hans': '',
    },
    '07uxmdsh': {
      'en': 'Close your eyes and breathe naturally',
      'zh_Hans': '',
    },
    'zzincxjj': {
      'en': 'Focus your attention on your breath',
      'zh_Hans': '',
    },
    'srg4i7p9': {
      'en': 'When mind wanders, gently return to breath',
      'zh_Hans': '',
    },
    'wuda2hwv': {
      'en': 'Kindness',
      'zh_Hans': '',
    },
    'radtdy2w': {
      'en': 'Cultivate compassion for yourself and others',
      'zh_Hans': '',
    },
    'lisludlj': {
      'en': 'Practice:',
      'zh_Hans': '',
    },
    'igx69jli': {
      'en': 'Repeat these phrases silently:',
      'zh_Hans': '',
    },
    'zv15znoa': {
      'en': 'May I be happy and peaceful',
      'zh_Hans': '',
    },
    'vfzl5vkl': {
      'en': 'May I be healthy and strong',
      'zh_Hans': '',
    },
    'wqfk0qcg': {
      'en': 'May I live with ease',
      'zh_Hans': '',
    },
    'tvy08ym3': {
      'en': 'May all beings be happy',
      'zh_Hans': '',
    },
    '1atcyb07': {
      'en': 'Mindful Observation',
      'zh_Hans': '',
    },
    'l0dvh6m6': {
      'en': 'Observe thoughts without judgment',
      'zh_Hans': '',
    },
    'okiratud': {
      'en': 'Technique:',
      'zh_Hans': '',
    },
    'xsyqnphu': {
      'en':
          'Sit quietly and simply observe your thoughts as they come and go, like clouds passing in the sky. Don\'t try to stop them or engage with them.',
      'zh_Hans': '',
    },
    'p4uxqhzo': {
      'en': 'Start Your Practice',
      'zh_Hans': '',
    },
  },
  // enterCopy2
  {
    'f9716xmv': {
      'en': 'Edit your journal',
      'zh_Hans': '编辑你的日记',
    },
    'rb92y0gp': {
      'en': 'Describe that day',
      'zh_Hans': '描述那一天',
    },
    '2lzec98z': {
      'en': 'Give your day a title...',
      'zh_Hans': '给你的一天起个标题...',
    },
    'gj74n9ej': {
      'en': 'Tell me more  about it',
      'zh_Hans': '告诉我更多相关信息',
    },
    'pgxgiw0r': {
      'en':
          'Share your thoughts, feelings, and experiences from today. What made you smile? What challenged you? What changed \n',
      'zh_Hans': '分享你今天的想法、感受和经历。什么让你微笑？什么挑战了你？什么改变了你？',
    },
    'gqlj2ql8': {
      'en': 'Save changes',
      'zh_Hans': '保存更改',
    },
    '07uk4hu1': {
      'en': 'Give your day a title... is required',
      'zh_Hans': '',
    },
    'qg2wlkdh': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    's8nsfp60': {
      'en':
          'Share your thoughts, feelings, and experiences from today. What made you smile? What challenged you? What changed \n is required',
      'zh_Hans': '',
    },
    'vmc4hw9t': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
  },
  // Auth3
  {
    '4qh8x1hb': {
      'en': 'SaneDesk',
      'zh_Hans': '',
    },
    'fia7rtso': {
      'en': 'Create Account',
      'zh_Hans': '',
    },
    '394jfwyl': {
      'en': 'Create Account',
      'zh_Hans': '',
    },
    'qeucx2o9': {
      'en': 'Let\'s get started by filling out the form below.',
      'zh_Hans': '',
    },
    '1wsuqdc8': {
      'en': 'Email',
      'zh_Hans': '',
    },
    'jvz5g1ls': {
      'en': 'Username',
      'zh_Hans': '',
    },
    'qf5jqbk4': {
      'en': 'Password',
      'zh_Hans': '',
    },
    'np7c036r': {
      'en': 'Confirm password',
      'zh_Hans': '',
    },
    '3aboqu98': {
      'en': 'Get Started',
      'zh_Hans': '',
    },
    'yokkdn5r': {
      'en': 'Or sign up with',
      'zh_Hans': '',
    },
    'tats50ty': {
      'en': 'Continue with Google',
      'zh_Hans': '',
    },
    'ma9ekj12': {
      'en': 'Continue with Apple',
      'zh_Hans': '',
    },
    '5kttuzk1': {
      'en': 'Email is required',
      'zh_Hans': '',
    },
    'lwc871em': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '7dfyxgru': {
      'en': 'Username is required',
      'zh_Hans': '',
    },
    'mnbc57f7': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'nkj8inwx': {
      'en': 'Password is required',
      'zh_Hans': '',
    },
    '1p1t4hjv': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '85j4z1jc': {
      'en': 'Confirm password is required',
      'zh_Hans': '',
    },
    '2u08a9e4': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'y17wasgn': {
      'en': 'Log In',
      'zh_Hans': '',
    },
    '2lxeiidz': {
      'en': 'Welcome Back',
      'zh_Hans': '',
    },
    'lo4p4sz2': {
      'en': 'Fill out the information below in order to access your account.',
      'zh_Hans': '',
    },
    'y71gu5a6': {
      'en': 'Email',
      'zh_Hans': '',
    },
    '2mh2gkgx': {
      'en': 'Password',
      'zh_Hans': '',
    },
    'i2aj7d3c': {
      'en': 'Forgot Password?',
      'zh_Hans': '',
    },
    'gf2ek0ho': {
      'en': 'Sign In',
      'zh_Hans': '',
    },
    'hgb7gron': {
      'en': 'Or sign in with',
      'zh_Hans': '',
    },
    'rly5858w': {
      'en': 'Continue with Google',
      'zh_Hans': '',
    },
    '7v3wxy0i': {
      'en': 'Continue with Apple',
      'zh_Hans': '',
    },
    '443u7me1': {
      'en': 'Email is required',
      'zh_Hans': '',
    },
    'jokip7l3': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'wxyr5528': {
      'en': 'Password is required',
      'zh_Hans': '',
    },
    'vh62jw0i': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '4s4zrsq7': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // homepage
  {
    '2r83c5ml': {
      'en': 'Lets meditate',
      'zh_Hans': '',
    },
    'ujjhi5rb': {
      'en': 'Start',
      'zh_Hans': '',
    },
    'alkclla6': {
      'en': 'Events',
      'zh_Hans': '',
    },
    'zlihfpe6': {
      'en': 'Daily Streak',
      'zh_Hans': '',
    },
    'uqugivv6': {
      'en': 'Due projects',
      'zh_Hans': '',
    },
    '1pc646z7': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // ProjectManagementpageCopy
  {
    'qd9oug4u': {
      'en': 'Control Panel',
      'zh_Hans': '',
    },
    'konkza2z': {
      'en': 'Recent Client Contacts',
      'zh_Hans': '最近的客户联系',
    },
    '5ft7spjz': {
      'en': 'Progress Tracker',
      'zh_Hans': '进度追踪器',
    },
    'w65b9u06': {
      'en': 'Active Clients',
      'zh_Hans': '活跃客户',
    },
    'ih9vq6nc': {
      'en': 'Project Management',
      'zh_Hans': '项目管理',
    },
    'mdsnqzrb': {
      'en': 'Control',
      'zh_Hans': '下午',
    },
  },
  // event
  {
    'wjbtnmrv': {
      'en': 'Create Event',
      'zh_Hans': '',
    },
    'r0qvbkmr': {
      'en': 'Event Title',
      'zh_Hans': '',
    },
    'l5sohcpg': {
      'en': 'Enter event name...',
      'zh_Hans': '',
    },
    'npuqopn2': {
      'en': 'Description',
      'zh_Hans': '',
    },
    '7qbtszt0': {
      'en': 'Enter event name...',
      'zh_Hans': '',
    },
    'fq1n34tb': {
      'en': 'Event Date & Time',
      'zh_Hans': '',
    },
    'wvntoou2': {
      'en': 'Event time',
      'zh_Hans': '',
    },
    'yfvifiy1': {
      'en': 'Enter event name... is required',
      'zh_Hans': '',
    },
    'rgdlzo41': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'fdzn96iz': {
      'en': 'Enter event name... is required',
      'zh_Hans': '',
    },
    'f596hrbi': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'imlaj3ot': {
      'en': 'Create Event',
      'zh_Hans': '',
    },
  },
  // journalpageCopy
  {
    '4s6ltsit': {
      'en': 'Mood',
      'zh_Hans': '',
    },
  },
  // createmilstoneCopy
  {
    '03tlzh86': {
      'en': 'Milestone',
      'zh_Hans': '里程碑',
    },
    '55cj5q7n': {
      'en': 'Milestone',
      'zh_Hans': '里程碑',
    },
    '4ymc3cn9': {
      'en': 'Milestone title',
      'zh_Hans': '里程碑标题',
    },
    'rt743gij': {
      'en': 'Desccription',
      'zh_Hans': '电子邮件',
    },
    'kab6mwem': {
      'en': 'Milestone details',
      'zh_Hans': '里程碑详情',
    },
    'gwqwhe2y': {
      'en': 'Due Date',
      'zh_Hans': '到期日',
    },
    'h5vip0rj': {
      'en': 'Milestone',
      'zh_Hans': '里程碑',
    },
    'rjaz7bl6': {
      'en': 'Milestone is required',
      'zh_Hans': '',
    },
    '0ykvkoj7': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '7epxhfup': {
      'en': 'Desccription is required',
      'zh_Hans': '',
    },
    '8ln9yji6': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'c4z2pb7a': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // createtaskCopyCopy
  {
    'szbupr88': {
      'en': 'Task',
      'zh_Hans': '任务',
    },
    '65mt0w4u': {
      'en': 'Task',
      'zh_Hans': '任务',
    },
    'xz23z2rt': {
      'en': 'Task title',
      'zh_Hans': '任务标题',
    },
    'bu3k17hi': {
      'en': 'task details',
      'zh_Hans': '任务详情',
    },
    'i2iuz1bh': {
      'en': 'Task details',
      'zh_Hans': '任务详细信息',
    },
    '6rbouf71': {
      'en': 'Select milestone...',
      'zh_Hans': '',
    },
    'j9ikdxf9': {
      'en': 'Search...',
      'zh_Hans': '',
    },
    'vr9dn0js': {
      'en': 'Option 1',
      'zh_Hans': '',
    },
    'd5snjkin': {
      'en': 'Due Date',
      'zh_Hans': '到期日',
    },
    'lnxql248': {
      'en': 'Create task',
      'zh_Hans': '',
    },
    '2d5xmai1': {
      'en': 'Task is required',
      'zh_Hans': '',
    },
    '0bovmyms': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'muwy3vbh': {
      'en': 'task details is required',
      'zh_Hans': '',
    },
    'nfidjhtv': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'yhq9gfkb': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // project
  {
    'ivm006yx': {
      'en': 'Milestones',
      'zh_Hans': '',
    },
    'fwffq26i': {
      'en': '/',
      'zh_Hans': '/',
    },
    'yb6lz8yl': {
      'en': 'My Tasks',
      'zh_Hans': '',
    },
    've29n8wt': {
      'en': 'Not Completed',
      'zh_Hans': '',
    },
    'rrezli9c': {
      'en': 'Due',
      'zh_Hans': '',
    },
    'tkoatye8': {
      'en': 'Theme Collection',
      'zh_Hans': '',
    },
    'pv91g8ca': {
      'en': 'Create themes for use by our users.',
      'zh_Hans': '',
    },
    '46oryrs0': {
      'en': 'Due',
      'zh_Hans': '',
    },
    'eqhasgjm': {
      'en': 'Tuesday, 10:00am',
      'zh_Hans': '',
    },
    '74m1p6ro': {
      'en': 'In Progress',
      'zh_Hans': '',
    },
    '8gkpc5d7': {
      'en': 'Completed',
      'zh_Hans': '',
    },
    'r9ga78e3': {
      'en': 'Completed:',
      'zh_Hans': '',
    },
    '7hmdxzsz': {
      'en': 'Design Template Screens',
      'zh_Hans': '',
    },
    '3vltxof7': {
      'en': 'Create template screen for task todo app.',
      'zh_Hans': '',
    },
    'hn51fy67': {
      'en': 'Due',
      'zh_Hans': '',
    },
    '7xz1cjco': {
      'en': 'Tuesday, 10:00am',
      'zh_Hans': '',
    },
    '4446nja6': {
      'en': 'In Progress',
      'zh_Hans': '',
    },
    'a13vc5sd': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // Clients
  {
    '1ajtchfs': {
      'en': 'Clients',
      'zh_Hans': '',
    },
    'rl39b4o6': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // asabusiness
  {
    'uz4j5do0': {
      'en': 'Business Setup',
      'zh_Hans': '',
    },
    'wl3zygz3': {
      'en': 'Let\'s set up your business',
      'zh_Hans': '',
    },
    'pse8j1cu': {
      'en':
          'Add your business information to get started with your professional account.',
      'zh_Hans': '',
    },
    'gb25vmk1': {
      'en': 'Business Logo',
      'zh_Hans': '',
    },
    '53q9thr1': {
      'en': 'Upload your business logo',
      'zh_Hans': '',
    },
    '1vk9s44h': {
      'en': 'Business Name',
      'zh_Hans': '',
    },
    '2yobo1xd': {
      'en': 'Enter your business name',
      'zh_Hans': '',
    },
    '3x7iak0k': {
      'en': 'Business Address',
      'zh_Hans': '',
    },
    'm270nmd8': {
      'en': 'Enter your business address',
      'zh_Hans': '',
    },
    'tdk5c4lz': {
      'en': 'Tax ID Number',
      'zh_Hans': '',
    },
    'hl70v90e': {
      'en': 'Enter your business tax ID',
      'zh_Hans': '',
    },
    '0v64v8q2': {
      'en': 'Business Name is required',
      'zh_Hans': '',
    },
    'hhmdtg1p': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '4624nowv': {
      'en': 'Business Address is required',
      'zh_Hans': '',
    },
    'i8ukktic': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'djzuj7s0': {
      'en': 'Tax ID Number is required',
      'zh_Hans': '',
    },
    'j0dc1pcb': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '7lt2pufg': {
      'en': 'Your information is secure',
      'zh_Hans': '',
    },
    '3cn8aauf': {
      'en':
          'We use bank-level encryption to protect your business data and comply with all privacy regulations.',
      'zh_Hans': '',
    },
    'o9oc4hu1': {
      'en': 'Continue Setup',
      'zh_Hans': '',
    },
    'rbmwwze0': {
      'en': 'You can update this information later in your account settings.',
      'zh_Hans': '',
    },
  },
  // asafreelance
  {
    'nz0rpda3': {
      'en': 'Freelance Setup',
      'zh_Hans': '',
    },
    'w02hi7p4': {
      'en': 'Let\'s set up your business',
      'zh_Hans': '',
    },
    'j4ib915d': {
      'en':
          'Add your business information to get started with your professional account.',
      'zh_Hans': '',
    },
    'd35f0j30': {
      'en': 'Profile photo or logo',
      'zh_Hans': '',
    },
    '0ddnpfxs': {
      'en': 'Upload your profile photo or logo',
      'zh_Hans': '',
    },
    's70d9g25': {
      'en': 'Display name',
      'zh_Hans': '',
    },
    'l5ez5iqe': {
      'en': 'Enter your business name',
      'zh_Hans': '',
    },
    'tgr7cw3d': {
      'en': 'Email address',
      'zh_Hans': '',
    },
    'v4yiyakk': {
      'en': 'Enter your email address',
      'zh_Hans': '',
    },
    'y1pzt2ml': {
      'en': 'Phone Number',
      'zh_Hans': '',
    },
    'cz87hdko': {
      'en': 'Enter your phone number',
      'zh_Hans': '',
    },
    'eq2xyqsw': {
      'en': 'Tax ID Number Optional',
      'zh_Hans': '',
    },
    '4s2qzar1': {
      'en': 'Enter your business tax ID',
      'zh_Hans': '',
    },
    'pucjpohl': {
      'en': 'Display name is required',
      'zh_Hans': '',
    },
    '048mpgl5': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '04j6pfdu': {
      'en': 'Email address is required',
      'zh_Hans': '',
    },
    '2g15w12y': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'upz6beem': {
      'en': 'Phone Number is required',
      'zh_Hans': '',
    },
    'tosybg10': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '46zrv26v': {
      'en': 'Tax ID Number Optional is required',
      'zh_Hans': '',
    },
    'hdtow9sh': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'awvmuoud': {
      'en': 'Your information is secure',
      'zh_Hans': '',
    },
    '6cmwa4ej': {
      'en':
          'We use bank-level encryption to protect your business data and comply with all privacy regulations.',
      'zh_Hans': '',
    },
    'z3ej6fn7': {
      'en': 'Continue Setup',
      'zh_Hans': '',
    },
    'm4w4wqg4': {
      'en': 'You can update this information later in your account settings.',
      'zh_Hans': '',
    },
  },
  // profile
  {
    'xxia1o99': {
      'en': 'Edit Profile',
      'zh_Hans': '',
    },
    '8icacly2': {
      'en': '__',
      'zh_Hans': '',
    },
  },
  // profileCopy
  {
    'mlp43tpx': {
      'en': 'Edit Profile',
      'zh_Hans': '',
    },
    'mwh2qgur': {
      'en': '__',
      'zh_Hans': '',
    },
  },
  // pickandchooseCopy
  {
    '25e0bdf4': {
      'en': 'Choose Your Account Type',
      'zh_Hans': '',
    },
    'odyd969k': {
      'en':
          'Select how you\'ll be generating invoices to get started with the right setup for your needs.',
      'zh_Hans': '',
    },
    'aj6an5qu': {
      'en': 'Business',
      'zh_Hans': '',
    },
    '3zmh4ugb': {
      'en':
          'Generate invoices as a registered business with company details and tax information.',
      'zh_Hans': '',
    },
    'f14i3l4i': {
      'en': 'Individual Freelancer',
      'zh_Hans': '',
    },
    'ck0xqbc1': {
      'en':
          'Generate invoices as an independent contractor or freelancer with personal details.',
      'zh_Hans': '',
    },
  },
  // invoicepagE
  {
    '4hqbwdyr': {
      'en': 'Recent Invoices',
      'zh_Hans': '',
    },
    'w1uhwcx2': {
      'en': 'All',
      'zh_Hans': '',
    },
    'l3wq2xpx': {
      'en': 'PAID',
      'zh_Hans': '',
    },
    'jt6bt1mo': {
      'en': 'UNPAID',
      'zh_Hans': '',
    },
    'thkv354n': {
      'en': 'PAID',
      'zh_Hans': '',
    },
    'jtyfkvw3': {
      'en': 'UNPAID',
      'zh_Hans': '',
    },
    'kqgqr1hh': {
      'en': '\$2,450.00',
      'zh_Hans': '',
    },
  },
  // invoicepagecreate
  {
    'f7zpsn7g': {
      'en': 'Create Invoice',
      'zh_Hans': '',
    },
    'ov08pxmm': {
      'en': 'Select Client',
      'zh_Hans': '',
    },
    'w2y0v7k9': {
      'en': 'Acme Corporation',
      'zh_Hans': '',
    },
    '6xhyg2zq': {
      'en': 'TechStart Solutions',
      'zh_Hans': '',
    },
    'hp85fizo': {
      'en': 'Global Industries',
      'zh_Hans': '',
    },
    '7v1iveeb': {
      'en': 'Creative Agency Ltd',
      'zh_Hans': '',
    },
    '614zx0y3': {
      'en': 'Invoice Items',
      'zh_Hans': '',
    },
    '4j0smzl1': {
      'en': 'Description',
      'zh_Hans': '',
    },
    'sa3f5ut8': {
      'en': 'Quantity',
      'zh_Hans': '',
    },
    'wtnq3sgz': {
      'en': 'Rate',
      'zh_Hans': '',
    },
    'rz7tprlq': {
      'en': 'Amount',
      'zh_Hans': '',
    },
    '9s8n0nqu': {
      'en': 'Notes Optional',
      'zh_Hans': '',
    },
    'k85n1m19': {
      'en': 'Notes',
      'zh_Hans': '',
    },
    'fbz0n17w': {
      'en': 'Total Amount:',
      'zh_Hans': '',
    },
    '8al4nr09': {
      'en': 'Create invoice',
      'zh_Hans': '',
    },
  },
  // invoicepagecreateFL
  {
    'uhx925u4': {
      'en': 'Create Invoice',
      'zh_Hans': '',
    },
    'bywneu9d': {
      'en': 'Select Client',
      'zh_Hans': '',
    },
    '2h13edhw': {
      'en': 'Acme Corporation',
      'zh_Hans': '',
    },
    'x6xywayj': {
      'en': 'TechStart Solutions',
      'zh_Hans': '',
    },
    'f1abb8au': {
      'en': 'Global Industries',
      'zh_Hans': '',
    },
    '87z5x9sm': {
      'en': 'Creative Agency Ltd',
      'zh_Hans': '',
    },
    '8pnbe7v7': {
      'en': 'Invoice Items',
      'zh_Hans': '',
    },
    'twawjqxw': {
      'en': 'Description',
      'zh_Hans': '',
    },
    'lkabjvxk': {
      'en': 'Quantity',
      'zh_Hans': '',
    },
    'npe0n7i7': {
      'en': 'Rate',
      'zh_Hans': '',
    },
    'hb9qti8z': {
      'en': 'Amount',
      'zh_Hans': '',
    },
    'i5ggq50v': {
      'en': 'Notes Optional',
      'zh_Hans': '',
    },
    'msxg74ce': {
      'en': 'Notes',
      'zh_Hans': '',
    },
    'gmdv81o0': {
      'en': 'Total Amount:',
      'zh_Hans': '',
    },
    'j0ep0qu3': {
      'en': 'Create invoice',
      'zh_Hans': '',
    },
  },
  // invoicedetailsFL
  {
    '60chg41r': {
      'en': 'Invoice Date',
      'zh_Hans': '',
    },
    'kix5566x': {
      'en': 'Due Date',
      'zh_Hans': '',
    },
    'fn6vx77p': {
      'en': 'Client Details',
      'zh_Hans': '',
    },
    'f1aa8vx4': {
      'en': 'Invoice Items',
      'zh_Hans': '',
    },
    '5jehyy2p': {
      'en': 'Description:',
      'zh_Hans': '',
    },
    'f474eqs1': {
      'en': 'Rate:',
      'zh_Hans': '',
    },
    'oa2mzi99': {
      'en': 'Qty:',
      'zh_Hans': '',
    },
    'rxcu2498': {
      'en': 'Amount: ',
      'zh_Hans': '',
    },
    'ckmodl5m': {
      'en': 'Generate Invoice',
      'zh_Hans': '',
    },
    'a2x9ibkx': {
      'en': 'Total Amount :',
      'zh_Hans': '',
    },
  },
  // invoicepageFL
  {
    'otsk0glj': {
      'en': 'Recent Invoices',
      'zh_Hans': '',
    },
    'frlgww5k': {
      'en': 'All',
      'zh_Hans': '',
    },
    'hgby6ez3': {
      'en': 'PAID',
      'zh_Hans': '',
    },
    'mk7jof8x': {
      'en': 'UNPAID',
      'zh_Hans': '',
    },
    'thzmsr1n': {
      'en': 'PAID',
      'zh_Hans': '',
    },
    'mh70djr0': {
      'en': 'UNPAID',
      'zh_Hans': '',
    },
    '7dso1oyq': {
      'en': '\$2,450.00',
      'zh_Hans': '',
    },
  },
  // ClientsFL
  {
    '9900mv80': {
      'en': 'Clients',
      'zh_Hans': '',
    },
    'kzme4etc': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // recordingpageCopy
  {
    'jofbs1x7': {
      'en': 'Voice Recording',
      'zh_Hans': '录音',
    },
    '32412b29': {
      'en': 'Tap to start recording',
      'zh_Hans': '点击开始录音',
    },
    'g1p68kdr': {
      'en': 'Title',
      'zh_Hans': '标题',
    },
    's9uh9ikz': {
      'en': 'Voice recording title',
      'zh_Hans': '录音标题',
    },
    'lq2hoj30': {
      'en': 'Save recording',
      'zh_Hans': '保存录音',
    },
  },
  // invoicedetailsCopy
  {
    'jee4j1gp': {
      'en': 'Invoice Date',
      'zh_Hans': '',
    },
    'gt5le8if': {
      'en': 'Due Date',
      'zh_Hans': '',
    },
    'jesrzthl': {
      'en': 'Client Details',
      'zh_Hans': '',
    },
    'vewv1zw3': {
      'en': 'Invoice Items',
      'zh_Hans': '',
    },
    '1wz9il27': {
      'en': 'Description:',
      'zh_Hans': '',
    },
    'o3rl1te9': {
      'en': 'Rate:',
      'zh_Hans': '',
    },
    '69aujwve': {
      'en': 'Qty:',
      'zh_Hans': '',
    },
    'rhmoyagy': {
      'en': 'Amount: ',
      'zh_Hans': '',
    },
    'qg389sf0': {
      'en': 'Generate Invoice',
      'zh_Hans': '',
    },
    'x1ucvf6g': {
      'en': 'Paid',
      'zh_Hans': '',
    },
    '3l36zmhl': {
      'en': 'Total Amount :',
      'zh_Hans': '',
    },
  },
  // SubscriptionPayment
  {
    '4sf1ar2u': {
      'en': 'Subscription / Payment',
      'zh_Hans': '',
    },
    '53a7b90q': {
      'en': 'Please use your SaneDesk email on checkout',
      'zh_Hans': '',
    },
    'jz474zw6': {
      'en': 'Monthly',
      'zh_Hans': '',
    },
    'smp2fanx': {
      'en': '\$7.99/mo',
      'zh_Hans': '',
    },
    'psi9gfnf': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'zh_Hans': '',
    },
    'i9lq6oly': {
      'en': 'Other Offers',
      'zh_Hans': '',
    },
    'r7dx5858': {
      'en': 'Annual ( save \$32)',
      'zh_Hans': '',
    },
    '6x5pxmwy': {
      'en': '\$72/yr',
      'zh_Hans': '',
    },
    'w228st7i': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'zh_Hans': '',
    },
    'bu2fbm5x': {
      'en': 'Free Limited Access',
      'zh_Hans': '',
    },
    '4jbu8y8t': {
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'zh_Hans': '',
    },
    'rf5fxjno': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // wait
  {
    'ox4gavwb': {
      'en': 'Checkout',
      'zh_Hans': '',
    },
    'rkp0xko2': {
      'en': 'Processing Payment',
      'zh_Hans': '',
    },
    '5munzfpj': {
      'en': 'Please wait while we securely\nprocess your transaction.',
      'zh_Hans': '',
    },
    'xhi39ihm': {
      'en': 'Amount',
      'zh_Hans': '',
    },
    'zfslaq7r': {
      'en': '\$7.99',
      'zh_Hans': '',
    },
    'gs5ylhzj': {
      'en': 'Your payment is encrypted and secured with 256-bit SSL.',
      'zh_Hans': '',
    },
    'nq397lxd': {
      'en': 'I\'ve completed my payment',
      'zh_Hans': '',
    },
  },
  // wait2
  {
    'klkgc19q': {
      'en': 'Checkout',
      'zh_Hans': '',
    },
    'hoofvff4': {
      'en': 'Processing Payment',
      'zh_Hans': '',
    },
    'm7ridvcz': {
      'en': 'Please wait while we securely\nprocess your transaction.',
      'zh_Hans': '',
    },
    'wwsntn8p': {
      'en': 'Amount',
      'zh_Hans': '',
    },
    'vjtpywbm': {
      'en': '\$72',
      'zh_Hans': '',
    },
    'kcqdooos': {
      'en': 'Your payment is encrypted and secured with 256-bit SSL.',
      'zh_Hans': '',
    },
    '8wjtd8n7': {
      'en': 'I\'ve completed my payment',
      'zh_Hans': '',
    },
  },
  // Auth3Copy
  {
    'pudt452p': {
      'en': 'SaneDesk',
      'zh_Hans': '',
    },
    'rjc0aj2t': {
      'en': 'Username',
      'zh_Hans': '',
    },
    'i3n3blvp': {
      'en': 'Get Started',
      'zh_Hans': '',
    },
    'firj6cez': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // listisempt
  {
    'z9jh7ygw': {
      'en': 'No Events Yet',
      'zh_Hans': '暂无活动',
    },
    'bwp825w8': {
      'en':
          'Your event list is empty. Add your first event to get started and stay organized.',
      'zh_Hans': '您的活动列表为空。请添加您的第一个活动，以便开始并保持井然有序。',
    },
  },
  // howareyoufeeling
  {
    '0x2p5fmr': {
      'en': 'How are you feeling today?',
      'zh_Hans': '你今天感觉怎么样？',
    },
    'kp6w82or': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'zet7t03y': {
      'en': 'Very Bad',
      'zh_Hans': '非常糟糕',
    },
    'phwlg2cr': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    '6for2ncf': {
      'en': 'Bad',
      'zh_Hans': '坏的',
    },
    '7eei8snj': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    '3qj39310': {
      'en': 'Okay',
      'zh_Hans': '好的',
    },
    'n9r3g9vv': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'uj0v56g6': {
      'en': 'Good',
      'zh_Hans': '好的',
    },
    'a8q4nzi8': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'v2n623x7': {
      'en': 'Great',
      'zh_Hans': '伟大的',
    },
  },
  // journalisempty
  {
    '8mdzvbp6': {
      'en': 'No journal entries  yet ',
      'zh_Hans': '尚无日记条目',
    },
    '56439bij': {
      'en':
          'Your journal list is empty. Spill your thoughts, get started and stay organized.',
      'zh_Hans': '你的日记清单是空的。尽情畅所欲言，开始记录，保持井然有序。',
    },
  },
  // journalisemptyCopy
  {
    'aeh8u7wu': {
      'en': 'Select of a mood ',
      'zh_Hans': '选择一种心情',
    },
    'aqt6duvz': {
      'en': 'Keep track on how you felt at certain times ',
      'zh_Hans': '记录你在某些时刻的感受',
    },
  },
  // NOMILESTONE
  {
    '6u1jm5i9': {
      'en': 'No Milestones Yet',
      'zh_Hans': '尚无里程碑',
    },
    'jq394ust': {
      'en':
          'Start your journey by creating your first milestone and track your progress along the way.',
      'zh_Hans': '通过创建您的第一个里程碑来开始您的旅程并跟踪您的进度。',
    },
  },
  // noTask
  {
    '98fuehh3': {
      'en': 'No Tasks Yet',
      'zh_Hans': '尚无任务',
    },
    '765dh02r': {
      'en':
          'Begin your journey by creating your first Task and tracking your progress along the way.',
      'zh_Hans': '通过创建您的第一个任务并跟踪您的进度来开始您的旅程。',
    },
  },
  // NoclientsYet
  {
    'jcpev4ff': {
      'en': 'No Clients Yet',
      'zh_Hans': '暂无客户',
    },
    'j1h3levg': {
      'en':
          'Start your journey by entering your project while tracking your progress along the way.',
      'zh_Hans': '通过输入您的项目来开始您的旅程，同时跟踪您的进度。',
    },
  },
  // NOMILESTONECopyCopy
  {
    'hxuztnef': {
      'en': 'No Projects Yet',
      'zh_Hans': '暂无项目',
    },
  },
  // norecording
  {
    'aes92la6': {
      'en': 'No recordings yet',
      'zh_Hans': '尚无录音',
    },
    'vfccrvg0': {
      'en': 'Tap the recording button to spill your thoughts.',
      'zh_Hans': '点击录音按钮来倾诉您的想法。',
    },
  },
  // listisemptCopy
  {
    'kshiq57l': {
      'en': 'No Events Yet',
      'zh_Hans': '暂无活动',
    },
  },
  // checkin
  {
    '68bos8um': {
      'en': 'Daily check in !',
      'zh_Hans': '你今天感觉怎么样？',
    },
    'zpbu4615': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'jjg9tt3b': {
      'en': 'Very Bad',
      'zh_Hans': '非常糟糕',
    },
    'm123jmf4': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'w76ub7os': {
      'en': 'Bad',
      'zh_Hans': '坏的',
    },
    'jyrkpi7n': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    '4qab8dbi': {
      'en': 'Okay',
      'zh_Hans': '好的',
    },
    '80hs9ire': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'rl6sb81z': {
      'en': 'Good',
      'zh_Hans': '好的',
    },
    'nf3zzuhd': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'fa13x45j': {
      'en': 'Great',
      'zh_Hans': '伟大的',
    },
  },
  // NOMILESTONECopy
  {
    'y4vqlav1': {
      'en': 'No projects yet',
      'zh_Hans': '尚无里程碑',
    },
  },
  // createclientbusiness
  {
    'pj0fufdt': {
      'en': 'Client Details',
      'zh_Hans': '',
    },
    '28napl4p': {
      'en': 'Business Name ',
      'zh_Hans': '',
    },
    'tgp10cam': {
      'en': 'Enter business name',
      'zh_Hans': '',
    },
    'vuf0jt8r': {
      'en': 'Client Name',
      'zh_Hans': '',
    },
    'xuds7g1h': {
      'en': 'Enter client full name',
      'zh_Hans': '',
    },
    '5v2aha7h': {
      'en': 'Client Address',
      'zh_Hans': '',
    },
    '5itgcy0z': {
      'en': 'Enter complete address',
      'zh_Hans': '',
    },
    '6haofo3w': {
      'en': 'Tax Number Optional',
      'zh_Hans': '',
    },
    '3i0zprer': {
      'en': 'Enter tax identification number',
      'zh_Hans': '',
    },
    '65bvc26z': {
      'en': 'Enter business name is required',
      'zh_Hans': '',
    },
    'qdf1p4nr': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '1k1infmf': {
      'en': 'Enter client full name is required',
      'zh_Hans': '',
    },
    '059l1i7t': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'bksr3sv2': {
      'en': 'Enter complete address is required',
      'zh_Hans': '',
    },
    'zclhwlkd': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'fltxa4z1': {
      'en': 'Enter tax identification number is required',
      'zh_Hans': '',
    },
    'cpkjp78o': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '4m7j5fqn': {
      'en': 'Save Client',
      'zh_Hans': '',
    },
  },
  // noclients
  {
    'v5rf51rr': {
      'en': 'No Clients Yet',
      'zh_Hans': '',
    },
    '1kx6lvwm': {
      'en':
          'Your client list is empty. Start by adding your first client to get organized.',
      'zh_Hans': '',
    },
  },
  // noinvoices
  {
    '1t4p5pr9': {
      'en': 'No Invoices Yet',
      'zh_Hans': '',
    },
    'ka6z6mvf': {
      'en':
          'Create your first invoice to get started with billing and payments',
      'zh_Hans': '',
    },
  },
  // noinvoiceitems
  {
    'qocxbd6x': {
      'en': 'No Invoice Items',
      'zh_Hans': '',
    },
    'llcs6ob0': {
      'en':
          'You haven\'t added any items to this invoice yet. Start by adding your first item to get started.',
      'zh_Hans': '',
    },
  },
  // createinvoice2
  {
    'w6qmeg0l': {
      'en': 'Add Invoice Item',
      'zh_Hans': '',
    },
    'dx682a45': {
      'en': 'Description',
      'zh_Hans': '',
    },
    '334egub2': {
      'en': 'Description',
      'zh_Hans': '',
    },
    'qzmt4y9k': {
      'en': 'Quantity',
      'zh_Hans': '',
    },
    'tpqpcpbc': {
      'en': '\$0.00',
      'zh_Hans': '',
    },
    'nzgebf7p': {
      'en': 'Rate',
      'zh_Hans': '',
    },
    '3g9bk1j4': {
      'en': '\$0.00',
      'zh_Hans': '',
    },
    'yhin6yhy': {
      'en': 'Enter business name is required',
      'zh_Hans': '',
    },
    '0hqug83h': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'mwwuso6n': {
      'en': 'Enter client full name is required',
      'zh_Hans': '',
    },
    'cne3wqdx': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '8xwvq4jz': {
      'en': 'Enter complete address is required',
      'zh_Hans': '',
    },
    'k5qxykh8': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    '3won00tv': {
      'en': 'Enter tax identification number is required',
      'zh_Hans': '',
    },
    'p17zpruj': {
      'en': 'Please choose an option from the dropdown',
      'zh_Hans': '',
    },
    'cet3v7rm': {
      'en': 'Save Client',
      'zh_Hans': '',
    },
  },
  // subscription
  {
    'lkos7qci': {
      'en': 'Subscription / Payment',
      'zh_Hans': '',
    },
    '2udhsd6t': {
      'en': 'Please use your SaneDesk email on checkout',
      'zh_Hans': '',
    },
    'vfkztqkj': {
      'en': 'Monthly',
      'zh_Hans': '',
    },
    '2qasvytq': {
      'en': '\$7.99/mo',
      'zh_Hans': '',
    },
    'bc16sibu': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'zh_Hans': '',
    },
    'f8xl7c47': {
      'en': 'Other Offers',
      'zh_Hans': '',
    },
    'gkq3e51l': {
      'en': 'Annual ( save \$32)',
      'zh_Hans': '',
    },
    'wmvu8ij0': {
      'en': '\$72/yr',
      'zh_Hans': '',
    },
    '1b5me8y4': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'njvf45w4': {
      'en': 'Button',
      'zh_Hans': '按钮',
    },
    'aagtg560': {
      'en':
          'SaneDesk uses the microphone to allow you to record voice journals and project notes directly into your workspace.\n',
      'zh_Hans': '允许麦克风',
    },
    'lbjgxnvp': {
      'en': '',
      'zh_Hans': '',
    },
    'trf5zlmk': {
      'en': 'I',
      'zh_Hans': '',
    },
    'i6x2db73': {
      'en': 'Allow microphone',
      'zh_Hans': '允许麦克风',
    },
    'huezmus8': {
      'en': 'allow notification from SaneDesk to be updated on your progress',
      'zh_Hans': '',
    },
    'dxdj3dse': {
      'en': '',
      'zh_Hans': '',
    },
    'u77cnbqj': {
      'en': '',
      'zh_Hans': '',
    },
    'nqbeo9j1': {
      'en': '',
      'zh_Hans': '',
    },
    '1rn5i7fc': {
      'en': '',
      'zh_Hans': '',
    },
    '9fa47pql': {
      'en': '',
      'zh_Hans': '',
    },
    '4gu3vvux': {
      'en': '',
      'zh_Hans': '',
    },
    'ioe21kvv': {
      'en': '',
      'zh_Hans': '',
    },
    '2ibtrrr9': {
      'en': '',
      'zh_Hans': '',
    },
    '4o3o16ih': {
      'en': '',
      'zh_Hans': '',
    },
    'u4lyhvs4': {
      'en': '',
      'zh_Hans': '',
    },
    '0kd9pzy9': {
      'en': '',
      'zh_Hans': '',
    },
    '0ub8gya3': {
      'en': '',
      'zh_Hans': '',
    },
    's7soro4v': {
      'en': '',
      'zh_Hans': '',
    },
    'essxdoav': {
      'en': '',
      'zh_Hans': '',
    },
    '7k6f9lxy': {
      'en': '',
      'zh_Hans': '',
    },
    'o8s40zel': {
      'en': '',
      'zh_Hans': '',
    },
    '66y5p1pt': {
      'en': '',
      'zh_Hans': '',
    },
    '9h719s1b': {
      'en': '',
      'zh_Hans': '',
    },
    'im7g1qqw': {
      'en': '',
      'zh_Hans': '',
    },
    '6f126c7x': {
      'en': '',
      'zh_Hans': '',
    },
    '9wsls3wf': {
      'en': '',
      'zh_Hans': '',
    },
    'zfule0b7': {
      'en': '',
      'zh_Hans': '',
    },
    'emy6tiii': {
      'en': '',
      'zh_Hans': '',
    },
    'rlmnn7k1': {
      'en': '',
      'zh_Hans': '',
    },
    'hep9jx77': {
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
