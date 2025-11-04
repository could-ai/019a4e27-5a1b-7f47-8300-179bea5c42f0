class WalletProvider extends ChangeNotifier {
  int _tokens = 100;
  double _rupees = 10.0;

  int get tokens => _tokens;
  double get rupees => _rupees;

  void addTokens(int amount) {
    _tokens += amount;
    _rupees = _tokens / 10.0; // 10 tokens = ₹1
    notifyListeners();
    // TODO: Sync with Firebase
  }

  bool redeemTokens(int tokenAmount) {
    if (_tokens >= tokenAmount) {
      _tokens -= tokenAmount;
      _rupees = _tokens / 10.0;
      notifyListeners();
      // TODO: Process redemption via Firebase Functions
      return true;
    }
    return false;
  }

  void loadUserData() {
    // TODO: Load from Firebase
  }
}