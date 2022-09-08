
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  String continent;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    Key? key,
    required this.name,
    required this.continent,
    required this.image,
    required this.todayRecovered,
    required this.critical,
    required this.active,
    required this.test,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.black87,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * .050,),
                    child: Container(
                      width: MediaQuery.of(context).size.height*0.48,
                      height: 140,
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),


                  SizedBox(
                    height: 150,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(widget.continent,style: GoogleFonts.ubuntuMono(letterSpacing: 1,fontSize: 25),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 179,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(widget.name,style: GoogleFonts.ubuntuMono(letterSpacing: 1,fontSize: 21),
                      )),
                  )

                ],
              ),

              SizedBox(height:MediaQuery.of(context).size.height * 0.02 ,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Divider(thickness: 2,),
              ),
              SizedBox(height:MediaQuery.of(context).size.height * 0.03 ,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResusableContainer(title: 'Cases', value: widget.totalCases.toString(), ccolor: Color(0xFFEE8F90), dicon:Icons.coronavirus),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResusableContainer(title: 'Recovered', value: widget.totalRecovered.toString(), ccolor: Color(0xFF6F93AC), dicon: Icons.thumb_up),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResusableContainer(title: 'Deaths', value: widget.totalDeaths.toString(), ccolor: Color(0xFFBB90C8), dicon: Icons.dangerous),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResusableContainer(title: 'Active', value: widget.active.toString(), ccolor: Color(0xFF7AC1C1), dicon: Icons.masks),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResusableContainer(title: 'Tests', value: widget.test.toString(), ccolor: Color(0xFFCDC0C0), dicon: Icons.face),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResusableContainer(title: 'Critical', value: widget.critical.toString(), ccolor: Color(0xFFC76392), dicon: Icons.emergency),
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}

class ResusableContainer extends StatelessWidget {
  String title, value;
  IconData dicon;
  Color ccolor;
  ResusableContainer({Key? key, required this.title, required this.value,required this.ccolor,required this.dicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 120,
              width: MediaQuery.of(context).size.height*0.23,
              color: ccolor,


              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(dicon,size: 29,color: Colors.black,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:Text(title,
                              style: GoogleFonts.ubuntu(fontSize: 20,letterSpacing: 1,)

                              )),
                      ],
                    ),
                    ),


                  Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Align(
                    alignment: Alignment.bottomRight,
                    child:Text(value,
                        style: GoogleFonts.ubuntu(fontSize: 20,letterSpacing: 1)),
                   ),
                 ),
                ],
              ),


    );
  }
}
