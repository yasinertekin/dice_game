part of '../settings_page.dart';

final class _PremiumButton extends StatelessWidget {
  const _PremiumButton({
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6E48AA), Color(0xFF9D50BB)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomText(
              text: text,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                color: ProjectColor.white.toColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
