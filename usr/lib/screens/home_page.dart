import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.monetization_on, color: Color(0xFFFBBF24)),
              SizedBox(width: 4),
              Text("1200", style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
        leadingWidth: 100,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MintHub"),
            SizedBox(width: 4),
            Icon(Icons.star, color: Color(0xFFFBBF24), size: 20),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Open drawer
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeroTitle(),
          const SizedBox(height: 24),
          _buildProgressCard(),
          const SizedBox(height: 24),
          _buildDailyJackpotCard(context),
          const SizedBox(height: 24),
          _buildNavigationShortcuts(),
          const SizedBox(height: 24),
          _buildWinnersCarousel(),
        ],
      ),
    );
  }

  Widget _buildHeroTitle() {
    return const Text.rich(
      TextSpan(
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        children: [
          TextSpan(text: "Play, Win, "),
          TextSpan(
            text: "Earn!",
            style: TextStyle(
              color: Color(0xFF8B5CF6), // Placeholder for gradient
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildProgressCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
            ),
            const SizedBox(height: 8),
            const Text("Just 120 tokens left to unlock your next reward!"),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyJackpotCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5CF6).withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ]
      ),
      child: Column(
        children: [
          const Text("Daily Jackpot – Play and Win Big!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to GamesListPage
            },
            child: const Text("Play Now"),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationShortcuts() {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text("🎁", style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 8),
                  const Text("Scratch Cards"),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text("🏆", style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 8),
                  const Text("Winners"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWinnersCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recent Winners", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Text("U"),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User ${index + 1}"),
                            Text("Won 100 Tokens", style: TextStyle(color: Colors.grey[400])),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
