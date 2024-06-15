// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/resources/colors_app.dart';

class WitingShimmerList extends StatefulWidget {


  const WitingShimmerList({super.key});

  @override
  _WitingShimmerListState createState() => _WitingShimmerListState();
}

class _WitingShimmerListState extends State<WitingShimmerList> {
  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.only(left: 11,right: 11),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget shimmerUi(){
    return Shimmer.fromColors(
      baseColor: primaryColor,
      highlightColor: primary2Color,
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        // padding: const EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 68.0,
                height: 68.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        itemCount: 16,
      ),
    );
  }
}
