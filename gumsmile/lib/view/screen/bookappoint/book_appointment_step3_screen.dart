import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/data/data.dart';
import 'package:gumsmile/view/screen/listappointmentscreen.dart';
import 'package:gumsmile/view/screen/promoscreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BookAppointmentStep3Screen extends StatefulWidget {
  const BookAppointmentStep3Screen({super.key});

  @override
  State<BookAppointmentStep3Screen> createState() => _BookAppointmentStep3ScreenState();
}

enum PaymentMethod { card, cod, ovo, dana, spay, gopay }

class _BookAppointmentStep3ScreenState extends State<BookAppointmentStep3Screen> {
  PaymentMethod? _paymentItem = PaymentMethod.card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'STEP 3 OUT OF 3', 
          style: Constant().textAppBar
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 800,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(225, 239, 254, 254), Colors.white])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 10),
                child: Center(
                    child: Text('Total Cost',
                        style: GoogleFonts.lexendDeca(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
              Center(
                  child: Text('IDR 100000',
                      style: GoogleFonts.libreBaskerville(
                          fontSize: 50, color: const Color(0xFF00DEE4)))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PromoScreen()));
                        },
                        child: Text(
                          'Voucher in here!',
                          style: GoogleFonts.notoSerif(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFEB1F1F),
                              decoration: TextDecoration.underline),
                        ))),
              ),
              Center(
                  child: Text('Choose Your Payment Method',
                      style: GoogleFonts.lexendDeca(
                          fontSize: 20, color: Color(0xFF676767)))),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 40.0),
                child: Column(
                  children: [
                    RadioListTile<PaymentMethod>(
                      value: PaymentMethod.card,
                      groupValue: _paymentItem,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          _paymentItem = value;
                        });
                      },
                      title: Text('Credit Card/Debit Card',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12, color: Colors.black)),
                    ),
                    RadioListTile<PaymentMethod>(
                      value: PaymentMethod.cod,
                      groupValue: _paymentItem,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          _paymentItem = value;
                        });
                      },
                      title: Text('Cash On Delivey',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12, color: Colors.black)),
                    ),
                    RadioListTile<PaymentMethod>(
                      value: PaymentMethod.ovo,
                      groupValue: _paymentItem,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          _paymentItem = value;
                        });
                      },
                      title: Text('OVO',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12, color: Colors.black)),
                    ),
                    RadioListTile<PaymentMethod>(
                      value: PaymentMethod.dana,
                      groupValue: _paymentItem,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          _paymentItem = value;
                        });
                      },
                      title: Text('DANA',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12, color: Colors.black)),
                    ),
                    RadioListTile<PaymentMethod>(
                      value: PaymentMethod.spay,
                      groupValue: _paymentItem,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          _paymentItem = value;
                        });
                      },
                      title: Text('ShopeePay',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12, color: Colors.black)),
                    ),
                    RadioListTile<PaymentMethod>(
                      value: PaymentMethod.gopay,
                      groupValue: _paymentItem,
                      onChanged: (PaymentMethod? value) {
                        setState(() {
                          _paymentItem = value;
                        });
                      },
                      title: Text('GoPay',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12, color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB3F7F9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 150),
                            elevation: 0),
                        onPressed: () => _onAlertDialogSuccess(context),
                        child: Text(
                          'Pay',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF454545)),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onAlertDialogSuccess(BuildContext context) {
    Alert(
        context: context,
        title: "Payment Success",
        desc: "Thank you for booking an appointment at our practice",
        content: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'As soon as our staff sees your request they will inform you about your time slot. You’ll get a notification in this application',
              style: GoogleFonts.josefinSans(
                  fontSize: 12, color: const Color(0x87000000)),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
        image: Image.asset('assets/check.gif', width: 120),
        style: AlertStyle(
            titleStyle: GoogleFonts.josefinSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0069E4)),
            descStyle: GoogleFonts.josefinSans(
                fontSize: 14, fontWeight: FontWeight.w700),
            descPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            backgroundColor: Colors.grey[50]),
        buttons: [
          DialogButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ListAppointmentScreen()));
              },
              color: const Color(0xFFB3F7F9),
              radius: BorderRadius.circular(100.0),
              child: Text('List of appointments',
                  style: GoogleFonts.lexendDeca(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF454545)))),
        ]).show();
  }
}
