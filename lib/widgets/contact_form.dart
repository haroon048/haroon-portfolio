import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/service/contact_messages_service.dart';
import 'package:haroon_portfolio/service/contact_service.dart';
import 'package:haroon_portfolio/service/firebase_setup.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key, required this.isDark});

  final bool isDark;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String _projectType = PortfolioData.projectTypes.first;
  bool _sending = false;
  String _statusMessage = '';
  bool _statusIsError = false;

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  bool get _isValid {
    return _nameController.text.trim().isNotEmpty &&
        _contactController.text.trim().isNotEmpty &&
        _messageController.text.trim().isNotEmpty;
  }

  void _showNeedFields() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill your name, contact and message first.'),
      ),
    );
  }

  Future<bool> _saveToFirestore() async {
    if (!FirebaseSetup.isReady) {
      return false;
    }
    try {
      await ContactMessagesService.saveMessage(
        name: _nameController.text.trim(),
        contact: _contactController.text.trim(),
        projectType: _projectType,
        message: _messageController.text.trim(),
      );
      return true;
    } catch (e) {
      debugPrint('Saving contact message failed: $e');
      return false;
    }
  }

  void _setStatus(String message, bool isError) {
    if (mounted) {
      setState(() {
        _statusMessage = message;
        _statusIsError = isError;
      });
    }
  }

  Future<void> _sendWhatsApp() async {
    if (!_isValid) {
      _showNeedFields();
      return;
    }
    setState(() => _sending = true);
    final bool saved = await _saveToFirestore();
    if (saved) {
      _setStatus('Message saved. Opening WhatsApp…', false);
    } else {
      _setStatus(
        'Could not save to the inbox — opening WhatsApp instead.',
        true,
      );
    }
    await ContactService.openWhatsAppMessage(
      name: _nameController.text.trim(),
      contact: _contactController.text.trim(),
      projectType: _projectType,
      message: _messageController.text.trim(),
    );
    if (mounted) {
      setState(() => _sending = false);
    }
  }

  Future<void> _sendEmail() async {
    if (!_isValid) {
      _showNeedFields();
      return;
    }
    setState(() => _sending = true);
    final bool saved = await _saveToFirestore();
    if (saved) {
      _setStatus('Message saved. Opening your email app…', false);
    } else {
      _setStatus(
        'Could not save to the inbox — opening email instead.',
        true,
      );
    }
    await ContactService.openEmailMessage(
      name: _nameController.text.trim(),
      contact: _contactController.text.trim(),
      projectType: _projectType,
      message: _messageController.text.trim(),
    );
    if (mounted) {
      setState(() => _sending = false);
    }
  }

  InputDecoration _decoration(String label) {
    final bool isDark = widget.isDark;
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        fontSize: 14,
        color: isDark ? AppColors.inkSoftDark : AppColors.inkSoft,
      ),
      filled: true,
      fillColor: isDark
          ? Colors.white.withValues(alpha: 0.06)
          : Colors.white.withValues(alpha: 0.75),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: isDark
              ? Colors.white.withValues(alpha: 0.18)
              : Colors.black.withValues(alpha: 0.12),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.orange, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.isDark;
    final bool isNarrow = MediaQuery.of(context).size.width < 700;
    final TextStyle inputStyle = GoogleFonts.poppins(
      fontSize: 15,
      color: isDark ? AppColors.inkLight : AppColors.ink,
    );
    final Widget nameField = TextField(
      controller: _nameController,
      style: inputStyle,
      decoration: _decoration('Your name'),
    );
    final Widget contactField = TextField(
      controller: _contactController,
      style: inputStyle,
      decoration: _decoration('Email or WhatsApp number'),
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.12)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Send me a message',
            style: GoogleFonts.archivo(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: isDark ? AppColors.inkLight : AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Fill this in and hit send — WhatsApp opens with your message ready to go, straight to my phone.',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.6,
              color: isDark ? AppColors.inkSoftDark : AppColors.inkSoft,
            ),
          ),
          const SizedBox(height: 24),
          if (isNarrow) ...<Widget>[
            nameField,
            const SizedBox(height: 16),
            contactField,
          ] else
            Row(
              children: <Widget>[
                Expanded(child: nameField),
                const SizedBox(width: 16),
                Expanded(child: contactField),
              ],
            ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _projectType,
            decoration: _decoration('Project type'),
            dropdownColor: isDark ? AppColors.paperDark2 : Colors.white,
            style: inputStyle,
            items: PortfolioData.projectTypes.map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _projectType = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _messageController,
            style: inputStyle,
            maxLines: 5,
            decoration: _decoration(
              'Your message — project, screens, timeline…',
            ),
          ),
          if (_statusMessage.isNotEmpty) ...<Widget>[
            const SizedBox(height: 16),
            Text(
              _statusMessage,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _statusIsError ? Colors.red : Colors.green,
              ),
            ),
          ],
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _sending ? null : _sendWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whatsapp,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                elevation: 0,
              ),
              child: _sending
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Send via WhatsApp',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: TextButton(
              onPressed: _sending ? null : _sendEmail,
              child: Text(
                'Prefer email? Send via Email instead',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orange,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              AppStrings.noAccountNote,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.inkSoftDark : AppColors.inkSoft,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
