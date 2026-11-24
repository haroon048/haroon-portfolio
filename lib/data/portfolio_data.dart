import 'package:flutter/material.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/model/project_model.dart';
import 'package:haroon_portfolio/model/service_model.dart';
import 'package:haroon_portfolio/model/skill_model.dart';
import 'package:haroon_portfolio/model/timeline_model.dart';

class PortfolioData {
  static const List<String> roles = <String>[
    'Flutter Developer',
    'Firebase Developer',
    'Mobile App Developer',
  ];

  static const List<String> navItems = <String>[
    'home',
    'apps',
    'backend',
    'ui',
    'bugs',
    'story',
    'contact',
  ];

  static const Map<String, String> navLabels = <String, String>{
    'home': 'Home',
    'apps': 'Flutter App Development',
    'backend': 'Firebase & Backend',
    'ui': 'UI Design',
    'bugs': 'Bug Fixing',
    'story': 'My Story',
    'contact': 'Contact',
  };

  static const Map<String, String> navShortLabels = <String, String>{
    'home': 'Home',
    'apps': 'Flutter Apps',
    'backend': 'Firebase',
    'ui': 'UI',
    'bugs': 'Bugs',
    'story': 'Story',
    'contact': 'Contact',
  };

  static final List<ServiceModel> services = <ServiceModel>[
    ServiceModel(
      key: 'backend',
      navLabel: 'Firebase & Backend',
      doorLabel: 'Firebase & Backend',
      title: 'Firebase & Backend',
      description:
          'Real backends, not demos. Authentication, Firestore data, file uploads and push notifications — wired up properly and tested on real devices.',
      bullets: const <String>[
        'Firebase Auth — email sign-in that just works',
        'Cloud Firestore — live data that syncs instantly',
        'Cloudinary uploads — fast image delivery',
        'Push notifications with FCM',
        'Admin panels with real data',
      ],
      tags: const <String>[
        'Firebase Auth',
        'Cloud Firestore',
        'Cloudinary Uploads',
        'REST APIs',
        'Push Notifications (FCM)',
        'Realtime Chat',
        'Admin Panels',
      ],
      doorGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.blueLight,
          AppColors.blue,
          AppColors.blueDark,
        ],
      ),
      doorTextColor: Colors.white,
      iconLetter: 'Fb',
    ),
    ServiceModel(
      key: 'apps',
      navLabel: 'Flutter App Development',
      doorLabel: 'App Development',
      title: 'Flutter App Development',
      description:
          'Complete Flutter apps from the first screen to the Play Store build — clean Provider architecture, responsive layouts down to 320px, and every button tested on a real device.',
      bullets: const <String>[
        'Clean Provider architecture — one class per file',
        'Responsive layouts that work on every phone',
        'Real Firebase backend, no mock data',
        'Tested on a real device before delivery',
      ],
      tags: const <String>[
        'ShopNest',
        'LUXORA',
        'TomatoDoc AI · 93.4%',
        'FieldProof',
        'Expense Tracker',
      ],
      doorGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xFF232323),
          AppColors.doorBlack,
          Color(0xFF000000),
        ],
      ),
      doorTextColor: Colors.white,
      iconLetter: 'Fl',
    ),
    ServiceModel(
      key: 'ui',
      navLabel: 'UI Design',
      doorLabel: 'UI Design',
      title: 'UI Design',
      description:
          'Designs turned into pixel-faithful Flutter screens — custom themes, smooth animations and clean typography, exactly as designed.',
      bullets: const <String>[
        'Design-to-Flutter, pixel-faithful',
        'Custom themes and colour systems',
        'Responsive down to 320px wide',
        'Smooth animations that feel premium',
        'Clean, readable typography',
      ],
      tags: const <String>[
        'Design-to-Flutter',
        'Custom Themes',
        'Responsive to 320px',
        'Smooth Animations',
        'Clean Typography',
      ],
      doorGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.mintLight,
          AppColors.mint,
          AppColors.mintDark,
        ],
      ),
      doorTextColor: Color(0xFF1E3A1C),
      iconLetter: 'Ui',
    ),
    ServiceModel(
      key: 'bugs',
      navLabel: 'Bug Fixing',
      doorLabel: 'Bug Fixing',
      title: 'Bug Fixing',
      description:
          'I reproduce the bug first, find the real cause, fix it, and re-test on a real device. No quick patches that break something else.',
      bullets: const <String>[
        'Reproduce the bug before touching code',
        'Fix the cause, not the symptom',
        'flutter analyze clean — zero issues left',
        'Verified on a real device after the fix',
      ],
      tags: const <String>[
        'Crash Fixes',
        'Overflow Fixes',
        'State Bugs',
        'API Errors',
        'Build Errors',
      ],
      doorGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.orangeLight,
          AppColors.orange,
          AppColors.orangeDark,
        ],
      ),
      doorTextColor: Colors.white,
      iconLetter: 'Fx',
    ),
  ];

  static const List<ProjectModel> projects = <ProjectModel>[
    ProjectModel(
      initial: 'S',
      initialColor: AppColors.blue,
      category: 'E-Commerce',
      title: 'ShopNest',
      description:
          'A complete e-commerce app where every seller runs their own store — product listings, cart, orders and WhatsApp-style chat between buyers and sellers, with a live admin panel.',
      tags: <String>['Flutter', 'Provider', 'Firebase', 'Chat'],
      imageAsset: 'assets/images/shopnest_home.jpg',
      imageFit: BoxFit.cover,
    ),
    ProjectModel(
      initial: 'L',
      initialColor: Color(0xFF161616),
      category: 'Premium E-Commerce',
      title: 'LUXORA',
      description:
          'My own premium e-commerce app with a black-and-gold luxury theme — home, categories, wishlist, cart and sign-in, built to feel like a high-end store.',
      tags: <String>['E-commerce', 'Luxury UI', 'Wishlist', 'Cart'],
      imageAsset: 'assets/images/luxora_home.jpg',
      imageFit: BoxFit.cover,
    ),
    ProjectModel(
      initial: 'T',
      initialColor: AppColors.tomatoGreen,
      category: 'AI · Final-Year Project',
      title: 'TomatoDoc AI',
      description:
          'AI tomato-leaf disease detection — MobileNetV2 trained on 18,159 images across 10 classes, 93.4% test accuracy, running fully offline with TensorFlow Lite.',
      tags: <String>['Flutter', 'TFLite · MobileNetV2', '93.4% Accuracy'],
      imageAsset: 'assets/images/tomatodoc_cover.jpg',
      imageFit: BoxFit.contain,
    ),
    ProjectModel(
      initial: 'F',
      initialColor: AppColors.orange,
      category: 'Field Operations',
      title: 'FieldProof',
      description:
          'A worker field-job app — assigned jobs, before/after photo proof, checklists, manager approval and WhatsApp-style chat, with real Firebase data and Cloudinary uploads.',
      tags: <String>['Flutter', 'Provider', 'Firebase', 'Cloudinary'],
      imageAsset: 'assets/images/fieldproof_home.jpg',
      imageFit: BoxFit.cover,
    ),
    ProjectModel(
      initial: 'E',
      initialColor: AppColors.gold,
      category: 'Personal Finance',
      title: 'Expense Tracker',
      description:
          'A personal finance app — track spending, set budgets, see where the money goes, with clean reports and a dark navy and orange design.',
      tags: <String>['Flutter', 'Provider', 'Firebase'],
      imageAsset: 'assets/images/expense_home.png',
      imageFit: BoxFit.cover,
    ),
  ];

  static const List<SkillModel> skills = <SkillModel>[
    SkillModel(
      name: 'Flutter',
      level: 'Expert',
      levelValue: 0.92,
      detail: 'Widgets, navigation, animations',
    ),
    SkillModel(
      name: 'Dart',
      level: 'Expert',
      levelValue: 0.90,
      detail: 'Clean, readable code',
    ),
    SkillModel(
      name: 'Provider',
      level: 'Advanced',
      levelValue: 0.88,
      detail: 'State management, app-wide',
    ),
    SkillModel(
      name: 'Firebase',
      level: 'Advanced',
      levelValue: 0.87,
      detail: 'Auth, Firestore, FCM',
    ),
    SkillModel(
      name: 'REST APIs',
      level: 'Advanced',
      levelValue: 0.85,
      detail: 'Integration & error handling',
    ),
    SkillModel(
      name: 'Cloudinary',
      level: 'Proficient',
      levelValue: 0.80,
      detail: 'Image upload & delivery',
    ),
    SkillModel(
      name: 'Git & GitHub',
      level: 'Proficient',
      levelValue: 0.82,
      detail: 'Version control & workflow',
    ),
  ];

  static const List<TimelineModel> timeline = <TimelineModel>[
    TimelineModel(
      date: '2023',
      label: 'Education',
      title: 'Started BS Computer Science at KFUEIT',
      body:
          'Joined KFUEIT in Rahim Yar Khan and set my direction early: mobile app development.',
      icon: Icons.school,
    ),
    TimelineModel(
      date: '2024 — 2025',
      label: 'Flutter',
      title: 'Built my Flutter foundation',
      body:
          'Learned Flutter and Dart properly — widgets, Provider, Firebase and REST APIs — by building complete, working apps.',
      icon: Icons.phone_android,
    ),
    TimelineModel(
      date: 'OCT 2026',
      label: 'Internship',
      title: 'Flutter Intern at Dot Sinc',
      body:
          'Started my internship at Dot Sinc, Rahim Yar Khan, working on real client apps and shipping backend features.',
      icon: Icons.work,
    ),
    TimelineModel(
      date: 'JAN 2027',
      label: 'Graduation',
      title: 'Graduation',
      body:
          'Graduating with my BS Computer Science degree — and ready for full-time Flutter work.',
      icon: Icons.emoji_events,
    ),
  ];

  static const List<String> projectTypes = <String>[
    'Flutter App Development',
    'Firebase & Backend',
    'UI Design',
    'Bug Fixing',
    'Something else',
  ];
}
