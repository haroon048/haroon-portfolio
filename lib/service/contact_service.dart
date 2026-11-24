import 'package:url_launcher/url_launcher.dart';

class ContactService {
  static const String _whatsAppNumber = '923058826049';
  static const String _email = 'haroonshahid685@gmail.com';

  static Future<bool> openWhatsApp([String? message]) async {
    final String text = message ??
        'Hi Muhammad Haroon, I saw your portfolio and want to discuss a project.';
    final Uri uri = Uri.parse(
      'https://wa.me/$_whatsAppNumber?text=${Uri.encodeComponent(text)}',
    );
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<bool> openEmail({
    String subject = 'Project Enquiry — Portfolio',
    String body = '',
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: _email,
      queryParameters: <String, String>{
        'subject': subject,
        'body': body,
      },
    );
    return launchUrl(uri);
  }

  static Future<bool> openWhatsAppMessage({
    required String name,
    required String contact,
    required String projectType,
    required String message,
  }) async {
    final String body =
        'Hi Muhammad Haroon, I saw your portfolio and want to discuss a project.\n\nName: $name\nContact: $contact\nProject type: $projectType\nMessage: $message';
    return openWhatsApp(body);
  }

  static Future<bool> openEmailMessage({
    required String name,
    required String contact,
    required String projectType,
    required String message,
  }) async {
    final String body =
        'Hi Muhammad Haroon,\n\nName: $name\nContact: $contact\nProject type: $projectType\nMessage: $message';
    return openEmail(
      subject: 'Project Enquiry — $projectType',
      body: body,
    );
  }

  static Future<bool> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<bool> viewCv() async {
    final Uri uri = Uri.parse('assets/docs/Muhammad_Haroon_CV.pdf');
    return launchUrl(uri, webOnlyWindowName: '_blank');
  }
}
