import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kriptobakkal/widgets/widgets.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import '../constants/color_constant.dart';
import '../custom_icons/flutter_custom_icon.dart';
import '../models/models.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height, _width;

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    var _list = TimeSeriesChart.withSampleData();

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Card Account Section
          Padding(
            padding: EdgeInsets.only(left: 24, top: 8, bottom: 16),
            child: Text(
              'Merhaba, Marshall!',
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kBlackColor,
              ),
            ),
          ),
          Container(
            height: _width *0.44,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 16, right: 8, bottom: 8),
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    height: _height * 0.4,
                    width:  _width * 0.7,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: cards[index].bgColor,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 10,
                            spreadRadius: 4,
                            offset: Offset(0.0, 8.0))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                cards[index].type,
                                height: 30,
                                width: 50,
                              ),
                              //SvgPicture.asset(cards[index].cardBackground)
                              Text(
                                cards[index].name,
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: cards[index].firstColor),
                              ),
                            ],
                          ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: TimeSeriesChart(_list.seriesList)),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                // Text(
                                //   'Your Balance',
                                //   textAlign: TextAlign.start,
                                //   style: GoogleFonts.nunito(
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w400,
                                //       color: cards[index].firstColor),
                                // ),
                                Text(
                                  'USD ' + cards[index].balance,
                                  style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: cards[index].secondColor),
                                )
                              ],
                            ),
                            SvgPicture.asset(
                              cards[index].moreIcon,
                              height: 24,
                              width: 24,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),

          // Last Transaction Section
          Padding(
              padding: EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Last Transactions',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                  Text(
                    'See all transactions',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor,
                    ),
                  ),
                ],
              )),
          Container(
            height: _height * 0.33,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
              scrollDirection: Axis.horizontal,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 190,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x04000000),
                          blurRadius: 10,
                          spreadRadius: 10,
                          offset: Offset(0.0, 8.0))
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 16,
                        left: 16,
                        child: SvgPicture.asset(transactions[index].type),
                        height: 24,
                        width: 24,
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child:
                        SvgPicture.asset('assets/svg/mastercard_bg.svg'),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Text(
                          transactions[index].name,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: transactions[index].colorType),
                        ),
                      ),
                      Positioned(
                        top: 64,
                        left: 16,
                        child: Text(
                          transactions[index].signType +
                              'USD ' +
                              transactions[index].amount,
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: transactions[index].colorType),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 106,
                        child: Text(
                          transactions[index].information,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 48,
                        child: Text(
                          transactions[index].recipient,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kBlackColor),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 22,
                        child: Text(
                          transactions[index].date,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor),
                        ),
                      ),
                      Positioned(
                        right: 14,
                        bottom: 16,
                        child: Image.asset(
                          transactions[index].card,
                          height: 22,
                          width: 33,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          // Top Up Section
          Padding(
            padding:
            EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
            child: Text(
              'Top Up Again',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kBlackColor,
              ),
            ),
          ),
          Container(
            height: 304,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 16),
              itemCount: wallets.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  height: 68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x04000000),
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: Offset(0.0, 8.0))
                      ],
                      color: kWhiteColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kWhiteGreyColor,
                              image: DecorationImage(
                                image: AssetImage(wallets[index].walletLogo),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                wallets[index].name,
                                style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor),
                              ),
                              Text(
                                wallets[index].wallet,
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: kGreyColor),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            wallets[index].walletNumber,
                            style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: kGreyColor),
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
