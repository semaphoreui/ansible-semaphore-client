import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:semaphore/components/app_bar.dart';
import 'package:semaphore/components/app_drawer.dart';
import 'package:semaphore/state/projects/template.dart';

class TemplateScreen extends ConsumerWidget {
  const TemplateScreen({super.key});
  static const name = 'templates';
  static const path = '/projects/:pid/templates';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    // final currentProject = ref.watch(currentProjectProvider);
    final templateList = ref.watch(templateListProvider);

    return Scaffold(
      drawer: const LocalDrawer(),
      appBar: const LocalAppBar(title: 'Task Template'),
      floatingActionButton: NeumorphicFloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: NeumorphicBackground(
        child: SafeArea(
          child: PlutoGrid(
            mode: PlutoGridMode.readOnly,
            columns: templateList.columns,
            rows: templateList.rows,
            noRowsWidget: null,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              ref
                  .read(templateListProvider.notifier)
                  .setStateManager(event.stateManager);
            },
            onChanged: (PlutoGridOnChangedEvent event) {},
            configuration: templateList.configurationWithTheme(theme),
          ),
        ),
      ),
    );
  }
}
