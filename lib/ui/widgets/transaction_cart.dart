import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class TransactionCart extends StatelessWidget {
  final TransactionModel transactionModel;
  const TransactionCart(this.transactionModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
