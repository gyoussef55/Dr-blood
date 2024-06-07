import 'package:cancer_blood/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(
            imgPath: 'assets/1.png',
            title: 'THE LATEST TRIAL FOR LEUKEMIA',
            subtitle:
                'Under the scrutiny of the World Health Organization, the doctor will assess a blend of therapies for leukemia. This includes cutting-edge gene treatments, precision chemotherapy, immunotherapy, and holistic care strategies. Integrating traditional herbal remedies alongside modern medicine may offer a multifaceted approach to combatting leukemia\'s complexities. The goal is to enhance patient outcomes and well-being through a comprehensive treatment regimen.',
          ),
          CustomCard(
            imgPath: 'assets/2.png',
            title:
                'Professor of Immunotherapy and Oncology at the Fred Hutchinson Institute',
            subtitle:
                'A research team, led by Stanley Riedel, a researcher in immunotherapy and oncology at the Fred Hutchinson Cancer Research Center in the United States of America, was able to invent a new treatment that may contribute to eliminating leukemia.',
          ),
          CustomCard(
            imgPath: 'assets/3.png',
            title:
                'Cancer may result from the absence of some beneficial microbes',
            subtitle:
                'Cancer may develop due to dysbiosis, an imbalance in the microbiome, where the absence of certain beneficial microbes can contribute to inflammation, compromised immune response, and DNA damage, potentially leading to the initiation and progression of cancerous cells.',
          ),
          CustomCard(
            imgPath: 'assets/4.png',
            title: 'Types of blood cancer (leukemia)',
            subtitle:
                'Acute Leukemia: It grows and worsens very quickly, and may be life-threatening. In this type, the bone marrow begins producing large numbers of immature white blood cells called blasts, which enter the bloodstream. These immature cells quickly compete with normal cells in the bloodstream, and do not do their job of fighting infection, stopping bleeding or causing anemia, making the body very weak.',
          ),
        ],
      ),
    );
  }
}
