# Oil Rents and GDP per Capita, Over Time

This is a simple data set on oil rents, GDP per capita, and annual
growth in GDP per capita.

## Usage

``` r
oilrents
```

## Format

A data frame with seven columns

- `country`:

  an English country name

- `iso3c`:

  a three-character ISO code

- `year`:

  a referent year

- `gdppc`:

  GDP per capita in constant 2015 USD

- `dgdppc`:

  annual growth in GDP per capita (percentage)

- `orpgdp`:

  oil rents as a percentage of GDP

- `orcat`:

  a factor of oil rents as a percentage of GDP, with six ordered
  categories

## Details

Data come from the World Bank's Open Data repository. Data retrieved
using the WDI package.
