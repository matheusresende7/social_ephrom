import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:social_ephrom/views/navegacao/InitialHome.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  List<PageViewModel> getPages() {
    return [

      contentPage(
        text: 'Compartilhe suas ideias',
        icon: Icons.lightbulb,
        content: 'E acompanhe o que seus colegas estão pensando.',
      ),

      contentPage(
        text: 'Confira nossas novidades',
        icon: Icons.rss_feed,
        content: 'Acompanhe nossas principais novidades em tempo real.',
      ),

      contentPage(
        text: 'Troque conhecimento em projetos',
        icon: Icons.phonelink,
        content: 'Receba e forneça conhecimento em projetos da empresa.',
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: IntroductionScreen(
        pages: getPages(),
        onDone: () {
          Get.offAll(
            InitialHome(),
            transition: Transition.zoom,
            duration: Duration(milliseconds: 1500),
          );
        },
        globalBackgroundColor: Theme.of(context).accentColor,
        showSkipButton: true,

        skip: Text(
          'Pular',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),

        next: Icon(
          Icons.arrow_forward_ios,
          size: 35,
          color: Theme.of(context).primaryColor,
        ),

        done: Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(130),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Ok',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        dotsDecorator: DotsDecorator(
            size: Size.square(10),
            activeSize: Size(35, 10),
            activeColor: Theme.of(context).primaryColor,
            color: Colors.grey[350],
            spacing: EdgeInsets.symmetric(horizontal: 5),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            )
        ),

      ),

    );

  }

  PageViewModel contentPage ({
    String text,
    IconData icon,
    String content,
  }) {
    return PageViewModel(
      titleWidget: Column(
        children: [

          SizedBox(height: MediaQuery.of(context).size.width * 0.5),//ou height: 180

          Text(
            text,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),

        ],
      ),

      bodyWidget: Icon(
        icon,
        size: 200,
        color: Theme.of(context).primaryColor,
      ),

      footer: Text(
        content,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),

    );
  }

}
