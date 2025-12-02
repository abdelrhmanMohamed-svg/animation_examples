# Flutter Animation Examples

A comprehensive Flutter project showcasing a variety of animation techniques available in the Flutter framework. This application serves as a practical guide for developers looking to implement both simple and complex animations in their Flutter apps.

## Description

This project is a collection of six distinct animation examples, each demonstrating a specific concept. The user can navigate through the examples using a swipeable `PageView`. The examples cover implicit animations (using built-in widgets and `TweenAnimationBuilder`), explicit animations (using `AnimationController`, `AnimatedBuilder`, and built-in `Transition` widgets), and animations using external libraries like Lottie.

**Technologies & Packages Used:**

- **Flutter:** The core framework for building the application.
- **Dart:** The programming language used.
- **lottie:** A library for parsing Adobe After Effects animations exported as JSON and rendering them natively.
- **Provider:** (Implicitly used through Flutter's state management).

## Features

This project demonstrates the following animation features:

- **Lottie Animation:**
  - Displays a complex animation from a `business.json` file using the `lottie` package. This is a great example of how to integrate pre-made, high-quality animations.

- **Built-in Implicit Animations:**
  - `AnimatedContainer`: Animates changes in size, padding, and color of a container.
  - `AnimatedOpacity`: Animates the opacity of a widget to show or hide it gracefully.
  - A button press triggers these animations with random values, showcasing how easy it is to create smooth transitions.

- **Implicit Animation with `TweenAnimationBuilder`:**
  - Animates a `ColorFilter` over an image of the sun. This example shows how to animate any property of any widget by using `TweenAnimationBuilder` without needing to manage an `AnimationController`.

- **Built-in Explicit Animation (`RotationTransition`):**
  - Uses an `AnimationController` to create a continuous rotation effect on an image. The user can tap the screen to play or pause the animation.

- **Custom Explicit Animation with `AnimatedBuilder`:**
  - Creates a UFO scene with an animated light beam. The beam is a `RadialGradient` animated by changing its `stops` property inside an `AnimatedBuilder`, which listens to an `AnimationController`. This demonstrates how to build complex, custom animations.

- **Custom Explicit Animation with `ClipPath`:**
  - Features a grid of colors. When a color is selected, the background transitions to the new color using a circular reveal effect. This is achieved by animating the `Path` of a `CustomClipper` within an `AnimatedBuilder`.

## Project Structure

The project follows a standard Flutter application structure:

```
├───assets
│   ├───images
│   └───lottie
├───lib
│   ├───main.dart
│   ├───root.dart
│   ├───models
│   │   └───color_model.dart
│   ├───pages
│   │   ├───anthor_example_explicit_animtaion.dart
│   │   ├───built_in_explicit_animation.dart
│   │   ├───explicit_animation_build.dart
│   │   ├───implicit_byTweenAnimation.dart
│   │   ├───implicity_built_in_example.dart
│   │   └───lottie_example.dart
│   └───widgets
│       ├───grid_item.dart
│       └───page_indicator.dart
├───android
├───ios
├───web
├───windows
├───linux
├───macos
└───pubspec.yaml
```

- **`assets/`**: Contains all static assets, such as images and Lottie JSON files.
- **`lib/`**: The main source code directory.
  - **`main.dart`**: The entry point of the application.
  - **`root.dart`**: The main screen of the app, which contains the `PageView` to navigate between animation examples.
  - **`models/`**: Contains data model classes.
  - **`pages/`**: Each file in this directory is a separate animation example screen.
  - **`widgets/`**: Contains reusable custom widgets used across different pages.
- **`android/`, `ios/`, `web/`, etc.**: Platform-specific configuration and build files.
- **`pubspec.yaml`**: The project's configuration file, including dependencies.

## Installation & Setup

To run this project locally, follow these steps:

1.  **Prerequisites:**
    - Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
    - An emulator or physical device to run the app.

2.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd animation_examples
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the application:**
    ```bash
    flutter run
    ```

## Usage

Once the application is running, you can swipe left or right to navigate between the different animation examples. Each screen is self-contained and demonstrates a specific animation technique. Some screens have buttons or require user interaction (like tapping) to trigger the animations.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new animation examples, feel free to open an issue or submit a pull request.

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'Add some feature'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
*This README was generated by an AI assistant.*