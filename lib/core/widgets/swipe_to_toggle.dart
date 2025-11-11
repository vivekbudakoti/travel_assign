import 'package:flutter/material.dart';

class SwipeToToggle extends StatefulWidget {
  final Widget child;
  final Widget overlay;
  final VoidCallback onToggle;
  final AxisDirection direction;
  final double triggerFraction;
  final bool showTutorial;

  const SwipeToToggle({
    super.key,
    required this.child,
    required this.overlay,
    required this.onToggle,
    this.direction = AxisDirection.left,
    this.triggerFraction = 0.5,
    this.showTutorial = false,
  });

  @override
  State<SwipeToToggle> createState() => _SwipeToToggleState();
}

class _SwipeToToggleState extends State<SwipeToToggle> with SingleTickerProviderStateMixin {
  double _dragOffset = 0;
  late final AnimationController _controller;
  Animation<double>? _animation;
  bool _isTutorialRunning = false;
  bool _tutorialDone = false;

  bool get _isLeftSwipe => widget.direction == AxisDirection.left;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    if (widget.showTutorial) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _runTutorialAnimation();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateBack() {
    _animation =
        Tween<double>(begin: _dragOffset, end: 0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
          ..addListener(() {
            setState(() => _dragOffset = _animation!.value);
          });
    _controller
      ..duration = const Duration(milliseconds: 250)
      ..forward(from: 0);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details, BoxConstraints c) {
    if (_isTutorialRunning) return; // disable swipe only during tutorial

    setState(() {
      _dragOffset += details.delta.dx;
      final maxDrag = c.maxWidth * 0.6;
      _dragOffset = _dragOffset.clamp(-maxDrag, maxDrag);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details, BoxConstraints c) {
    if (_isTutorialRunning) return;

    final triggerDistance = c.maxWidth * widget.triggerFraction;
    final triggered = _isLeftSwipe ? _dragOffset < -triggerDistance : _dragOffset > triggerDistance;

    if (triggered) widget.onToggle();
    _animateBack();
  }

  Future<void> _runTutorialAnimation() async {
    _isTutorialRunning = true;

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    final screenWidth = MediaQuery.of(context).size.width;
    final tutorialDistance = (screenWidth * 0.45) * (_isLeftSwipe ? -1 : 1);

    _animation =
        Tween<double>(
          begin: 0,
          end: tutorialDistance,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubicEmphasized))..addListener(() {
          if (mounted) setState(() => _dragOffset = _animation!.value);
        });

    _controller
      ..duration = const Duration(milliseconds: 900)
      ..forward(from: 0);

    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;

    _animation =
        Tween<double>(
          begin: tutorialDistance,
          end: 0,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad))..addListener(() {
          if (mounted) setState(() => _dragOffset = _animation!.value);
        });

    _controller
      ..duration = const Duration(milliseconds: 700)
      ..forward(from: 0);

    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;

    setState(() {
      _isTutorialRunning = false;
      _tutorialDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return GestureDetector(
          onHorizontalDragUpdate: (d) => _onHorizontalDragUpdate(d, constraints),
          onHorizontalDragEnd: (d) => _onHorizontalDragEnd(d, constraints),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  alignment: _isLeftSwipe ? Alignment.centerRight : Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: widget.overlay,
                ),
              ),
              Transform.translate(offset: Offset(_dragOffset, 0), child: widget.child),
            ],
          ),
        );
      },
    );
  }
}
