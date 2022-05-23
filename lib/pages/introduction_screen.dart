import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:trackingapp/main.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Penyebaran COVID-19',
          body:
              'Dari akhir 2019, dunia mulai dilanda pandemi bernama Covid-19 yang membuat banyak orang sakit bahkan menimbulkan korban jiwa.',
          image: Center(
            child: Lottie.asset('assets/lottie/dunia.json'),
          ),
        ),
        PageViewModel(
          title: 'Upaya Pencegahan',
          body:
              'Banyak orang mulai menyadari pentingnya kesehatan dan mulai menjaga pola hidup seperti menggunakan masker, cuci tangan dan lain-lain.',
          image: Center(
            child: Lottie.asset('assets/lottie/shield-virus.json'),
          ),
        ),
        PageViewModel(
          title: 'Tujuan Aplikasi',
          body:
              'Aplikasi ini dibuat untuk membantu orang dalam mencari tempat layanan covid-19 terdekat agar penderita mendapatkan penanganan yang cepat. ',
          image: Center(
            child: Lottie.asset('assets/lottie/map-splash.json'),
          ),
        ),
      ],
      showNextButton: true,
      showSkipButton: true,
      skip: Text("Skip"),
      next: Text("Next"),
      done: Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onDone: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return TrackApp();
            },
          ),
        );
      },
    );
  }
}
