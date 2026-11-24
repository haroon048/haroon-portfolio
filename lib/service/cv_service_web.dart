import 'package:web/web.dart' as web;

class CvService {
  static void downloadCv() {
    final web.HTMLAnchorElement anchor = web.HTMLAnchorElement();
    anchor.href = 'assets/docs/Muhammad_Haroon_CV.pdf';
    anchor.download = 'Muhammad_Haroon_CV.pdf';
    anchor.click();
  }
}
