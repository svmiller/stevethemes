# Correlates of War War Counts, by Year (1816-2007)

This is a simple data set of the number of ongoing wars in a given year,
using the Correlates of War data.

## Usage

``` r
cowwaryears
```

## Format

A data frame with 768 rows and three columns

- `year`:

  a numeric vector for the year

- `cat`:

  the type of war ("Extra-state", "Inter-state", "Intra-state",
  "Non-State")

- `n`:

  the number of ongoing wars in a year

## Details

CoW inter-state wars and intra-state wars come pre-processed in
peacesciencer. Data are version 4.0, except for intra-state wars (v.
4.1).

## References

Dixon, Jeffrey, and Meredith Sarkees. 2016. *A Guide to Intra-State
Wars: An Examination of Civil Wars, 1816-2014.* Thousand Oaks, CA: Sage.

Sarkees, Meredith Reid, and Frank Wheldon Wayman. 2010. *Resort to War:
A Data Guide to Inter-State, Extra-State, Intra-State, and Non-State
Wars, 1816-2007.* Washington DC: CQ Press.
