import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/ncf_app_bar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<_FaqItem> _faqs = [
    _FaqItem(question: 'What are the office hours of the Guidance and Testing Center?',
        answer: 'The GTC is open Monday to Friday, from 8:00 AM to 5:00 PM. Walk-in visits are welcome during office hours. For scheduled appointments, please call or email us in advance.'),
    _FaqItem(question: 'How do I schedule a counseling session?',
        answer: 'You can schedule a counseling session by visiting the GTC office, calling our office number, or sending an email. Walk-in sessions are also accommodated based on counselor availability.'),
    _FaqItem(question: 'Are counseling sessions confidential?',
        answer: 'Yes. All counseling sessions are strictly confidential in accordance with the professional ethics of guidance counselors. Information shared during sessions will not be disclosed without your written consent, except in cases involving risk to life.'),
    _FaqItem(question: 'Who needs to undergo psychological testing?',
        answer: 'Psychological testing is required for incoming freshmen, transferees, and students referred by their respective college for assessment purposes. Some programs may also require specific tests for admission.'),
    _FaqItem(question: 'How long does psychological testing take?',
        answer: 'Testing duration varies depending on the type and number of tests administered. Generally, a standard testing session lasts 2 to 3 hours. You will be notified in advance about the expected duration.'),
    _FaqItem(question: 'Can I get the results of my psychological test?',
        answer: 'Psychological test results are confidential and are interpreted by a licensed psychometrician or guidance counselor. A feedback session will be arranged to discuss your results and their implications.'),
    _FaqItem(question: 'What should I do if I am experiencing a crisis or emergency?',
        answer: 'If you are experiencing a mental health crisis, please go to the GTC office immediately or ask someone to accompany you. In case of an emergency outside office hours, please contact the school clinic or proceed to the nearest hospital.'),
    _FaqItem(question: 'Does the GTC offer career counseling for graduating students?',
        answer: 'Yes. The GTC provides career counseling and aptitude testing for graduating students. Career guidance activities are scheduled each semester — check the announcements for dates.'),
    _FaqItem(question: 'Is there a fee for GTC services?',
        answer: 'Most GTC services, including individual counseling and career guidance, are free of charge for enrolled NCF students. Fees may apply for specific standardized tests — the GTC office will inform you of any applicable charges.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NcfAppBar(title: 'FAQ'),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _faqs.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(children: [
                Icon(Icons.quiz_rounded, color: Colors.white, size: 28),
                SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Frequently Asked Questions',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 4),
                  Text('Tap a question to view the answer.',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ])),
              ]),
            );
          }
          return _FaqCard(faq: _faqs[index - 1], number: index);
        },
      ),
    );
  }
}

class _FaqCard extends StatefulWidget {
  final _FaqItem faq;
  final int number;
  const _FaqCard({required this.faq, required this.number});

  @override
  State<_FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<_FaqCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _expanded ? const Color(0xFF2E7D32).withOpacity(0.6) : Colors.white12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => setState(() => _expanded = !_expanded),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 26, height: 26,
                    decoration: BoxDecoration(
                      color: _expanded ? const Color(0xFF2E7D32) : const Color(0xFF2E7D32).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text('${widget.number}',
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(widget.faq.question,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13, height: 1.4))),
                  const SizedBox(width: 8),
                  Icon(_expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                      color: _expanded ? const Color(0xFF4CAF50) : Colors.white38),
                ],
              ),
            ),
            if (_expanded)
              Container(
                padding: const EdgeInsets.fromLTRB(52, 0, 14, 14),
                child: Text(widget.faq.answer,
                    style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
              ),
          ],
        ),
      ),
    );
  }
}

class _FaqItem {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});
}