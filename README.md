# 🏏 Hand Cricket Game

A fun, interactive hand cricket game built using Flutter! Choose your runs, play against the computer, and experience the nostalgia of hand cricket with animations, scoreboards, and game logic that mimics the real game.

---

## 📱 Features

- Choose runs (1–6) via custom run buttons.
- Play against the computer with randomized AI runs.
- Rive-based hand animations for visual feedback.
- Countdown timer for every turn (auto-play if not selected).
- Scoreboard with innings, total, and win/loss handling.
- Dialogs for welcome, out, sixes, and game result.

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (tested on 3.29.3 and above)
- Dart SDK
- A connected emulator or physical device

### Installation

1. **Clone the repository:**

```bash
git clone https://github.com/aftabbagwan/hand-cricket-game.git
cd hand-cricket-game
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Run the app:**

```bash
flutter run
```

---

## 🧪 Testing the Game

- After the welcome dialog, choose a run (1–6) within 10 seconds.
- If no run is selected, the timer will auto-trigger the end.
- Scoring and innings are handled automatically.
- Play continues until either the player or computer wins.
- Watch for game-over dialogs and auto-reset.

---

## 🧠 Approach & Design Decisions

### Game Architecture
- **Provider** is used for game state management to keep UI reactive.
- **MVVM-ish structure** with separation of game logic and UI layer.
- Game state is managed in `GameProvider`, including run tracking, outs, score transitions, and win conditions.

### Timer Logic
- Integrated using `timer_count_down` package.
- Timer restarts every time a run is selected.
- Timer is paused when a dialog appears and restarted afterward.

### UI/UX
- **Dialogs** indicate game phases: welcome, six, out, and result.
- Rive-based hand animations enhance interactivity.
- Custom scorecard widget keeps track of each inning visually.

---

## 📁 Project Structure

```
lib/
├── providers/
│   └── game_provider.dart   # Core game logic
├── widgets/
│   ├── custom_dialog.dart   # Game dialogs
│   ├── hand_animation.dart  # Rive hand display
│   ├── run_button.dart      # UI buttons for runs
│   ├── score_card.dart      # Scoreboard widget
│   └── welcome_dialog.dart  # Opening dialog
├── utils/
│   └── assets.dart          # Asset paths
└── main.dart                # Entry point
```
