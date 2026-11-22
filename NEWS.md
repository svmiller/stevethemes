# stevethemes 0.3.0

- `cmyk2hex()` and `rgb2hex()` convert different color specifications to six-digit hex triplets.
- Documentation updates

# stevethemes 0.2.0

- Add `are_fonts_installed()` for further user diagnostics.
- Add `how_to_install_fonts()` to assist the user in how to install fonts on their operating system.
- Add support for Merriweather font, which is a close cousin to the Palatino family.
- Check for installation of Merriweather upon startup.
- Add colors to `steve_hex`.
- `palettes` is used, mostly internally, for managing available palettes, defining them in `spal()`, and describing them in `swatchplot()`.
- `swatchplot()` allows you to see what colors come with various palettes in this package. `splt()` is a shortcut for it in case you're experimenting with the `{colorspace}` package as well.
- New data sets for sample graphs: `britneywork`, `brandy`, `cowwaryears`, `uspopgengroup`, `oilrents`, `imfquotas`, `SC26SE`, `anesprotect`.
- `example_plot()` has a host of new examples.
- `lighten_hex()` takes a valid RGB hex value and whitens it to be some proportion of its original value.
- `spal()` is a workhorse function, to be used with functions like `scale_fill_manual()` or `scale_color_manual()` in `{ggplot2}`, for applying color palettes from this package.
- `deut()`, `prot()`, `trit()`, `achrom()`, and `cvdplot()` are functions to simulate color palettes under varying conditions of color vision deficiency.
- `no_axes()` removes ticks and lines on the x- and y-axis. Useful if you're making a map.

# stevethemes 0.1.0

- Initial developmental release
