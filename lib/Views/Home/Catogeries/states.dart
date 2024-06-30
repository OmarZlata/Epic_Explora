import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../States/Aswan/Aswan_tab_bar.dart';
import '../../States/RedSea/Red_Sea_tab_bar.dart';
import '../../States/alex/Alex_tab_bar.dart';
import '../../States/cairo/Cairo_tab_bar.dart';
import '../../States/luxor/luxor_tab_bar.dart';

class States extends StatelessWidget {
  const States({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 130,
        child: Row(children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlexTabBar(),));
                },
                child: Container(
                    width: 97,
                    height: 97,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(fit: BoxFit.fill,
                        image:
                        AssetImage("assets/images/alex.jpg"),
                      ),
                    )),
              ),
              Text(S.of(context).alexandria,),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CairoTabbar(),));},
                child: Container(
                    width: 97,
                    height: 97,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(fit: BoxFit.fill,
                        image:
                        AssetImage("assets/images/cairo.jpg"),
                      ),
                    )),
              ),
              Text(S.of(context).cairo,),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => RedSeaTabbar(),));},
                child: Container(
                    width: 97,
                    height: 97,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(fit: BoxFit.fill,
                        image:
                        AssetImage("assets/images/redsea.jpg"),
                      ),
                    )),
              ),
              Text(S.of(context).redSea,),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AswanTabbar(),));},
                child: Container(
                    width: 97,
                    height: 97,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(fit: BoxFit.fill,
                        image:
                        AssetImage("assets/images/Aswan.png"),
                      ),
                    )),
              ),
              Text(S.of(context).aswan,),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => LuxorTabbar(),));},
                child: Container(
                    width: 97,
                    height: 97,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(fit: BoxFit.fill,
                        image:
                        AssetImage("assets/images/luxor.jpg"),
                      ),
                    )),
              ),
              Text(S.of(context).luxor,),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ]),
      ),
    );
  }
}
