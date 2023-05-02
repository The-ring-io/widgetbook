import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/src/routing/router.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_core/widgetbook_core.dart';

class NavigationPanelWrapper extends StatelessWidget {
  const NavigationPanelWrapper({
    super.key,
    this.initialPath,
  });

  final String? initialPath;

  @override
  Widget build(BuildContext context) {
    return NavigationPanel(
      initialPath: initialPath,
      onNodeSelected: (path, _) {
        final router = GoRouter.of(context);
        router.mergeQueryParams({'path': path});
        context.read<UseCasesProvider>().selectUseCaseByPath(path);
      },
    );
  }
}
