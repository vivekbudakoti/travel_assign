# Travel Assign - Travel Feed & Experience Explorer

A mini Flutter app that showcases a feed of curated travel experiences based on user interests. Users can explore experiences, view details, and save their favorites to a wishlist.

## 🎥 Demo Preview

<video src="https://drive.google.com/file/d/13WGp8D2SPeqZ2cb3lN7anpuTDipsmnXr/view?usp=drive_link" width="400" controls autoplay loop muted></video>

## Architecture & Structure

### State Management
BLoC/Cubit pattern using `flutter_bloc` for consistent state handling across the app.

### Navigation
GoRouter for declarative routing with custom page transitions and deep linking support.

### Project Structure
```
lib/
├── core/                           # Core utilities and shared code
│   ├── constants/                  # App constants and raw JSON data
│   ├── model/                      # Shared data models
│   ├── routes/                     # Navigation configuration
│   ├── theme/                      # Theme, colors, and text styles
│   ├── utils/                      # Utility functions and helpers
│   └── widgets/                    # Reusable widgets
│       └── experience_grid/        # Grid-specific widgets
├── modules/                        # Feature-based modules
│   ├── app/                        # App-level configuration
│   │   ├── bloc/
│   │   │   ├── heart/              # Global heart state management
│   │   │   └── theme/              # Theme management
│   │   └── view/
│   ├── experience/                 # Experience feed module
│   │   ├── bloc/
│   │   ├── repo/
│   │   │   └── data/
│   │   └── view/
│   │       └── widgets/
│   ├── experience_details/         # Experience detail module
│   │   ├── bloc/
│   │   ├── repo/
│   │   │   └── data/
│   │   └── view/
│   │       └── widgets/
│   ├── onboarding/                 # Onboarding module
│   │   ├── bloc/
│   │   ├── repository/
│   │   │   └── data/
│   │   └── view/
│   │       └── widgets/
│   ├── saved_experiences/          # Saved experiences module
│   │   ├── bloc/
│   │   ├── repo/
│   │   │   └── data/
│   │   └── view/
│   └── splash/                     # Splash screen
├── l10n/                           # Localization files
└── gen/                            # Generated code (assets)
```

## Setup Instructions

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository and navigate to the project directory
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate assets and localization:
   ```bash
   dart run build_runner build
   flutter gen-l10n
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Technologies Used

### Core Dependencies
- `flutter_bloc: ^9.1.1` - State management
- `go_router: ^17.0.0` - Navigation
- `shared_preferences: ^2.5.3` - Local storage
- `cached_network_image: ^3.4.1` - Image caching
- `intl: ^0.20.2` - Internationalization
- `shimmer: ^3.0.0` - Loading animations
- `carousel_slider: ^5.1.1` - Image carousel
- `flutter_svg: ^2.2.2` - SVG support

### Dev Dependencies
- `flutter_lints: ^5.0.0` - Code linting
- `build_runner: ^2.6.0` - Code generation
- `flutter_gen_runner: ^5.12.0` - Asset generation
- `flutter_launcher_icons: ^0.14.4` - App icons

## Extra Features Beyond Requirements

- **Internationalization**: Full localization support using Flutter's localization system with ARB files
- **Custom Animations**: Custom page transitions, swipe gestures, and tutorial animations
- **Shimmer Loading**: Beautiful skeleton loading states for better perceived performance

## Sample Data

The app includes 15+ travel experiences with complete data structure stored in `lib/core/constants/raw_json.dart`.

## Code Quality

- Full null safety compliance
- Clean architecture with separation of concerns
- Modular, reusable components
- Consistent naming conventions
- Proper error handling and user feedback