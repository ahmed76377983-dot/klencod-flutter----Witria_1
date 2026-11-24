import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const WitriaApp());

// ======================= Palette =======================
const Color kCream = Color(0xFFFBF7EF);
const Color kInk = Color(0xFF2E2A26);
const Color kTeal = Color(0xFF2EB8A6);
const Color kCoral = Color(0xFFFF7F66);
const Color kSunny = Color(0xFFFFD166);
const Color kSky = Color(0xFF8ED1E8);
const Color kGood = Color(0xFF4CB56B);
const Color kBad = Color(0xFFE8554E);

// ======================= Models =======================
class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class QuizCategory {
  final String name;
  final String emoji;
  final Color color;
  final bool lightText; // white text on the button or dark ink text
  final List<Question> questions;

  const QuizCategory({
    required this.name,
    required this.emoji,
    required this.color,
    required this.lightText,
    required this.questions,
  });
}

// ======================= Question Bank =======================
const List<QuizCategory> kCategories = [
  // ---------- ألغاز وذكاء ----------
  QuizCategory(
    name: 'ألغاز وذكاء',
    emoji: '🧩',
    color: kTeal,
    lightText: true,
    questions: [
      Question(
        text: 'ما هو الشيء الذي كلما أخذت منه كَبُر؟',
        options: ['الحفرة', 'الجبل', 'البحر', 'الشجرة'],
        correctIndex: 0,
      ),
      Question(
        text: 'له عينٌ واحدة ولا يرى، فما هو؟',
        options: ['النظارة', 'الإبرة', 'التلسكوب', 'المرآة'],
        correctIndex: 1,
      ),
      Question(
        text: 'له أسنان ولا يعضّ، فما هو؟',
        options: ['المنشار', 'التمساح', 'المشط', 'القط'],
        correctIndex: 2,
      ),
      Question(
        text: 'يمشي بلا أرجل ويدخل الأذن، فما هو؟',
        options: ['الساعة', 'الصوت', 'النملة', 'الظل'],
        correctIndex: 1,
      ),
      Question(
        text: 'أي شهر من شهور السنة فيه 28 يوماً؟',
        options: ['فبراير فقط', 'شهور الصيف', 'كل الشهور', 'لا يوجد'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم مرة تستطيع طرح الرقم 5 من الرقم 25؟',
        options: ['خمس مرات', 'أربع مرات', 'مرة واحدة فقط', 'عشر مرات'],
        correctIndex: 2,
      ),
      Question(
        text: 'يحملك وتحمله في الوقت نفسه، فما هو؟',
        options: ['الحقيبة', 'الحذاء', 'الكرسي', 'القبعة'],
        correctIndex: 1,
      ),
      Question(
        text: 'قبل اكتشافه، ما كان أعلى جبل في العالم؟',
        options: ['كليمنجارو', 'جبل إفرست', 'جبال الألب', 'لم يكن هناك جبل'],
        correctIndex: 1,
      ),
      Question(
        text: 'ما هو الباب الذي لا يمكن فتحه أبداً؟',
        options: ['الباب الحديدي', 'باب البيت', 'الباب المفتوح', 'الباب القديم'],
        correctIndex: 2,
      ),
      Question(
        text: 'يكتب ولا يقرأ، فما هو؟',
        options: ['القلم', 'الكتاب', 'الطالب', 'الجدار'],
        correctIndex: 0,
      ),
    ],
  ),
  // ---------- معلومات عامة ----------
  QuizCategory(
    name: 'معلومات عامة',
    emoji: '🌍',
    color: kSunny,
    lightText: false,
    questions: [
      Question(
        text: 'ما هي عاصمة اليابان؟',
        options: ['بكين', 'سول', 'طوكيو', 'بانكوك'],
        correctIndex: 2,
      ),
      Question(
        text: 'ما هو أكبر كوكب في المجموعة الشمسية؟',
        options: ['الأرض', 'المشتري', 'زحل', 'المريخ'],
        correctIndex: 1,
      ),
      Question(
        text: 'كم عدد قارات العالم؟',
        options: ['5', '6', '7', '8'],
        correctIndex: 2,
      ),
      Question(
        text: 'ما هو أكبر محيطات العالم؟',
        options: ['الأطلسي', 'الهندي', 'المتجمد الشمالي', 'الهادئ'],
        correctIndex: 3,
      ),
      Question(
        text: 'ما هو أطول أنهار العالم؟',
        options: ['النيل', 'الأمازون', 'الفرات', 'الدانوب'],
        correctIndex: 0,
      ),
      Question(
        text: 'ما هو أسرع حيوان بري في العالم؟',
        options: ['الأسد', 'الغزال', 'الفهد', 'الحصان'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم عدد لاعبي فريق كرة القدم داخل الملعب؟',
        options: ['9', '10', '11', '12'],
        correctIndex: 2,
      ),
      Question(
        text: 'ما هي أصغر دولة في العالم؟',
        options: ['موناكو', 'الفاتيكان', 'سنغافورة', 'مالطا'],
        correctIndex: 1,
      ),
      Question(
        text: 'ما هو المعدن السائل في درجة حرارة الغرفة؟',
        options: ['الحديد', 'الذهب', 'الألومنيوم', 'الزئبق'],
        correctIndex: 3,
      ),
      Question(
        text: 'كم عدد ألوان قوس قزح؟',
        options: ['5', '6', '7', '9'],
        correctIndex: 2,
      ),
    ],
  ),
  // ---------- رياضيات خفيفة ----------
  QuizCategory(
    name: 'رياضيات خفيفة',
    emoji: '🔢',
    color: kCoral,
    lightText: true,
    questions: [
      Question(
        text: 'كم ناتج 7 + 8؟',
        options: ['13', '14', '15', '16'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم ناتج 12 × 3؟',
        options: ['33', '36', '39', '42'],
        correctIndex: 1,
      ),
      Question(
        text: 'ما هو نصف العدد 50؟',
        options: ['20', '25', '30', '15'],
        correctIndex: 1,
      ),
      Question(
        text: 'كم ناتج 100 − 37؟',
        options: ['63', '67', '73', '53'],
        correctIndex: 0,
      ),
      Question(
        text: 'كم ناتج 45 ÷ 9؟',
        options: ['4', '5', '6', '7'],
        correctIndex: 1,
      ),
      Question(
        text: 'كم يساوي 6² (ستة تربيع)؟',
        options: ['12', '26', '36', '46'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم يساوي 15٪ من 200؟',
        options: ['15', '25', '30', '35'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم مجموع زوايا المثلث؟',
        options: ['90 درجة', '120 درجة', '180 درجة', '360 درجة'],
        correctIndex: 2,
      ),
      Question(
        text: 'ما هو العدد الأولي الذي يأتي بعد الرقم 7؟',
        options: ['8', '9', '10', '11'],
        correctIndex: 3,
      ),
      Question(
        text: 'كم ناتج 9 × 9؟',
        options: ['72', '79', '81', '99'],
        correctIndex: 2,
      ),
    ],
  ),
  // ---------- أسئلة إسلامية ----------
  QuizCategory(
    name: 'أسئلة إسلامية',
    emoji: '🕌',
    color: kSky,
    lightText: false,
    questions: [
      Question(
        text: 'كم عدد سور القرآن الكريم؟',
        options: ['110', '114', '120', '99'],
        correctIndex: 1,
      ),
      Question(
        text: 'ما هي أول سورة نزلت من القرآن الكريم؟',
        options: ['الفاتحة', 'البقرة', 'العلق', 'الإخلاص'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم عدد أركان الإسلام؟',
        options: ['4', '5', '6', '7'],
        correctIndex: 1,
      ),
      Question(
        text: 'كم عدد أركان الإيمان؟',
        options: ['5', '6', '7', '4'],
        correctIndex: 1,
      ),
      Question(
        text: 'ما هي أطول سورة في القرآن الكريم؟',
        options: ['آل عمران', 'النساء', 'البقرة', 'المائدة'],
        correctIndex: 2,
      ),
      Question(
        text: 'كم عدد الأنبياء المذكورين في القرآن الكريم؟',
        options: ['20', '25', '30', '15'],
        correctIndex: 1,
      ),
      Question(
        text: 'من هو أول مؤذن في الإسلام؟',
        options: [
          'عمر بن الخطاب',
          'علي بن أبي طالب',
          'بلال بن رباح',
          'سلمان الفارسي',
        ],
        correctIndex: 2,
      ),
      Question(
        text: 'كم عدد أبواب الجنة؟',
        options: ['7', '8', '9', '10'],
        correctIndex: 1,
      ),
      Question(
        text: 'كم عدد أجزاء القرآن الكريم؟',
        options: ['28', '29', '30', '31'],
        correctIndex: 2,
      ),
      Question(
        text: 'ما هي أقصر سورة في القرآن الكريم؟',
        options: ['الكوثر', 'الإخلاص', 'الناس', 'الفلق'],
        correctIndex: 0,
      ),
    ],
  ),
];

// ======================= Fun feedback lines =======================
const List<String> kPraise = [
  'إجابة صحيحة! أحسنت 👏',
  'برافو عليك! 🎉',
  'صحيحة! دماغك شغالة 🔥',
  'ممتاز! استمر 💪',
  'عاش! إجابة مظبوطة ⭐',
];

const List<String> kOops = [
  'إجابة خاطئة.. ركّز أكثر 😅',
  'للأسف غلط! المرة الجاية 💫',
  'مش دي الإجابة 😬',
  'قريب.. بس مش صح 🙈',
];

// ======================= App =======================
class WitriaApp extends StatelessWidget {
  const WitriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ويتريا',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kCream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kTeal,
          brightness: Brightness.light,
        ).copyWith(surface: kCream, primary: kTeal, secondary: kCoral),
      ),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
      home: const GameRoot(),
    );
  }
}

enum _Screen { home, quiz, result }

class GameRoot extends StatefulWidget {
  const GameRoot({super.key});

  @override
  State<GameRoot> createState() => _GameRootState();
}

class _GameRootState extends State<GameRoot> {
  _Screen _screen = _Screen.home;
  QuizCategory? _category;
  int _index = 0;
  int _score = 0;
  int? _selected;
  bool _answered = false;
  String _feedback = '';
  int _advanceToken = 0;
  final Random _rng = Random();

  static const List<String> _letters = ['أ', 'ب', 'ج', 'د'];

  void _startQuiz(QuizCategory category) {
    setState(() {
      _advanceToken++;
      _category = category;
      _index = 0;
      _score = 0;
      _selected = null;
      _answered = false;
      _feedback = '';
      _screen = _Screen.quiz;
    });
  }

  void _goHome() {
    setState(() {
      _advanceToken++;
      _screen = _Screen.home;
      _category = null;
    });
  }

  void _onAnswer(int i) {
    final QuizCategory? cat = _category;
    if (_answered || cat == null) return;
    final Question q = cat.questions[_index];
    final bool correct = i == q.correctIndex;
    setState(() {
      _answered = true;
      _selected = i;
      if (correct) _score++;
      final List<String> lines = correct ? kPraise : kOops;
      _feedback = lines[_rng.nextInt(lines.length)];
    });
    final int token = ++_advanceToken;
    Future<void>.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted || token != _advanceToken) return;
      setState(() {
        if (_index >= cat.questions.length - 1) {
          _screen = _Screen.result;
        } else {
          _index++;
          _selected = null;
          _answered = false;
          _feedback = '';
        }
      });
    });
  }

  String _resultMessage(int score) {
    if (score >= 9) return 'عبقري! أداء أسطوري 🏆';
    if (score >= 7) return 'ممتاز! قريب جداً من العلامة الكاملة 🌟';
    if (score >= 5) return 'جيد! تحتاج شوية تدريب 💪';
    if (score >= 3) return 'لا بأس.. حاول مرة تانية 👍';
    return 'ولا يهمك! جرّب تاني وهتتحسن 🎯';
  }

  String _resultEmoji(int score) {
    if (score >= 9) return '🏆';
    if (score >= 7) return '🌟';
    if (score >= 5) return '💪';
    if (score >= 3) return '👍';
    return '🎯';
  }

  @override
  Widget build(BuildContext context) {
    switch (_screen) {
      case _Screen.home:
        return _buildHome();
      case _Screen.quiz:
        return _buildQuiz();
      case _Screen.result:
        return _buildResult();
    }
  }

  // ======================= Home =======================
  Widget _buildHome() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Transform.rotate(
                angle: -0.02,
                child: const Text(
                  'ويتريا',
                  style: TextStyle(
                    fontSize: 62,
                    fontWeight: FontWeight.w900,
                    color: kTeal,
                    shadows: [
                      Shadow(color: kInk, offset: Offset(4, 4), blurRadius: 0),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'فكّر.. العب.. اتحدّى',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kInk,
                ),
              ),
              const SizedBox(height: 10),
              Transform.rotate(
                angle: -0.03,
                child: Container(
                  width: 140,
                  height: 8,
                  decoration: BoxDecoration(
                    color: kCoral,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: kInk, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'اختار القسم 👇',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kInk,
                ),
              ),
              const SizedBox(height: 16),
              for (final QuizCategory cat in kCategories) ...[
                DoodleButton(
                  color: cat.color,
                  onTap: () => _startQuiz(cat),
                  child: Row(
                    children: [
                      Text(cat.emoji, style: const TextStyle(fontSize: 26)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          cat.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: cat.lightText ? Colors.white : kInk,
                          ),
                        ),
                      ),
                      Text(
                        '${cat.questions.length} أسئلة',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: (cat.lightText ? Colors.white : kInk)
                              .withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
              ],
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ======================= Quiz =======================
  Widget _buildQuiz() {
    final QuizCategory cat = _category ?? kCategories.first;
    final Question q = cat.questions[_index];
    final double progress = (_index + 1) / cat.questions.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top row: back, progress label, score
              Row(
                children: [
                  DoodleIconButton(
                    icon: Icons.arrow_back,
                    onTap: _goHome,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'سؤال ${_index + 1} من ${cat.questions.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: kInk,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: kSunny,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: kInk, width: 2.5),
                      boxShadow: const [
                        BoxShadow(
                          color: kInk,
                          offset: Offset(0, 3),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Text(
                      '⭐ $_score',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: kInk,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // Progress bar
              Container(
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kInk, width: 2.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(color: kTeal),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Category chip
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kInk, width: 2),
                  ),
                  child: Text(
                    '${cat.emoji} ${cat.name}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kInk,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Question card
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kInk, width: 3),
                    boxShadow: const [
                      BoxShadow(
                        color: kInk,
                        offset: Offset(5, 5),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Text(
                      q.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: kInk,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Answers
              for (int i = 0; i < q.options.length; i++) ...[
                DoodleButton(
                  color: _answerColor(i, q),
                  onTap: _answered ? null : () => _onAnswer(i),
                  child: Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: _answerLetterBg(i, q),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _letters[i],
                          style: TextStyle(
                            color: _answerLetterFg(i, q),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          q.options[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: _answerTextColor(i, q),
                          ),
                        ),
                      ),
                      if (_answered && i == q.correctIndex)
                        const Text('✅', style: TextStyle(fontSize: 20))
                      else if (_answered && i == _selected)
                        const Text('❌', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
              // Feedback banner (fixed height so layout doesn't jump)
              SizedBox(
                height: 58,
                child: _answered
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              _selected == q.correctIndex ? kGood : kBad,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: kInk, width: 2.5),
                          boxShadow: const [
                            BoxShadow(
                              color: kInk,
                              offset: Offset(0, 3),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: Text(
                          _feedback,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Color _answerColor(int i, Question q) {
    if (!_answered) return Colors.white;
    if (i == q.correctIndex) return kGood;
    if (i == _selected) return kBad;
    return Colors.white;
  }

  Color _answerTextColor(int i, Question q) {
    if (!_answered) return kInk;
    if (i == q.correctIndex || i == _selected) return Colors.white;
    return kInk;
  }

  Color _answerLetterBg(int i, Question q) {
    if (!_answered) return kInk;
    if (i == q.correctIndex || i == _selected) return Colors.white;
    return kInk;
  }

  Color _answerLetterFg(int i, Question q) {
    if (!_answered) return Colors.white;
    if (i == q.correctIndex) return kGood;
    if (i == _selected) return kBad;
    return Colors.white;
  }

  // ======================= Result =======================
  Widget _buildResult() {
    final QuizCategory cat = _category ?? kCategories.first;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: _score >= 5 ? kTeal : kCoral,
                  shape: BoxShape.circle,
                  border: Border.all(color: kInk, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: kInk,
                      offset: Offset(6, 6),
                      blurRadius: 0,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  _resultEmoji(_score),
                  style: const TextStyle(fontSize: 72),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                '$_score من ${cat.questions.length}',
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w900,
                  color: kInk,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _resultMessage(_score),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kInk,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${cat.emoji} ${cat.name}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kInk.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 40),
              DoodleButton(
                color: kTeal,
                onTap: () => _startQuiz(cat),
                child: const Center(
                  child: Text(
                    'العب تاني 🔁',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              DoodleButton(
                color: Colors.white,
                onTap: _goHome,
                child: const Center(
                  child: Text(
                    'الأقسام 🏠',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: kInk,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================= Doodle widgets =======================
class DoodleButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onTap;
  final double radius;

  const DoodleButton({
    super.key,
    required this.child,
    required this.color,
    this.onTap,
    this.radius = 18,
  });

  @override
  State<DoodleButton> createState() => _DoodleButtonState();
}

class _DoodleButtonState extends State<DoodleButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onTap != null;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: enabled ? (_) => setState(() => _down = true) : null,
      onTapUp: enabled ? (_) => setState(() => _down = false) : null,
      onTapCancel: enabled ? () => setState(() => _down = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 70),
        transform: Matrix4.translationValues(0, _down ? 5 : 0, 0),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: kInk, width: 3),
          boxShadow: [
            BoxShadow(
              color: kInk,
              offset: Offset(0, _down ? 0 : 5),
              blurRadius: 0,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

class DoodleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const DoodleIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kInk, width: 2.5),
          boxShadow: const [
            BoxShadow(color: kInk, offset: Offset(0, 3), blurRadius: 0),
          ],
        ),
        child: Icon(icon, color: kInk, size: 22),
      ),
    );
  }
}