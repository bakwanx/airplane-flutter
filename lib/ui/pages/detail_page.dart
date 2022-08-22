import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {

  final DestinationModel destinationModel;

  const DetailPage(this.destinationModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget backgroundImage(){
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destinationModel.imageUrl)
          )
        ),
      );
    }

    Widget customShadow(){
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(
          top: 236
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ]
          )
        ),
      );
    }

    Widget content(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        child: Column(
          children: [
            //NOTE: EMBLEM
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(
                top: 30
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(destinationModel.imageUrl)
                )
              ),
            ),

            //NOTE: TITLE
            Container(
              margin: EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinationModel.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destinationModel.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(
                          right: 2
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png')
                          )
                        ),
                      ),
                      Text(
                        "${destinationModel.rating}",
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: ABOUT
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Berada di jalur jalan provinsi yang \nmenghubungkan Denpasar \nSingaraja serta letaknya yang dekat \ndengan Kebun Raya Eka Karya \nmenjadikan tempat Bali.",
                    style: blackTextStyle.copyWith(
                      height: 2
                    ),
                  ),

                  //NOTE: PHOTOS
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      PhotoItem(imageUrl:"assets/image_photo1.png"),
                      PhotoItem(imageUrl:"assets/image_photo2.png"),
                      PhotoItem(imageUrl:"assets/image_photo3.png")
                    ],
                  ),

                  //NOTE: INTEREST
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Interest",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      InterestItem(text:"Kids Park"),
                      InterestItem(text: "Honor Bridge",),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InterestItem(text: "City Museum",),
                      InterestItem(text: "Central Mall",),
                    ],
                  )
                ],
              ),
            ),

            //NOTE: PRICE & BOOK BUTTON
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 30
              ),
              child: Row(
                children: [
                  //NOTE: PRICE
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0
                        ).format(destinationModel.price),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 18
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "per orang",
                        style: greyTextStyle.copyWith(
                            fontWeight: light
                        ),
                      )
                    ],
                  )
                  ),

                  //NOTE: BOOK BUTTON
                  CustomButton(
                    title: "Book Now",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSeatPage(destinationModel)));
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
