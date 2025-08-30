import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:profile_barsh_web/utlis/app_colors.dart';
import 'package:profile_barsh_web/utlis/app_text_styles.dart';
import 'package:profile_barsh_web/utlis/responsive.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HeroSlide {
  const _HeroSlide({
    required this.imagePath,
    required this.title,
    required this.description,
  });
  final String imagePath;
  final String title;
  final String description;
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _heroCarouselController = CarouselSliderController();
  late final List<_HeroSlide> _heroSlides = <_HeroSlide>[
    const _HeroSlide(
      imagePath: 'assets/images/house.jpg',
      title: 'الطريق إلى التميز في البناء والمقاولات',
      description:
      'مؤسسة بارشيد للمقاولات العامة تبني الثقة قبل الخرسانة، وتقدّم حلول بناء متكاملة بإدارة مشاريع احترافية وجودة تنفيذ عالية وفق أعلى معايير السلامة.',
    ),
    const _HeroSlide(
      imagePath: 'assets/images/house.jpg',
      title: 'حلول متكاملة لإدارة وتنفيذ المشاريع',
      description:
      'نخطط وننفذ ونُسلّم في الموعد ضمن الميزانية، مع التزام كامل بمعايير الجودة والسلامة في مواقع العمل.',
    ),
    const _HeroSlide(
      imagePath: 'assets/images/house.jpg',
      title: 'خبرة وموثوقية في كل مرحلة',
      description:
      'من التصميم إلى التسليم، نقدم إشرافاً هندسياً دقيقاً وجودة تنفيذ تضمن رضا العملاء.',
    ),
  ];
  int _currentHeroIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        // Hero Section
        _buildHeroSection(),
        // About Section
        _buildAboutSection(),
        // Values Section
        _buildValuesSection(),
        // Services Section
        _buildServicesSection(),
        // Testimonials Section
        _buildTestimonialsSection(),
        // FAQ Section
        _buildFAQSection(),
        // Newsletter Section
        _buildNewsletterSection(),

      ],
    );
  }


  Widget _buildHeroSection() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/p3.jpg'),
        )
      ),
      height: context.getHeight(ratioDesktop: 0.8,ratioMobile: 0.8,ratioTablet: 0.8),
      width: double.infinity,
      child: CarouselSlider(
        items: _heroSlides.map((slide) {
          return Padding(
            padding: const EdgeInsets.all(60),
            child: Row(
              children: [
                // Right content (text)
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Title with animation
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        transitionBuilder: (Widget child,
                            Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.1, 0), // من اليمين
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          slide.title,
                          key: ValueKey(slide.title),
                          style: AppTextStyles.styleBold24(context),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Description with animation
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        transitionBuilder: (Widget child,
                            Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.05, 0),
                                // من اليمين بشكل بسيط
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          slide.description,
                          key: ValueKey(slide.description),
                          style: AppTextStyles.styleRegular16(context),

                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 40),

                      const PrimaryButton(label: 'استكشف المزيد'),
                      const SizedBox(height: 40),

                      // Navigation dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List<Widget>.generate(
                            _heroSlides.length, (int idx) {
                          final bool isActive = idx == _currentHeroIndex;
                          final String label = (idx + 1).toString().padLeft(
                              2, '0');
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: isActive
                                ? Container(
                              width: context.getWidth(ratioDesktop: 0.05,ratioTablet: 0.05,ratioMobile: 0.05),
                              height: context.getHeight(ratioDesktop: 0.05,ratioTablet: 0.05,ratioMobile: 0.05),
                              decoration: const BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  label,
                                  style:AppTextStyles.styleRegular12(context),
                                ),
                              ),
                            )
                                : Text(
                              label,
                              style:AppTextStyles.styleRegular12(context),

                            ),
                          );
                        }).reversed.toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),

                // Left image with zoom effect
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      // ClipRRect(
                      //   borderRadius: const BorderRadius.only(
                      //     topLeft: Radius.circular(20),
                      //     bottomLeft: Radius.circular(20),
                      //   ),
                      //   child: TweenAnimationBuilder(
                      //     duration: const Duration(milliseconds: 1200),
                      //     tween: Tween<double>(begin: 1.0, end: 1.05),
                      //     curve: Curves.easeInOut,
                      //     builder: (context, scale, child) {
                      //       return Transform.scale(
                      //         scale: scale,
                      //         child: child,
                      //       );
                      //     },
                      //     child: Image.asset(
                      //       slide.imagePath,
                      //       fit: BoxFit.cover,
                      //       key: ValueKey(slide.imagePath),
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color:  AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: context.getWidth(ratioDesktop: 0.04,ratioTablet: 0.04,ratioMobile: 0.04),
                                    height: context.getHeight(ratioDesktop: 0.04,ratioTablet: 0.04,ratioMobile: 0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'الموقع: ابن سيناء بجانب بنك الكريمي',
                                    style:AppTextStyles.styleRegular14(context)
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'رقم الهاتف:167 496 770 (+967)',
                                    style:AppTextStyles.styleRegular14(context)
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        carouselController: _heroCarouselController,
        options: CarouselOptions(
          height: 600,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          // زمن أطول
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          // حركة أبطأ
          autoPlayCurve: Curves.easeInOutCubic,
          // انسيابية
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            setState(() {
              _currentHeroIndex = index;
            });
          },
        ),
      ),
    );
  }


  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Row(
        children: [
          // Right content
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نظرة أقرب إلى مؤسستنا للمقاولات',
                  style: AppTextStyles.styleBold24(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20),
                Text(
                  'مؤسسة بارشيد للمقاولات العامة متخصصة في تنفيذ مشاريع البناء السكني والتجاري والبنية التحتية، مع التزام كامل بالجودة والسلامة وتسليم المشاريع في وقتها.',
                  style:AppTextStyles.styleRegular16(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 40),
                const ProgressBar(label: 'رضا العملاء', value: 1.0),
                const SizedBox(height: 20),
                const ProgressBar(label: 'إنجاز المشاريع', value: 0.85),
                const SizedBox(height: 20),
                const ProgressBar(
                    label: 'الالتزام بمعايير الجودة', value: 0.95),
                const SizedBox(height: 30),
                Text(
                  'المزيد عنا',
                  style:AppTextStyles.styleRegular14(context)
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          // Left image
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.factory,
                      size: 120,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDC2626),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 70,
                  child: Text(
                    'شاهد فيديو الشركة',
                    style: AppTextStyles.styleMedium12(context)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Replaced by PetroProgressBar reusable widget

  Widget _buildValuesSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Row(
        children: [
          // Right content
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قيمنا',
                  style:AppTextStyles.styleMedium14(context)
                ),
                const SizedBox(height: 10),
                Text(
                  'نحن نؤمن بهذه الجودة',
                  style:AppTextStyles.styleBold20(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 40),
                const ValueItem(title: 'النزاهة',
                    description: 'الحفاظ على المعايير الأخلاقية'),
                const SizedBox(height: 20),
                const ValueItem(title: 'الاحترافية',
                    description: 'إدارة مشاريع دقيقة وانضباط في المواعيد'),
                const SizedBox(height: 20),
                const ValueItem(title: 'السلامة',
                    description: 'أولوية قصوى في جميع مواقع العمل'),
              ],
            ),
          ),
          const SizedBox(width: 60),
          // Left highlight
          Expanded(
            flex: 1,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: const Color(0xFFDC2626),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '10 سنوات من الخبرة\nفي صناعة الطاقة',
                  style:AppTextStyles.styleBold20(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Replaced by PetroValueItem reusable widget

  Widget _buildServicesSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          Text(
            'خدماتنا',
            style:AppTextStyles.styleBold20(context)
          ),
          const SizedBox(height: 10),
          Text(
            'حلول المقاولات العامة والبناء',
            style: AppTextStyles.styleBold24(context)
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              Expanded(
                child: ServiceCard(
                  icon: Icons.apartment,
                  title: 'المشاريع السكنية والتجارية',
                  description: 'تنفيذ المباني السكنية والتجارية وفق أعلى المعايير وبجودة تشطيبات متميزة.',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ServiceCard(
                  icon: Icons.engineering,
                  title: 'إدارة وتنفيذ المشاريع',
                  description: 'إدارة هندسية احترافية، تخطيط وتنفيذ وتسليم في الموعد ضمن الميزانية.',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ServiceCard(
                  icon: Icons.factory,
                  title: 'البنية التحتية والأعمال الخرسانية',
                  description: 'تنفيذ أعمال القواعد، الهياكل الخرسانية، والطرق وخدمات الموقع.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Replaced by PetroServiceCard reusable widget

  Widget _buildTestimonialsSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Row(
        children: [
          // Right content
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'آراء العملاء',
                  style:AppTextStyles.styleBold20(context)
                ),
                const SizedBox(height: 10),
                Text(
                  'ماذا يقول عملاؤنا عنا',
                  style: AppTextStyles.styleBold24(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) =>
                  const Icon(
                    Icons.star,
                    color: Color(0xFFDC2626),
                    size: 24,
                  )),
                ),
                const SizedBox(height: 20),
                Text(
                  '"تنفيذ المؤسسة كان دقيقاً ومواعيد التسليم منضبطة وجودة البناء ممتازة. تجربة رائعة في مشروعنا التجاري."',
                  style: AppTextStyles.styleRegular18(context).copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20),
                Text(
                  'أحمد بارشيد، مالك مشروع تجاري',
                  style:AppTextStyles.styleBold20(context)
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          // Left image
          Expanded(
            flex: 1,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 120,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Row(
        children: [
          // Right FAQ
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const PetroFaqItem(
                  question: 'ما هي اختصاصات مؤسسة بارشيد؟',
                  answer: 'ننفذ مشاريع المقاولات العامة من مبانٍ سكنية وتجارية إلى أعمال البنية التحتية والخرسانة وإدارة المشاريع.',
                  initiallyExpanded: true,
                ),
                const SizedBox(height: 20),
                const PetroFaqItem(
                  question: 'كيف تضمنون الجودة؟',
                  answer: 'نلتزم بمواصفات هندسية دقيقة، فرق إشراف ميداني، واعتماد مواد مطابقة للمواصفات مع فحوصات دورية.',
                ),
                const SizedBox(height: 20),
                const PetroFaqItem(
                  question: 'ما مناطق التغطية؟',
                  answer: 'نخدم أغلب مناطق المملكة، مع قدرة على إدارة مشاريع متعددة بالتوازي ضمن جداول زمنية واضحة.',
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          // Left content
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الأسئلة الشائعة',
                  style: AppTextStyles.styleBold20(context)
                ),
                const SizedBox(height: 10),
                Text(
                  'أسئلة من الناس',
                  style:AppTextStyles.styleBold24(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 40),
                const PrimaryButton(label: 'اطرح سؤالاً'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Replaced by PetroFaqItem reusable widget

  Widget _buildNewsletterSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Row(
        children: [
          // Right content
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'هل أنت مستعد لتحفيز مستقبلك بالطاقة؟',
                  style: AppTextStyles.styleBold24(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20),
                Text(
                  'اشترك في نشرتنا الإخبارية للمزيد من التحديثات.',
                  style:AppTextStyles.styleBold20(context),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const PrimaryButton(label: 'اشتراك'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'أدخل عنوان بريدك الإلكتروني...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) =>
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          'شعار شركة',
                          style: AppTextStyles.styleRegular10(context),
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          // Left image
          Expanded(
            flex: 1,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.factory,
                  size: 120,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
