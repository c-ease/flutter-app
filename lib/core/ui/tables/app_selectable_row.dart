import 'package:flutter/material.dart';
import 'package:quote/core/ui/tables/app_row_action.dart';

class AppSelectableRow extends StatefulWidget {
  const AppSelectableRow({
    super.key,
    required this.selected,
    required this.onTap,
    required this.child,
    this.actions = const [],
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;
  final List<AppRowAction> actions;

  @override
  State<AppSelectableRow> createState() => _AppSelectableRowState();
}

class _AppSelectableRowState extends State<AppSelectableRow>
    with SingleTickerProviderStateMixin {
  static const Duration _animationDuration = Duration(milliseconds: 250);

  late final AnimationController _controller;

  late final Animation<double> _animation;

  bool _showActionTray = false;

  @override
  void initState() {
    super.initState();

    _showActionTray = widget.selected && widget.actions.isNotEmpty;

    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
      value: _showActionTray ? 1 : 0,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(covariant AppSelectableRow oldWidget) {
    super.didUpdateWidget(oldWidget);

    final shouldShowActions = widget.selected && widget.actions.isNotEmpty;

    final previouslyShowedActions =
        oldWidget.selected && oldWidget.actions.isNotEmpty;

    if (shouldShowActions && !previouslyShowedActions) {
      setState(() {
        _showActionTray = true;
      });

      _controller.forward();
    } else if (!shouldShowActions && previouslyShowedActions) {
      _controller.reverse().then((_) {
        if (!mounted) return;

        final shouldStillHide = !widget.selected || widget.actions.isEmpty;

        if (shouldStillHide) {
          setState(() {
            _showActionTray = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: widget.selected
          ? colorScheme.primaryContainer
          : colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(child: widget.child),

              if (_showActionTray)
                AnimatedBuilder(
                  animation: _animation,
                  child: _ActionTray(
                    actions: widget.actions,
                    colorScheme: colorScheme,
                  ),
                  builder: (context, child) {
                    return ClipRect(
                      child: Align(
                        widthFactor: _animation.value,
                        alignment: Alignment.centerRight,
                        child: Transform.translate(
                          offset: Offset(24 * (1 - _animation.value), 0),
                          child: Opacity(
                            opacity: _animation.value,
                            child: child,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionTray extends StatelessWidget {
  const _ActionTray({required this.actions, required this.colorScheme});

  final List<AppRowAction> actions;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalDivider(width: 32, thickness: 1, color: colorScheme.outline),
        ...actions.map(
          (action) => Tooltip(
            message: action.tooltip,
            child: IconButton(
              icon: Icon(action.icon),
              onPressed: action.onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
