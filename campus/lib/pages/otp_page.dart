import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController _otpController = TextEditingController();
  bool _otpSent = false;

  void _sendOTP() {
    // Implement OTP sending functionality here
    // Set _otpSent to true when OTP is sent
    setState(() {
      _otpSent = true;
    });
  }

  void _resendOTP() {
    // Implement OTP resending functionality here
    setState(() {
      _otpSent = true;
    });
  }

  void _submitForm() {
    // Implement form submission functionality here
    String otp = _otpController.text;
    // Validate the OTP and proceed accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter OTP:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'OTP',
                hintText: 'Enter the received OTP',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _otpSent ? 'OTP sent!' : '',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: _otpSent ? _resendOTP : _sendOTP,
                  child: Text(
                    _otpSent ? 'Resend OTP' : 'Send OTP',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
