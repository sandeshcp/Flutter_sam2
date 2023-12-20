import 'bloc/notification_activity_bloc.dart';
import 'models/notification_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:sandesh_s_application1/core/app_export.dart';
import 'package:sandesh_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:sandesh_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:sandesh_s_application1/widgets/app_bar/custom_app_bar.dart';

class NotificationActivityScreen extends StatelessWidget {
  const NotificationActivityScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationActivityBloc>(
        create: (context) => NotificationActivityBloc(NotificationActivityState(
            notificationActivityModelObj: NotificationActivityModel()))
          ..add(NotificationActivityInitialEvent()),
        child: NotificationActivityScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<NotificationActivityBloc, NotificationActivityState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: Column(children: [
                    _buildActivityDetails(context,
                        transactionText: "msg_transaction_nike".tr,
                        descriptionText: "msg_culpa_cillum_consectetur".tr,
                        timeText: "msg_april_30_2014_1_01".tr,
                        onTapArrowLeft: () {
                      onTapArrowLeft1(context);
                    }),
                    _buildActivityDetails(context,
                        transactionText: "msg_transaction_nike2".tr,
                        descriptionText: "msg_culpa_cillum_consectetur".tr,
                        timeText: "msg_april_30_2014_1_01".tr),
                    SizedBox(height: 5.v),
                    _buildActivityDetails(context,
                        transactionText: "msg_transaction_nike3".tr,
                        descriptionText: "msg_culpa_cillum_consectetur".tr,
                        timeText: "msg_april_30_2014_1_01".tr)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_activity".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildActivityDetails(
    BuildContext context, {
    required String transactionText,
    required String descriptionText,
    required String timeText,
    Function? onTapArrowLeft,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 94.v),
                  onTap: () {
                    onTapArrowLeft!.call();
                  }),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactionText,
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1))),
                            SizedBox(height: 11.v),
                            SizedBox(
                                width: 305.h,
                                child: Text(descriptionText,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        color: appTheme.blueGray300,
                                        height: 1.80))),
                            SizedBox(height: 9.v),
                            Text(timeText,
                                style: CustomTextStyles.bodySmallOnPrimary10
                                    .copyWith(
                                        color: theme.colorScheme.onPrimary
                                            .withOpacity(1)))
                          ])))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the previous screen.
  onTapArrowLeft1(BuildContext context) {
    NavigatorService.goBack();
  }
}
