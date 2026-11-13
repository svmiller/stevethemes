# IMF Quotas, Special Drawing Rights

This is a simple data set on quotas held by a few key actors/groupings
in the International Monetary Fund.

## Usage

``` r
imfquotas
```

## Format

A data frame with 3234 rows and four columns

- `cat`:

  a character vector an actor/grouping of interest

- `year`:

  a numeric vector for the year

- `value`:

  the value of the quota (in millions SDRs)

- `prop`:

  the proportion of the quota to all available quotas in a year

## Details

Data provided by the International Monetary Fund, Fund Account. Quotas
determine both members' financial contributions to the Fund and the bulk
of their voting power, with larger quotas conferring greater influence
over decision-making. Although this measure does not account for the
equal allocation of basic votes to all members (itself about 5.5 power),
it provides a useful approximation of the distribution of voting power
between wealthier and poorer countries.
