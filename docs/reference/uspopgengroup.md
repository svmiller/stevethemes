# U.S. Population Size, by Birth Cohort (Generation) and Race/Ethnic Category

This is a simple data set on the population size of various
racial/ethnic groups across generations in the United States.

## Usage

``` r
uspopgengroup
```

## Format

A data frame with 30 rows and five columns

- `generation`:

  a character vector for the birth cohort (generation)

- `gen`:

  a factor vector of the \`generation\` column, slightly less verbose

- `group`:

  a race/ethnic category

- `groupc`:

  a slightly condensed/less verbose recode of the \`group\` column

- `value`:

  the estimated population size

## Details

Data come from the Annie E. Casey Foundation, informed by data made
available by the U.S. Census Bureau, Population Division.
