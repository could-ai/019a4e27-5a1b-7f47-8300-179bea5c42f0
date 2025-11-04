import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int tokens = 100;
  double progress = 0.1; // example 10%
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = progress;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 18, 16, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topRow(),
            SizedBox(height: 22),
            _heroTitle(),
            SizedBox(height: 18),
            _progressCard(p),
            SizedBox(height: 18),
            _jackpotCard(),
            SizedBox(height: 18),
            _navCardsRow(),
            SizedBox(height: 18),
            _winnersCarousel(),
          ],
        ),
      ),
    );
  }

  Widget _topRow() {
    return Row(
      children: [
        _balancePill(Icons.monetization_on, tokens.toString(), Color(0xFFFBBF24)),
        Expanded(child: Center(child: _logoTitle())),
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white70),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Menu tapped'))),
        )
      ],
    );
  }

  Widget _balancePill(IconData icon, String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF0E1720),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _logoTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.auto_awesome, color: Color(0xFF8B5CF6)),
        SizedBox(width: 8),
        Text('MintHub', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
      ],
    );
  }

  Widget _heroTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white),
          children: [
            TextSpan(text: 'Play, Win, '),
            WidgetSpan(
              child: AnimatedGradientText(text: 'Earn!'),
            )
          ],
        ),
      ),
      SizedBox(height: 6),
      Text('Your daily dose of fun and rewards.', style: TextStyle(color: Colors.white54)),
    ]);
  }

  Widget _progressCard(double p) {
    final leftTokens = ((1.0 - p) * 1000).round();
    return Card(
      color: Color(0xFF0B1220),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Your Progress', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: p,
              minHeight: 10,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
              ).createShader(Rect.fromLTWH(0, 0, 200, 10))),
            ),
          ),
          SizedBox(height: 10),
          Text('Almost there! Just $leftTokens tokens left to unlock your next reward.',
              style: TextStyle(color: Colors.white54)),
        ]),
      ),
    );
  }

  Widget _jackpotCard() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/games'),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF3E1A8E), Color(0xFF8B2B89)]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Color(0xFF8B5CF6).withOpacity(0.25), blurRadius: 30, spreadRadius: 2),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.emoji_events, color: Colors.white70, size: 30),
                  SizedBox(height: 6),
                  Text('Daily Jackpot', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                  SizedBox(height: 4),
                  Text('Play games to win big!', style: TextStyle(color: Colors.white70)),
                ]),
              ),
              NeonButton(label: 'Play Now', onTap: () => Navigator.of(context).pushNamed('/games')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navCardsRow() {
    return Row(
      children: [
        Expanded(child: _smallCard(icon: Icons.videogame_asset, title: 'Play Games', route: '/games')),
        SizedBox(width: 10),
        Expanded(child: _smallCard(icon: Icons.card_giftcard, title: 'Scratch', route: '/scratch')),
        SizedBox(width: 10),
        Expanded(child: _smallCard(icon: Icons.emoji_events, title: 'Winners', route: '/profile')),
      ],
    );
  }

  Widget _smallCard({required IconData icon, required String title, required String route}) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: Color(0xFF0B1220),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Color(0xFFEC4899)),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
        ]),
      ),
    );
  }

  Widget _winnersCarousel() {
    final winners = [
      {'name': 'Ankit S.', 'prize': '₹5,000', 'avatar': null},
      {'name': 'Riya G.', 'prize': '₹2,500', 'avatar': null},
      {'name': 'Priya K.', 'prize': '₹1,000', 'avatar': null},
    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: winners.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, i) {
          final w = winners[i];
          return Container(
            width: 190,
            decoration: BoxDecoration(
              color: Color(0xFF0B1220),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(12),
            child: Row(children: [
              CircleAvatar(radius: 26, backgroundColor: Colors.grey[800], child: Text(w['name']![0])),
              SizedBox(width: 10),
              Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(w['name']!, style: TextStyle(fontWeight: FontWeight.w800)),
                SizedBox(height: 6),
                Text(w['prize']!, style: TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.w700)),
              ]))
            ]),
          );
        },
      ),
    );
  }
}

class AnimatedGradientText extends StatefulWidget {
  final String text;
  AnimatedGradientText({required this.text});
  @override
  _AnimatedGradientTextState createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(duration: Duration(seconds: 3), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
              begin: Alignment(-1 + 2 * _c.value, -0.5),
              end: Alignment(1 - 2 * _c.value, 0.5),
            ).createShader(bounds);
          },
          child: Text(widget.text, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white)),
        );
      },
    );
  }
}

class NeonButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  NeonButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Color(0xFF8B5CF6).withOpacity(0.6), blurRadius: 24, spreadRadius: 0)],
          gradient: LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)]),
        ),
        child: Text(label, style: TextStyle(fontWeight: FontWeight.w800)),
      ),
    );
  }
}