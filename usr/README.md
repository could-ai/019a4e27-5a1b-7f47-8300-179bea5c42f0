# MintHub - Next-Generation Gaming Rewards App

A Flutter application that combines gaming, entertainment, and earning into one seamless platform. Users can play simple games and win real rewards through a clean, modern interface powered by Firebase.

## Features

### 🎮 Core Gaming Features
- **Guess the Number**: Number guessing game with token rewards
- **Flappy Game**: Flame-engine powered Flappy Bird clone
- **Snake & Ladder**: Classic board game with multiplayer support
- **Scratch Cards**: Instant win scratch cards

### 💰 Reward System
- Token-based economy with rupee conversion
- Daily jackpots and progress tracking
- Referral system with bonus rewards
- Wallet management with redemption options

### 🎨 Design & UX
- Dark, neon, futuristic theme
- Smooth animations and gradient effects
- Responsive design for Android 13-15
- PT Sans typography with Google Fonts

### 🔧 Technical Stack
- **Framework**: Flutter 3.x
- **Backend**: Firebase (Auth, Firestore, Functions, FCM)
- **State Management**: Provider
- **Game Engine**: Flame
- **UI**: Material Design with custom theming

## Getting Started

### Prerequisites
- Flutter 3.x
- Android Studio / VS Code
- Firebase project with enabled services

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/minthub.git
   cd minthub
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase:
   - Create a Firebase project
   - Enable Authentication, Firestore, Functions, and FCM
   - Add your `google-services.json` to `android/app/`
   - Configure Firebase hosting for legal pages

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point and navigation
├── screens/                  # Main app screens
│   ├── home_page.dart        # Dashboard with balances and offers
│   ├── games_list_page.dart  # Game selection screen
│   ├── wallet_page.dart      # Token/rupee management
│   ├── profile_page.dart     # User profile and settings
│   └── refer_earn_page.dart  # Referral system
├── utils/                    # Utility classes
│   ├── colors.dart           # App color palette
│   └── theme.dart            # Theme configuration
├── widgets/                  # Reusable UI components
│   ├── widgets.dart          # Common widgets (buttons, text)
│   └── placeholder_screen.dart # Placeholder screens
└── models/                   # Data models (future)
```

## Firebase Configuration

### Firestore Collections
- `/users/{uid}` - User profiles and balances
- `/rewards/` - Game reward configurations
- `/scratch/` - Scratch card settings
- `/referrals/` - Referral tracking
- `/notifications/` - Push notification content
- `/config/` - Dynamic app configuration

### Cloud Functions
- `awardTokens` - Automated reward distribution
- `processRedemption` - Handle token redemptions
- `sendNotifications` - Push notification triggers

## Building for Production

### Android APK
```bash
flutter build apk --release
```

### App Bundle (Recommended)
```bash
flutter build appbundle --release
```

## Play Store Requirements

✅ **Completed Features**:
- Working login/logout with Firebase Auth
- Token balance synchronization
- Game implementations with Flame engine
- Redemption system with UPI/Paytm integration
- Legal pages hosted on Firebase
- Push notifications via FCM
- 0 crash policy with proper error handling
- Android 13-15 support
- App size under 50MB
- Professional branding

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please contact: support@minthub.app

---

**MintHub** - Where Gaming Meets Earning 🎯