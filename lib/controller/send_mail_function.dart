import 'package:url_launcher/url_launcher.dart';

class EcommerceSendMail {
  static sendMail(
      {required String toEmail,
      required String subject,
      required String body}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: Uri.encodeFull('subject=$subject&body=$body'),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}

// void _launchEmail(
//     {required String toEmail,
//     required String subject,
//     required String body}) async {
//   final Uri emailUri = Uri(
//     scheme: 'mailto',
//     path: toEmail,
//     query: Uri.encodeFull('subject=$subject&body=$body'),
//   );

//   if (await canLaunch(emailUri.toString())) {
//     await launch(emailUri.toString());
//   } else {
//     throw 'Could not launch $emailUri';
//   }
// }
