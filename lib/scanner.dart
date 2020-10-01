import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Scanner extends StatefulWidget {
  _Scanner createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
  String qrResult = 'Not Scanned Yet';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Result',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                qrResult,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 200,
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Open Camera For Scan Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.blue, width: 3.0),
                  ),
                  onPressed: () async {
                    String scaning = await BarcodeScanner.scan();

                    setState(() {
                      qrResult = scaning;
                    });
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
