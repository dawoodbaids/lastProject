import 'package:flutter/material.dart';

// Define the IconType enum outside the class
enum IconType {
  play,
  pause,
  forward,
  // Add other icon types as needed
}

class AnimatedIconButton extends StatefulWidget {
  final IconType iconType;

  const AnimatedIconButton({Key? key, required this.iconType}) : super(key: key);

  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define IconData based on IconType
    IconData iconData;
    switch (widget.iconType) {
      case IconType.play:
        iconData = Icons.play_arrow;
        break;
      case IconType.pause:
        iconData = Icons.pause;
        break;
      case IconType.forward:
        iconData = Icons.forward;
        break;
      // Handle other icon types if needed
      default:
        iconData = Icons.play_arrow; // Default to play icon
    }

    return IconButton(
      onPressed: () {
        // Toggle animation on button press
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause, // Example: Replace with appropriate animated icon
        progress: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Example usage:
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icon Button Example'),
      ),
      body: const Center(
        child: AnimatedIconButton(
          iconType: IconType.play,
        ),
      ),
    ),
  ));
}
