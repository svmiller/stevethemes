# Changelog

## stevethemes 0.2.0

- Add
  [`are_fonts_installed()`](https://svmiller.com/reference/are_fonts_installed.md)
  for further user diagnostics.
- Add
  [`how_to_install_fonts()`](https://svmiller.com/reference/how_to_install_fonts.md)
  to assist the user in how to install fonts on their operating system.
- Add support for Merriweather font, which is a close cousin to the
  Palatino family.
- Check for installation of Merriweather upon startup.
- Add colors to `steve_hex`.
- `palettes` is used, mostly internally, for managing available
  palettes, defining them in
  [`spal()`](https://svmiller.com/reference/spal.md), and describing
  them in
  [`swatchplot()`](https://svmiller.com/reference/swatchplot.md).
- [`swatchplot()`](https://svmiller.com/reference/swatchplot.md) allows
  you to see what colors come with various palettes in this package.
  [`splt()`](https://svmiller.com/reference/swatchplot.md) is a shortcut
  for it in case you’re experimenting with the
  [colorspace](https://colorspace.R-Forge.R-project.org/) package as
  well.
- New data sets for sample graphs: `britneywork`, `brandy`,
  `cowwaryears`, `uspopgengroup`, `oilrents`, `imfquotas`.
- [`example_plot()`](https://svmiller.com/reference/example_plot.md) has
  a host of new examples.
- [`lighten_hex()`](https://svmiller.com/reference/lighten_hex.md) takes
  a valid RGB hex value and whitens it to be some proportion of its
  original value.
- [`spal()`](https://svmiller.com/reference/spal.md) is a workhorse
  function, to be used with functions like
  [`scale_fill_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
  or
  [`scale_color_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
  in [ggplot2](https://ggplot2.tidyverse.org), for applying color
  palettes from this package.
- [`deut()`](https://svmiller.com/reference/cvd-simulator.md),
  [`prot()`](https://svmiller.com/reference/cvd-simulator.md),
  [`trit()`](https://svmiller.com/reference/cvd-simulator.md),
  [`achrom()`](https://svmiller.com/reference/cvd-simulator.md), and
  [`cvdplot()`](https://svmiller.com/reference/cvd-simulator.md) are
  functions to simulate color palettes under varying conditions of color
  vision defiency.

## stevethemes 0.1.0

CRAN release: 2023-01-31

- Initial developmental release
