import 'package:cab_rider/datamodels/prediction.dart';
import 'package:flutter/cupertino.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../brand_colors.dart';

class PredictionTile extends StatelessWidget {
  final Prediction prediction;
  PredictionTile({this.prediction});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              OMIcons.locationOn,
              color: BrandColors.colorDimText,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prediction.mainText,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    prediction.secondaryText,
                    style: TextStyle(
                        fontSize: 12, color: BrandColors.colorDimText),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
