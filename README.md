# DeepCare Task - Flutter Clock App

A beautiful Flutter application featuring a real-time clock with random number generation, prime number detection, and extensive personalization options.

## ✨ Features

### 🕐 Real-Time Clock
- Beautiful analog and digital clock display
- Live time updates with smooth animations
- Custom clock styling with theme integration

### 🎲 Random Number Generation
- Generate random numbers with visual feedback
- Smooth animations and transitions
- Integration with personalization settings

### 🔢 Prime Number Detection
- Automatic prime number detection
- Celebratory confetti animations for prime numbers
- Date tracking for last prime number found

### 🎨 Personalization
- **Theme Switching**: Toggle between light and dark modes
- **Color Customization**: Choose from various color schemes
- **Gradient Effects**: Enable/disable gradient backgrounds
- **Animation Controls**: Toggle animations on/off
- **Persistent Settings**: All preferences saved locally

### 🌍 Internationalization
- Multi-language support (English, German)
- Localized UI text and formatting

## 🛠️ Technical Features

- **State Management**: Riverpod for reactive state management
- **Local Storage**: SharedPreferences for persistent data
- **Network Layer**: Dio HTTP client with interceptors
- **Code Generation**: Freezed for immutable models
- **Animations**: Custom Lottie animations and Flutter animations
- **Responsive Design**: Adaptive layouts for different screen sizes

## 📱 Screenshots

*Add screenshots of your app here*

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/MohamedAskar/deepcare-task.git
   cd deepcare-task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

### Core Dependencies
- `flutter_riverpod` - State management
- `freezed` - Immutable data classes
- `json_annotation` - JSON serialization
- `shared_preferences` - Local storage
- `dio` - HTTP client
- `lottie` - Animations

### Dev Dependencies
- `build_runner` - Code generation
- `freezed` - Code generation for models
- `json_serializable` - JSON serialization

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/         # App constants
│   ├── extensions/        # Dart extensions
│   ├── models/           # Data models
│   ├── network/          # HTTP client setup
│   └── theme/            # App theming
├── l10n/                 # Localization files
├── repositories/         # Data repositories
├── screens/              # UI screens
│   ├── clock/           # Clock screen
│   ├── personalization/ # Settings screen
│   └── prime-number/    # Prime number modal
├── services/            # Business logic services
├── utils/               # Utility classes
├── widgets/             # Reusable widgets
└── main.dart           # App entry point
```

## 🎯 Key Components

### Clock Screen
- Main application screen with clock display
- Random number generation buttons
- Personalization access

### Personalization Modal
- Theme switching controls
- Color scheme selection
- Animation toggles
- Settings persistence

### Prime Number Modal
- Prime number celebration
- Confetti animations
- Historical tracking

## 🧪 Testing

Run the test suite:
```bash
flutter test
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Mohamed Askar**
- GitHub: [@MohamedAskar](https://github.com/MohamedAskar)

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📱 Platform Support

- ✅ Android
- ✅ iOS  
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux
