import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile & Quizz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          titleMedium: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      home: const MainMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TP1 Flutter'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuButton(
              label: 'Exercice 1: Profile Card',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileHomePage()),
                );
              },
            ),
            const SizedBox(height: 24),
            MenuButton(
              label: 'Exercice 2: Quizz',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizzPage(title: 'Flutter Quizz')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const MenuButton({required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Card')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade400, Colors.indigo.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              const SizedBox(height: 80),
              _getCard(context),
              Positioned(top: -60, child: _getAvatar(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAvatar(BuildContext context) {
    // Placez votre image locale dans `assets/images/fadel.jpg` et déclarez-la dans `pubspec.yaml`
    return const ProfileAvatar(size: 120, assetPath: 'assets/images/fadel.jpg');
  }

  Widget _getCard(BuildContext context) {
    return const ProfileCard(
      name: 'Fadel Benomar',
      role: 'Cherche stage pfe',
      email: 'fadel.benomar@umontpellier.com',
      phone: '+33 6 11111111',
      location: 'Montpellier, France',
      social: '@fb2001',
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final double size;
  final String assetPath;
  const ProfileAvatar({required this.size, required this.assetPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: ClipOval(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, _, __) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: Icon(Icons.person, size: size * 0.45, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String phone;
  final String location;
  final String social;

  const ProfileCard({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.location,
    required this.social,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(role, style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            InfoRow(icon: Icons.email, label: email),
            const SizedBox(height: 10),
            InfoRow(icon: Icons.phone, label: phone),
            const SizedBox(height: 10),
            InfoRow(icon: Icons.location_on, label: location),
            const SizedBox(height: 10),
            InfoRow(icon: Icons.alternate_email, label: social),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const InfoRow({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.12),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}

class Question {
  final String text;
  final bool answer;
  const Question({required this.text, required this.answer});
}

class QuizzPage extends StatefulWidget {
  final String title;
  const QuizzPage({required this.title, super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final List<Question> _questions = const [
    Question(text: 'Flutter utilise le langage Dart', answer: true),
    Question(text: 'Un StatelessWidget peut changer son état', answer: false),
    Question(text: 'MaterialApp est un widget racine pour Material Design', answer: true),
    Question(text: 'Scaffold fournit la structure de base d\'une page', answer: true),
    Question(text: 'setState() est utilisé dans les StatelessWidget', answer: false),
  ];

  int _index = 0;
  int _score = 0;
  bool _finished = false;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.blueGrey[900],
        child: _finished ? _resultView() : _questionView(),
      ),
    );
  }

  Widget _questionView() {
    final q = _questions[_index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Question ${_index + 1} / ${_questions.length}', style: const TextStyle(color: Colors.white70, fontSize: 16)),
        const SizedBox(height: 24),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Text(q.text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(height: 28),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _isProcessing ? null : () => _answer(true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(14)),
                child: const Text('VRAI', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _isProcessing ? null : () => _answer(false),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.all(14)),
                child: const Text('FAUX', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Score: $_score', style: const TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }

  Widget _resultView() {
    final percent = (_score / _questions.length) * 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.emoji_events, size: 96, color: Colors.amber),
        const SizedBox(height: 24),
        const Text('Quizz Terminé', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text('$_score / ${_questions.length}', style: const TextStyle(color: Colors.white, fontSize: 20)),
        const SizedBox(height: 8),
        Text('${percent.toStringAsFixed(1)} %', style: const TextStyle(color: Colors.amber, fontSize: 22)),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _reset,
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14)),
          child: const Text('Recommencer'),
        ),
      ],
    );
  }

  Future<void> _answer(bool choice) async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);

    final correct = _questions[_index].answer == choice;
    if (correct) _score++;

    final snack = SnackBar(
      content: Text(correct ? 'Correct !' : 'Incorrect'),
      backgroundColor: correct ? Colors.green : Colors.red,
      duration: const Duration(milliseconds: 900),
    );

    final controller = ScaffoldMessenger.of(context).showSnackBar(snack);

    // Attendre la fermeture du SnackBar avant de changer la question
    await controller.closed;

    setState(() {
      if (_index < _questions.length - 1) {
        _index++;
      } else {
        _finished = true;
      }
      _isProcessing = false;
    });
  }

  void _reset() {
    setState(() {
      _index = 0;
      _score = 0;
      _finished = false;
      _isProcessing = false;
    });
  }
}
