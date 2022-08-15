import 'package:app_interview/app/domain/entities/repository_entity.dart';
import 'package:app_interview/app/presentation/widgets/label_information_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    Key? key,
    required this.item,
    required this.pieChartList,
  }) : super(key: key);

  final RepositoryEntity item;
  final List<PieChartSectionData> pieChartList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelInformation(
                text: item.name,
                label: '${AppLocalizations.of(context)!.project}: '),
            const SizedBox(
              height: 5,
            ),
            LabelInformation(
                text: item.description ?? '',
                label: '${AppLocalizations.of(context)!.description}: '),
            const SizedBox(
              height: 5,
            ),
            LabelInformation(
                text: item.cloneUrl,
                label: '${AppLocalizations.of(context)!.clone}: '),
            const SizedBox(
              height: 5,
            ),
            LabelInformation(
                text: item.license != null ? item.license!.name : '',
                label: '${AppLocalizations.of(context)!.license}: '),
            const SizedBox(
              height: 5,
            ),
            pieChartList.any((element) => element.value > 0)
                ? AspectRatio(
                    aspectRatio: 16 / 9,
                    child: PieChart(
                      PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 25,
                          sections: pieChartList),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
