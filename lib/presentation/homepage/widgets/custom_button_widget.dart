import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  final String buttonText;
  final Function callback;
  final bool borderReverse;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? accentColor;
  const CustomButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.callback,
      required this.borderReverse,
      this.height,
      this.width,
      this.backgroundColor,
      this.accentColor})
      : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  /// Initalize Animation - shrink onTap
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final themeText = Theme.of(context).textTheme;

    /// set buttonheights to create shadow
    double? buttonHeight1;
    double? buttonHeight2;

    if (widget.height != null) buttonHeight1 = 55;
    if (widget.height != null) buttonHeight2 = 50;

    return SizedBox(
      height: widget.height ?? 75,
      width: widget.width ?? 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          /// Call callback and play animation onTap
          onTap: () {
            widget.callback();
            animationController.forward().then((_) {
              animationController.reverse();
            });
          },
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              /// Shrink and Grow onTap
              return Transform.scale(
                scale: animation.value,
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 10),

                  /// Stack two Container for shadow effect
                  child: Stack(children: [
                    Center(
                      child: Container(
                        height: buttonHeight1 ?? 55,
                        width: widget.width ?? 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          /// if accentcolor is set, its always accentcolor
                          /// if not and borderreverse = true: shadow is darkblue
                          /// else shadow is lightblue
                          color: widget.borderReverse
                              ? (widget.accentColor ?? themeColor.onSecondary)
                              : (widget.accentColor ??
                                  themeColor.primaryContainer),
                        ),
                      ),
                    ),
                    Container(
                      height: buttonHeight2 ?? 50,
                      width: widget.width ?? 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,

                          /// if backgroundColor is set, its always accentcolor
                          /// if not and borderreverse = true: background is lightblue
                          /// else background is transparent
                          color: widget.borderReverse
                              ? (widget.backgroundColor ??
                                  themeColor.onSecondary)
                              : (widget.backgroundColor ?? Colors.transparent),
                        ),

                        /// if backgroundColor is set, its always accentcolor
                        /// if not and borderreverse = true: background is dark = primary
                        /// else background is lightblue
                        color: widget.borderReverse
                            ? (widget.backgroundColor ?? themeColor.primary)
                            : (widget.backgroundColor ??
                                themeColor.onSecondary),
                      ),
                      child: Center(
                        child: Text(
                          widget.buttonText,
                          style: themeText.displaySmall!.copyWith(
                              color: widget.borderReverse
                                  ? themeColor.outline
                                  : themeColor.primary),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
