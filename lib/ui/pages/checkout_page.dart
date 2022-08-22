import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class CheckoutPage extends StatelessWidget {

  final TransactionModel transactionModel;

  const CheckoutPage(this.transactionModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image_checkout.png"))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Tangerang",
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Ciliwung",
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: kWhiteColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE: DESTINATION TILE
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(
                      right: 16
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              transactionModel.destinationModel.imageUrl
                          )
                      )
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionModel.destinationModel.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transactionModel.destinationModel.city,
                        style: greyTextStyle.copyWith(
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
                      transactionModel.destinationModel.rating.toString(),
                      style: blackTextStyle.copyWith(
                          fontWeight: medium
                      ),
                    )
                  ],
                )
              ],
            ),

            //NOTE: BOOKING DETAILS TEXT
            Container(
              margin: EdgeInsets.only(
                  top: 30
              ),
              child: Text(
                "Booking Details",
                style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold
                ),
              ),
            ),

            //NOTE: BOOKING DETAILs ITEMS
            BookingDetailsItem(
              title: "Traveler",
              valueText: "${transactionModel.amountOfTraveler} person",
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: "Seat",
              valueText: transactionModel.selectedSeats,
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: "Insurance",
              valueText: transactionModel.insurance ? "YES" : "NO",
              valueColor: transactionModel.insurance ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: "Refundable",
              valueText: transactionModel.refundable ? "YES" : "NO",
              valueColor: transactionModel.refundable ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: "VAT",
              valueText: "${(transactionModel.vat * 100).toStringAsFixed(0)}",
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: "Price",
              valueText: NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0
              ).format(transactionModel.price),
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: "Grand Total",
              valueText: NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0
              ).format(transactionModel.grandTotal),
              valueColor: kPrimaryColor,
            )
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/image_card.png',
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icon_plane.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0
                                ).format(state.userModel.balance),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Current Balance',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor, content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if(state is TransactionLoading){
            return Container(
              margin: EdgeInsets.only(
                top: 30
              ),
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: "Pay Now",
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transactionModel);
            },
            margin: EdgeInsets.only(
                top: 30
            ),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
            top: 30,
            bottom: 30
        ),
        child: Text(
          "Terms and Conditions",
          style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payNowButton(),
            tacButton()
          ],
        ));
  }
}
