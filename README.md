# Muhammad Haroon — Portfolio (Flutter Web)

Personal portfolio website for Muhammad Haroon, Flutter Developer from
Sadiqabad, Pakistan. This is the Flutter version of the approved web design
(cream light theme / dark teal theme, glass nav, 4 doors, 5 stacked project
cards, 7 skills, 2026 timeline, WhatsApp-first contact).

## Run

```bash
flutter pub get
flutter run -d chrome
```

Stop the app and run it fresh after any provider change — hot reload does
not pick up a new provider.

## Build for the web

```bash
flutter build web --release
```

## Deploy

Firebase project: `haroon-portfolio-99698` (Spark plan, created 2026-11-24).
`lib/firebase_options.dart` is wired to that project — do NOT use
`sparkplate-de8be`, that is sir's project.

1. In the Firebase console, create the Firestore database first
   (Build > Firestore Database > Create database, production mode).
   Without it, the contact form cannot save messages.
2. On your PC, log in once:

```bash
firebase login
```

3. Deploy hosting and the Firestore rules:

```bash
flutter build web --release
firebase deploy --only hosting,firestore:rules
```

Check messages in the Firebase console: Firestore Database >
`contact_messages` collection. The contact form also keeps working
through WhatsApp and email if Firestore is unreachable.

## Contact

- WhatsApp: +92 305 8826049 (https://wa.me/923058826049)
- Email: haroonshahid685@gmail.com
- GitHub: https://github.com/haroon048
- LinkedIn: https://www.linkedin.com/in/haroon-shahid-flutter/
- Contra: https://contra.com/haroon_shahid_ky5d26q1

## Notes

- Firebase is wired in: the app initialises Firebase on startup and
  the contact form saves to the `contact_messages` collection in
  Firestore. If Firebase cannot initialise, the site still loads and
  contact keeps working through WhatsApp and email only.
- The CV in `assets/docs/Muhammad_Haroon_CV.pdf` is Haroon's real CV.
- Project screenshots in `assets/images/` are his real app screenshots.
- Sparkplate, NoteNest, PrepMateAI and SehatConnect are deliberately not
  included.
