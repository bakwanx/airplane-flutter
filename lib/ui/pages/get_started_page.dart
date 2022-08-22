import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child:  Image.asset(
              'assets/image_get_started.png',
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 41
                  ),
                  child: Text(
                    "Explore new world with us and let yourself get an amazing experiences",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(
                  title: "Get Started",
                  width: 220,
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 80
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/sign-up');
                  },
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
