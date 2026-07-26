import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/airtime/models/models.dart';

class AirtimeReceiptScreen extends StatefulWidget {
  final String networkImage;
  final String networkName;
  // final int index;
  final AirtimePurchaseModel airtimePurchaseModel;
  const AirtimeReceiptScreen({super.key, required this.networkImage, required this.airtimePurchaseModel, required this.networkName});

  @override
  State<AirtimeReceiptScreen> createState() => _AirtimeReceiptScreenState();
}

class _AirtimeReceiptScreenState extends State<AirtimeReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  
                  fontSize: SizeConfig.blockSizeVertical! * 2.5,
                ),
          // kEncodeSansBold.copyWith(
          //   color: Color(0xff332052),
          //   fontSize: SizeConfig.blockSizeVertical! * 2.5,
          // ),
        ),
        centerTitle: true,
        //Theme.of(context).textTheme.bodyLarge
        actions: [
          SizedBox(
            width: sizeHorizontal * 8,
            height: sizeVertical * 4,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Color(0xff332052),
              ),
              child: Text(
                'Share',
                style: kEncodeSansMedium.copyWith(
                  color: kWhite,
                  fontSize: SizeConfig.blockSizeVertical! * 1.5,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: sizeHorizontal * 20,
            height: sizeVertical * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: Color(0xff332052),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: sizeHorizontal * 5,
                      height:  sizeVertical * 4,
                      child: Image(image: AssetImage(widget.networkImage))),
                    Spacer(),
                    Text('JeroPay'),
                  ],
                ),
                Text("${widget.networkName} API RESPONSE.",style: 
                // kEncodeSansBold.copyWith(
                //   color: kBlack,
                //   fontSize: SizeConfig.blockSizeVertical! * 1.5,
                // ),
                Theme.of(context).textTheme.bodyLarge?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.5,)    
                ),
                Text(widget.airtimePurchaseModel.data!.response!,style: 
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.5,
                ),textAlign: TextAlign.center,),
                Text(widget.airtimePurchaseModel.data!.requestId!,style: 
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.5,
                ),textAlign: TextAlign.center,),
                
                Text("Sponsor",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.5,
                ),textAlign: TextAlign.center,),
              ],
            ),
          ),
          SizedBox(height: sizeVertical * 5,),
          Row(children: [
            Text('Transaction ID',style:
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Expanded(
                  child: Text(widget.airtimePurchaseModel.data!.id!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: kBlack,
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),),
                ),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Status',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text(widget.airtimePurchaseModel.data!.status!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Phone',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text(widget.airtimePurchaseModel.data!.phoneNumber!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Product',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text(widget.networkName,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Description',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Expanded(
                  child: Text(widget.airtimePurchaseModel.data!.detail!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: kBlack,
                    fontSize: SizeConfig.blockSizeVertical! * 1.8,
                  ),),
                ),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Amount',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text('\u20A6${widget.airtimePurchaseModel.data!.amount}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Previous Balance',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text('\u20A6${widget.airtimePurchaseModel.data!.oldBalance}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('New Balance',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text('\u20A6${widget.airtimePurchaseModel.data!.newBalance}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
          SizedBox(height: sizeVertical * 1,),
           Row(children: [
            Text('Transaction Date',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),Spacer(), Text(widget.airtimePurchaseModel.data!.dateAndTime!.substring(0, 10),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: kBlack,
                  fontSize: SizeConfig.blockSizeVertical! * 1.8,
                ),),
          ],),
          SizedBox(height: sizeVertical * 1,),
          Divider(),
        ],
      ),
    );
  }
}
