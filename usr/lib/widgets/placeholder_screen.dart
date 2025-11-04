class PlaceholderScreen extends StatelessWidget {
  final String title;
  PlaceholderScreen({required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text('$title - Coming Soon', style: TextStyle(color: Colors.white))));
}