import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_appbar.dart';

class TermsConditionsScreen extends StatelessWidget {
  static const String routeName = '/terms_conditions_screen';
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Terms & Privacy Policy',
      ),  // appBar: const CustomAppBarBackButton(title: "Terms & Conditions"),
      body: Container(
    decoration: const BoxDecoration(
    gradient: AppColors.gradientScafoldBackground,
    ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: (){
                //         Navigator.pop(context);
                //       },
                //       child: Container(
                //         padding: EdgeInsets.all(7.w),
                //         decoration: BoxDecoration(
                //           color: AppColors.primary,
                //           borderRadius: BorderRadius.circular(12.r),
                //           border: Border.all(
                //             color: AppColors.white,
                //           ),
                //         ),
                //         child: Icon(CupertinoIcons.chevron_left, size: 20.sp),
                //       ),
                //     ),
                //     SizedBox(width: 12.w),
                //     Text('Terms & Privacy Policy', style: AppFonts.black20w400),
                //   ],
                // ),
                // SizedBox(height: 25.h,),
                _buildSection(
                  number: '1',
                  title: 'Personal Information:',
                  children: [
                    _buildSubSection(
                      title: 'Location Information:',
                      bullets: [
                        'Name, phone number, email address, and delivery address',
                        'Payment information (processed by third-party payment gateways)',
                        'Profile picture (optional)',
                      ],
                    ),
                    _buildSubSection(
                      title: 'Location Information:',
                      bullets: [
                        'Precise or approximate location to show nearby restaurants and enable delivery',
                      ],
                    ),
                    _buildSubSection(
                      title: 'Usage and Technical Information:',
                      bullets: [
                        'Device ID, IP address, operating system, app version',
                        'Order history, browsing activity, and preferences',
                        'Crash reports and performance data',
                      ],
                    ),
                    _buildSubSection(
                      title: 'Information from Third Parties:',
                      bullets: [
                        'Information received from Google, Apple, or other login providers',
                      ],
                    ),
                  ],
                ),

                _buildSection(
                  number: '2',
                  title: 'How We Use Your Information',
                  intro: 'We use the collected information to:',
                  bullets: [
                    'Process and deliver your food orders',
                    'Show you relevant restaurants and menus',
                    'Provide customer support and respond to your queries',
                    'Improve our services and personalize your experience',
                    'Ensure security and prevent fraud',
                    'Comply with legal obligations',
                  ],
                ),

                _buildSection(
                  number: '3',
                  title: 'Sharing of Your Information',
                  intro: 'We may share your information with:',
                  bullets: [
                    'Restaurants and Delivery Partners: To fulfill your orders',
                    'Payment Processors: For secure payment processing',
                    'Service Providers: Who help us operate the app (hosting, analytics, marketing)',
                    'Legal Authorities: When required by law or to protect our rights',
                    'Business Transfers: In case of merger, acquisition, or sale of assets',
                    'Comply with legal obligations',
                  ],
                  footer: 'We do not set your personal data to third parties.',
                ),

                _buildSection(
                  number: '4',
                  title: 'Data Security',
                  body:
                      'We use reasonable security measures to protect your information. However, no method of transmission or storage is 100% secure. We cannot guarantee absolute security.',
                ),

                _buildSection(
                  number: '5',
                  title: 'Cookies and Tracking Technologies',
                  intro: 'We use cookies and similar technologies to:',
                  bullets: [
                    'Remember your preferences',
                    'Analyze app usage',
                    'Deliver personalized content',
                  ],
                  footer:
                      'You can manage cookie preferences through your device settings.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section with number + title
  Widget _buildSection({
    required String number,
    required String title,
    String? intro,
    String? body,
    String? footer,
    List<String>? bullets,
    List<Widget>? children,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Numbered title
          Text('$number. $title', style: AppFonts.black16w600),
          SizedBox(height: 8.h),

          // Optional intro line
          if (intro != null) ...[
            Text(intro, style: AppFonts.black14w500),
            SizedBox(height: 6.h),
          ],

          // Optional plain body text
          if (body != null) ...[
            Text(body, style: AppFonts.grey13w400),
            SizedBox(height: 6.h),
          ],

          // Optional bullet list
          if (bullets != null) ...bullets.map((b) => _buildBullet(b)),

          // Optional sub-sections
          if (children != null) ...children,

          // Optional footer note
          if (footer != null) ...[
            SizedBox(height: 6.h),
            Text(footer, style: AppFonts.black13w400),
          ],
        ],
      ),
    );
  }

  /// Sub-section with bold title + bullets
  Widget _buildSubSection({
    required String title,
    required List<String> bullets,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppFonts.black14w600),
          SizedBox(height: 4.h),
          ...bullets.map((b) => _buildBullet(b)),
        ],
      ),
    );
  }

  /// Single bullet point row
  Widget _buildBullet(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•  ',
            style: AppFonts.purple15w400,
          ),
          Expanded(child: Text(text, style: AppFonts.grey13w400)),
        ],
      ),
    );
  }
}
