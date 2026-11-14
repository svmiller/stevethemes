# Kilowatt Hours per Capita and GDP per Capita, 2010

This is a simple data frame of the GDP per capita and kilowatt hours
consumed per capita of over 130 sovereign states in 2010.

## Usage

``` r
kwh_gdp
```

## Format

A data frame the following 7 variables.

- `country`:

  the name of the country

- `iso3c`:

  the three-character ISO code of the country

- `year`:

  the year of observation (2010)

- `kwhpc`:

  the electric power consumption (kilowatt hours) per capita of the
  country

- `gdppc`:

  the GDP per capita of the country in current USD

- `ln_kwhpc`:

  the (log-transformed) electric power consumption (kilowatt hours) per
  capita of the country

- `ln_gdppc`:

  the (log-transformed) GDP per capita of the country in current USD

## Details

Data come from a use of the `WDI()` function in the WDI package. The GDP
per capita data come from a combination of the World Bank and OECD. The
energy consumption data come from the International Energy Agency. Data
exist to be used in a simple scatterplot.
