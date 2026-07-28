
import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';

Padding button({required text1, required isLoading1, required VoidCallback? tap}) {
  bool isLoading = isLoading1;
  String text = text1;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xff373737),
                //     Color(0xff6A6A6A),
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),

                color: Color(0xff5f2e96)
                ),
            child: ElevatedButton(
              onPressed: tap,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                  elevation: 0,
                  foregroundColor: kWhite,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Loading please wait...',
                          style: TextStyle(color: kWhite),
                        )
                      ],
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                          color: kWhite),
                    ),
            ),
          ),
        ),
      ],
    ),
  );
}
