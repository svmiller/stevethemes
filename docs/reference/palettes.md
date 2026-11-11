# Palettes Available in This Package

This is a simple data set I'll use for managing the available palettes
in this package.

## Usage

``` r
palettes
```

## Format

A data frame with two columns

- `palette`:

  the palette, as you would enter it into
  [`spal()`](http://svmiller.com/reference/spal.md) in this package

- `description`:

  a description of the palette

## Details

This mostly for internal use.

## Examples

``` r

print(palettes)
#> # A tibble: 23 × 2
#>    palette description                                      
#>    <chr>   <chr>                                            
#>  1 d-suFB  "Diverging Palette (SU \"Fire\" to SU Blue)"     
#>  2 d-suBF  "Diverging Palette (SU Blue to SU \"Fire\")"     
#>  3 d-suRB  "Diverging Palette (SU Red to SU Blue)"          
#>  4 d-suBR  "Diverging Palette (SU Blue to SU Red)"          
#>  5 d-suBO  "Diverging Palette (SU Blue to SU Olive)"        
#>  6 d-suOB  "Diverging Palette (SU Olive to SU Blue)"        
#>  7 d-suFW  "Diverging Palette (SU \"Fire\" to SU \"Water\")"
#>  8 d-suWF  "Diverging Palette (SU \"Water\" to SU \"Fire\")"
#>  9 s-suB   "Sequential Palette (SU Blue)"                   
#> 10 s-suO   "Sequential Palette (SU Olive)"                  
#> # ℹ 13 more rows
```
