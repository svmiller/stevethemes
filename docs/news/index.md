# Changelog

## stevethemes 0.2.0

- Add
  [`are_fonts_installed()`](http://svmiller.com/reference/are_fonts_installed.md)
  for further user diagnostics.
- Add
  [`how_to_install_fonts()`](http://svmiller.com/reference/how_to_install_fonts.md)
  to assist the user in how to install fonts on their operating system.
- Add support for Merriweather font, which is a close cousin to the
  Palatino family.
- Check for installation of Merriweather upon startup.
- Add colors to `steve_hex`.
- `palettes` is used, mostly internally, for managing available palettes
  and describing them in
  [`swatchplot()`](http://svmiller.com/reference/swatchplot.md).
- [`swatchplot()`](http://svmiller.com/reference/swatchplot.md) allows
  you to see what colors come with various palettes in this package.
- New data sets for sample graphs: `britneywork`, `brandy`,
  `cowwaryears`, `uspopgengroup`, `oilrents`, `imfquotas`.
- [`lighten_hex()`](http://svmiller.com/reference/lighten_hex.md) takes
  a valid RGB hex value and whitens it to be some proportion of its
  original value.
- [`spal()`](http://svmiller.com/reference/spal.md) is a workhorse
  function, to be used with functions like
  [`scale_fill_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
  or
  [`scale_color_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
  in [ggplot2](https://ggplot2.tidyverse.org), for applying color
  palettes from this package.

## stevethemes 0.1.0

CRAN release: 2023-01-31

- Initial developmental release
