import 'package:app_interview/app/domain/entities/repository_entity.dart';
import 'package:app_interview/app/presentation/states/repositories_state.dart';
import 'package:app_interview/app/presentation/stores/repositories_store.dart';
import 'package:app_interview/app/presentation/widgets/repository_card_widget.dart';
import 'package:app_interview/core/theme/app_colors.dart';
import 'package:app_interview/locator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoriesPage extends StatelessWidget {
  final String userId;
  late RepositoriesStore controller;
  late List<PieChartSectionData> pieChartList;

  RepositoriesPage({
    Key? key,
    required this.userId,
  }) : super(key: key) {
    controller = getInstance.get<RepositoriesStore>()..init(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myRepositories),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Observer(
          builder: (context) {
            var state = controller.state;

            if (state is ErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedState) {
              if (state.list.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.noRepositories),
                );
              }
              return _buildList(state.list, context);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List<RepositoryEntity> list, BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => const SizedBox(
        height: 10,
      ),
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        pieChartList = [];

        pieChartList.addAll([
          PieChartSectionData(
              value: item.forks.toDouble(),
              title: AppLocalizations.of(context)!.forks,
              color: AppColor.darkBlue),
          PieChartSectionData(
              value: item.openIssues.toDouble(),
              title: AppLocalizations.of(context)!.issues,
              color: AppColor.secondColor),
          PieChartSectionData(
              value: item.watchers.toDouble(),
              title: AppLocalizations.of(context)!.watchers,
              color: AppColor.greenWater),
          PieChartSectionData(
              value: item.stargazersCount.toDouble(),
              title: AppLocalizations.of(context)!.stargazers,
              color: AppColor.yellow),
        ]);

        return RepositoryCard(item: item, pieChartList: pieChartList);
      },
    );
  }
}
