import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/utils/story.dart';

class BoardResetButton extends StatefulWidget {
  const BoardResetButton({
    Key? key,
    this.onPressed,
    required this.audioPath,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String audioPath;

  @override
  State<BoardResetButton> createState() => _BoardResetButtonState();
}

class _BoardResetButtonState extends State<BoardResetButton> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _disposeAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FancyButton(
      onPressed: widget.onPressed != null ? _handlePress : null,
      listenedKey: ListenedKeys.rKey,
      description: GameStory.getLine('reset_board'),
    );
  }

  void _playAudio() async {
    await _audioPlayer.setAsset(widget.audioPath);
    await _audioPlayer.play();
  }

  void _disposeAudio() async {
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
  }

  void _handlePress() {
    _playAudio();
    widget.onPressed!.call();
  }
}
