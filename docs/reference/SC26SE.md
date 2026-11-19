# 2026 United States Senate election in South Carolina

This is a simple data set on the results of the 2026 United States
Senate election in South Carolina.

## Usage

``` r
SC26SE
```

## Format

A data frame with 2185 rows and 17 columns

- `long`:

  a longitude coordinate

- `lat`:

  a latitude coordinate

- `group`:

  identifies the polygon to which a coordinate belongs

- `order`:

  an integer that determines the sequence in which coordinates are
  connected

- `county`:

  a county name for South Carolina

- `aan`:

  the number of votes Annie Andrews received in the county

- `aap`:

  the percentage of votes Annie Andrews received in the county

- `dgn`:

  the number of votes Darline Graham received in the county

- `dgp`:

  the percentage of votes Darline Graham received in the county

- `mn`:

  the vote margin in the count of votes in the county (Andrews' count
  minus Graham's count)

- `mp`:

  the vote margin in the percentage of votes in the county (Andrews'
  count minus Graham's count)

- `tv`:

  the total number of votes cast in the Senate race in the county

- `pop`:

  the estimated county population size from 2025

- `area`:

  the area of the county (in square kilometers)

- `whitep`:

  the percentage of the county that is white, non-hispanic, per the 2020
  Census

- `blackp`:

  the percentage of the county that is black, non-hispanic, per the 2020
  Census

- `mcat`:

  a factor categorizing the percentage vote margin

## Details

This is a Wikipedia scrape job from Nov. 18, 2026. It stands to reason
this information is not 100% of all votes cast, but the counting has
just about stopped completely and the outcome of the race is already
known prior to creating these data.

The `mcat` column has values of "\<= -20", "-20 to -10", "-5 to \<0",
"\>0 to 5", "5 to 10", "10 to 20", and "\>= 20". Intervals are
left-closed (e.g. \[5, 10), \[10, 20)) and not the default right-closed.
This doesn't matter so much in cases like these as you will never
observe actual integers in data like these, nor will you observe actual
zero.
