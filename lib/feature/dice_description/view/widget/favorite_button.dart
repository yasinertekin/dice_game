part of '../dice_description_page.dart';

final class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.categoryDices.contains(categoryDices)
                ? Icons.favorite
                : Icons.favorite_border,
            color: ProjectColor.white.toColor,
          ),
          iconSize: context.dynamicHeight(0.07),
          onPressed: () {
            if (state.categoryDices.contains(categoryDices)) {
              context.read<FavoriteCubit>().removeFavorite(categoryDices);
            } else {
              context.read<FavoriteCubit>().addFavorite(categoryDices);
            }
          },
        );
      },
    );
  }
}
