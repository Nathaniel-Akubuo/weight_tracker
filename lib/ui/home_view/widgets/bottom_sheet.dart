import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_tracker/models/weight_model.dart';
import 'package:weight_tracker/ui/home_view/home_viewmodel.dart';

import '../../../constants/ui_helpers.dart';
import '../../../widgets/buttons/rounded_button.dart';
import '../../../widgets/input/custom_textfield.dart';

class AddWeightEntrySheet extends StatelessWidget {
  final WeightModel? weightModel;

  const AddWeightEntrySheet({
    Key? key,
    this.weightModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: SingleChildScrollView(
          padding: kMainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceRegular,
              Center(
                child: Text(
                  'ENTER WEIGHT',
                  style: kHomeTitleTextStyle,
                ),
              ),
              verticalSpaceMedium,
              CustomTextFormField.regular(
                onChanged: (value) => model.weight = value,
                initialValue: weightModel == null ? '' : weightModel!.weight,
                keyboardType: TextInputType.number,
                hintText: 'Weight (in kg)',
              ),
              RoundedButton(
                color: kOrange,
                isLoading: model.isBusy,
                textColor: kWhite,
                text: weightModel == null ? 'ADD ENTRY' : 'EDIT ENTRY',
                onPressed: () {
                  if (weightModel == null) {
                    model.addEntry();
                  } else {
                    model.editEntry(weightModel!);
                  }
                },
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
