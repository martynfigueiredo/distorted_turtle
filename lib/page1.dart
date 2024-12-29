import 'package:flutter/material.dart';
import 'page2.dart';
import 'page3.dart';
import 'carousel_widget.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Column(
        children: [
          CarouselWidget(
            imageUrls: [
              'https://imgs.search.brave.com/wXVyf2XBTZaeKqfXE6uclPoKlHM3CRLPRyTYc6zUiYI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvOTIw/NDI0MzgvcGhvdG8v/Ym9laW5nLTczNy04/MDAtcGFzc2VuZ2Vy/LWpldC5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9ckFFbC1D/OUUxbzFkM0RFZ05a/NG9NVTBhMmlSOS1N/NXFHdmVTV05mdElG/TT0',
              'https://imgs.search.brave.com/1Nr-E6qd_0S2EZHtxN56nYFB0QwCeV7qO8kczGylFDE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZXVkby5pbWd1b2wu/Y29tLmJyL2MvZW50/cmV0ZW5pbWVudG8v/YzIvMjAyNC8xMi8x/OC9icmVubm8tLW1h/dGhldXMtbm8tY2xp/cGUtZGUtZGVzY2Vy/LXByYS1iYy0xNzM0/NTI2OTgzNTkwX3Yy/XzYwMHg2MDAucG5n',
              'https://gifdb.com/images/high/dame-tu-cosita-alien-dance-p9avas05fsklg33m.webp',
            ],
            boxFit: BoxFit.cover,  // You can change this value as per your needs
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
            child: Text('Go to Page 2'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
            child: Text('Go to Page 3'),
          ),
        ],
      ),
    );
  }
}
