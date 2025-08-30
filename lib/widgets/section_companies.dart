import 'package:flutter/material.dart';

class SectionCompanies extends StatelessWidget {
  const SectionCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          'شركاتنا',
          style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: 240,
          height: 4,
          color: Colors.brown.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final int columns = isMobile
                  ? 1
                  : constraints.maxWidth > 1200
                      ? 4
                      : 3;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 4 / 3,
                ),
                itemCount: _companies.length,
                itemBuilder: (context, index) {
                  final Company company = _companies[index];
                  return _CompanyCard(company: company);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CompanyCard extends StatelessWidget {
  const _CompanyCard({required this.company});
  final Company company;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(company.imagePath, fit: BoxFit.cover),
          Container(color: const Color(0xFF000000).withValues(alpha: 0.35)),
          Align(
            alignment: Alignment.center,
            child: Text(
              company.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class Company {
  Company({required this.name, required this.imagePath});
  final String name;
  final String imagePath;
}

final List<Company> _companies = <Company>[
  Company(name: 'العمودي للعقارات', imagePath: 'assets/images/company_1.jpg'),
  Company(name: 'العمودي للمقاولات', imagePath: 'assets/images/company_2.jpg'),
  Company(name: 'العمودي للسياحة', imagePath: 'assets/images/company_3.jpg'),
  Company(name: 'العمودي للزراعة', imagePath: 'assets/images/company_4.jpg'),
  Company(name: 'العمودي للتجارة', imagePath: 'assets/images/company_5.jpg'),
  Company(name: 'العمودي للإعلام', imagePath: 'assets/images/company_6.jpg'),
];


