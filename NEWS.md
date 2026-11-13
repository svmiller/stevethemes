# stevethemes 0.2.0

- Add `are_fonts_installed()` for further user diagnostics.
- Add `how_to_install_fonts()` to assist the user in how to install fonts on their operating system.
- Add support for Merriweather font, which is a close cousin to the Palatino family.
- Check for installation of Merriweather upon startup.
- Add colors to `steve_hex`.
- `palettes` is used, mostly internally, for managing available palettes and describing them in `swatchplot()`.
- `swatchplot()` allows you to see what colors come with various palettes in this package.
- New data sets for sample graphs: `britneywork`, `brandy`, `cowwaryears`, `uspopgengroup`, `oilrents`, `imfquotas`.
- `example_plot()` has a host of new examples.
- `lighten_hex()` takes a valid RGB hex value and whitens it to be some proportion of its original value.
- `spal()` is a workhorse function, to be used with functions like `scale_fill_manual()` or `scale_color_manual()` in `{ggplot2}`, for applying color palettes from this package.

# stevethemes 0.1.0

- Initial developmental release
