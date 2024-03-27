
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../utils/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
                child: ProfileBannerView()
            ),

            /// Sapcer
            const SliverToBoxAdapter(
              child: SizedBox(
                height: kMarginMedium3,
              ),
            ),

            /// Profile List View
            SliverPadding(
                padding: const EdgeInsets.all(kMarginLarge),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  ProfileList item = profileList[index];
                  return Column(
                    children: [

                      /// Spacer
                      const SizedBox(
                        height: kMarginMedium2,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            item.icon,
                            width: kMargin30,
                            height: kMargin30,
                          ),
                          const SizedBox(
                            width: kMarginMedium,
                          ),
                          Text(
                            item.label,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: kTextRegular2x),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: kSecondaryTextColor,
                            size: kMargin30,
                          )
                        ],
                      ),

                      /// Spacer
                      const SizedBox(
                        height: kMarginMedium2,
                      ),

                      const Divider(
                        color: kSecondaryTextColor,
                      )
                    ],
                  );
                },
                  childCount: 7
                ),
              ),
            )
        ]
        ),
      )
    );
  }
}

/// Profile Banner View
class ProfileBannerView extends StatelessWidget {
  const ProfileBannerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(kProfileBackground),

        Positioned(
          top: kMargin30,
          right: 0,
          left: 0,
          child: Image.asset(kBigProfileIcon,
            width: kMargin100,
            height: kMargin100,
          ),
        ),
        Positioned(
          bottom: kMargin40,
          right: 0,
          left: 0,
          child: Image.asset(kLogInSignUpButton,
            width: 200,
            height: kMargin40,
          ),
        )
      ],
    );
  }
}

/// Profile List View
class ProfileList{
  String icon;
  String label;

  ProfileList(this.icon, this.label);
}

List<ProfileList> profileList = [
  ProfileList(kHistoryIcon, "Purchase History"),
  ProfileList(kOfferIcon, "Offer"),
  ProfileList(kGiftCardIcon, "Gift Card"),
  ProfileList(kLocationIcon, "Location"),
  ProfileList(kPaymentIcon, "Payment"),
  ProfileList(kHelpIcon, "Help and Support"),
  ProfileList(kLogOutIcon, "Logout"),
];

class ProfileListView extends StatelessWidget {
   ProfileListView({super.key});

  final List<ProfileList> profileList = [
    ProfileList(kHistoryIcon, "Purchase History"),
    ProfileList(kOfferIcon, "Offer"),
    ProfileList(kGiftCardIcon, "Gift Card"),
    ProfileList(kLocationIcon, "Location"),
    ProfileList(kPaymentIcon, "Payment"),
    ProfileList(kHelpIcon, "Help and Support"),
    ProfileList(kLogOutIcon, "Logout"),
  ];

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: List.generate(
          profileList.length,
          (index) {
            ProfileList item = profileList[index];
           return Column(
             children: [

               /// Spacer
               const SizedBox(
                 height: kMarginMedium3,
               ),
               Row(
                      children: [
                        Image.asset(
                          item.icon,
                          width: kMargin30,
                          height: kMargin30,
                        ),
                        const SizedBox(
                          width: kMarginMedium,
                        ),
                        Text(
                          item.label,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: kTextRegular2x),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: kSecondaryTextColor,
                          size: kMargin30,
                        )
                      ],
                    ),
               
               /// Spacer
               const SizedBox(
                 height: kMarginMedium3,
               ),
               
               const Divider(
                 color: kSecondaryTextColor,
               )
             ],
           );
              }),
    );
  }
}

