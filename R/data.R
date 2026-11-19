#' Some Hex Triplets I Find Useful/Interesting/Fun
#'
#' This is a simple data frame with labels corresponding to hex triplets (i.e.
#' web colors) that I find useful, interesting, or fun.
#'
#' @format A data frame the following 2 variables.
#' \describe{
#' \item{\code{color}}{a character vector describing the color in question}
#' \item{\code{hex}}{a hex triplet (with preceding hashtag) of the color}
#' }
#'
#' @details Data exist to be used by \code{g_c()} in this same package.

"steve_hex"

#' CAGEMATCH Ratings of Rick Martel
#'
#' This is a simple data frame of ratings (on a 1-10 scale) of Rick Martel.
#'
#' @format A data frame the following 2 variables.
#' \describe{
#' \item{\code{date}}{a date vector for when the rating was posted on CAGEMATCH}
#' \item{\code{value}}{an individual person's rating of Rick Martel (on a 1-10 scale)}
#' }
#'
#' @details Data exist to be used an example bar chart. CAGEMATCH (stylized in
#' all caps) is an internet wrestling database, for which these ratings are fan
#' submissions. Rick Martel is an objective 10/10.

"martel_ratings"

#' GDP per Capita of Swedish Counties, 2001-2020
#'
#' This is a simple data frame of the GDP per capita of Swedish counties from
#' 2001 to 2020.
#'
#' @format A data frame the following 4 variables.
#' \describe{
#' \item{\code{nuts}}{the Nomenclature of Territorial Units for Statistics (NUTS) code for the county}
#' \item{\code{county}}{the name of the county}
#' \item{\code{year}}{the year of observation}
#' \item{\code{value}}{the GDP per capita of the county in nominal SEK}
#' }
#'
#' @details Data come from the OECD and exist to be used as a faceted line chart.

"se_counties_gdppc"

#' Kilowatt Hours per Capita and GDP per Capita, 2010
#'
#' This is a simple data frame of the GDP per capita and kilowatt hours consumed
#' per capita of over 130 sovereign states in 2010.
#'
#' @format A data frame the following 7 variables.
#' \describe{
#' \item{\code{country}}{the name of the country}
#' \item{\code{iso3c}}{the three-character ISO code of the country}
#' \item{\code{year}}{the year of observation (2010)}
#' \item{\code{kwhpc}}{the electric power consumption (kilowatt hours) per capita of the country}
#' \item{\code{gdppc}}{the GDP per capita of the country in current USD}
#' \item{\code{ln_kwhpc}}{the (log-transformed) electric power consumption (kilowatt hours) per capita of the country}
#' \item{\code{ln_gdppc}}{the (log-transformed) GDP per capita of the country in current USD}
#'
#' }
#'
#' @details Data come from a use of the \code{WDI()} function in the \pkg{WDI}
#' package. The GDP per capita data come from a combination of the World Bank
#' and OECD. The energy consumption data come from the International Energy
#' Agency. Data exist to be used in a simple scatterplot.

"kwh_gdp"

#' Correlates of War War Counts, by Year (1816-2007)
#'
#' This is a simple data set of the number of ongoing wars in a given year,
#' using the Correlates of War data.
#'
#' @format A data frame with 768 rows and three columns
#' \describe{
#' \item{\code{year}}{a numeric vector for the year}
#' \item{\code{cat}}{the type of war ("Extra-state", "Inter-state", "Intra-state", "Non-State")}
#' \item{\code{n}}{the number of ongoing wars in a year}
#' }
#'
#' @details CoW inter-state wars and intra-state wars come pre-processed in
#' \pkg{peacesciencer}. Data are version 4.0, except for intra-state wars (v. 4.1).
#'
#' @references
#'
#' Dixon, Jeffrey, and Meredith Sarkees. 2016. *A Guide to Intra-State Wars: An
#' Examination of Civil Wars, 1816-2014.* Thousand Oaks, CA: Sage.
#'
#' Sarkees, Meredith Reid, and Frank Wheldon Wayman. 2010. *Resort to War: A Data
#' Guide to Inter-State, Extra-State, Intra-State, and Non-State Wars, 1816-2007.*
#' Washington DC: CQ Press.
#'
#' @md
#'

"cowwaryears"


#' Palettes Available in This Package
#'
#' This is a simple data set I'll use for managing the available palettes in this
#' package.
#'
#' @format A data frame with two columns
#' \describe{
#' \item{\code{palette}}{the palette, as you would enter it into \code{spal()} in this package}
#' \item{\code{description}}{a description of the palette}
#' }
#'
#' @details This is mostly for internal use.
#'
#' @examples
#'
#' print(palettes)
#'
"palettes"


#' Oil Rents and GDP per Capita, Over Time
#'
#' This is a simple data set on oil rents, GDP per capita, and annual growth
#' in GDP per capita.
#'
#' @format A data frame with seven columns
#' \describe{
#' \item{\code{country}}{an English country name}
#' \item{\code{iso3c}}{a three-character ISO code}
#' \item{\code{year}}{a referent year}
#' \item{\code{decade}}{a decade}
#' \item{\code{gdppc}}{GDP per capita in constant 2015 USD}
#' \item{\code{dgdppc}}{annual growth in GDP per capita (percentage)}
#' \item{\code{orpgdp}}{oil rents as a percentage of GDP}
#' \item{\code{orcat}}{a factor of oil rents as a percentage of GDP, with six ordered categories}
#' }
#'
#' @details Data come from the World Bank's Open Data repository. Data retrieved
#' using the \pkg{WDI} package.

"oilrents"

#' U.S. Population Size, by Birth Cohort (Generation) and Race/Ethnic Category
#'
#' This is a simple data set on the population size of various racial/ethnic
#' groups across generations in the United States.
#'
#' @format A data frame with 30 rows and five columns
#' \describe{
#' \item{\code{generation}}{a character vector for the birth cohort (generation)}
#' \item{\code{gen}}{a factor vector of the `generation` column, slightly less verbose}
#' \item{\code{group}}{a race/ethnic category}
#' \item{\code{groupc}}{a slightly condensed/less verbose recode of the `group` column}
#' \item{\code{value}}{the estimated population size}
#' }
#'
#' @details Data come from the Annie E. Casey Foundation, informed by data made
#' available by the U.S. Census Bureau, Population Division.

"uspopgengroup"

#' IMF Quotas, Special Drawing Rights
#'
#' This is a simple data set on quotas held by a few key actors/groupings in
#' the International Monetary Fund.
#'
#' @format A data frame with 3234 rows and four columns
#' \describe{
#' \item{\code{cat}}{a character vector an actor/grouping of interest}
#' \item{\code{year}}{a numeric vector for the year}
#' \item{\code{value}}{the value of the quota (in millions SDRs)}
#' \item{\code{prop}}{the proportion of the quota to all available quotas in a year}
#' }
#'
#' @details Data provided by the International Monetary Fund, Fund Account.
#' Quotas determine both members' financial contributions to the Fund and the
#' bulk of their voting power, with larger quotas conferring greater influence
#' over decision-making. Although this measure does not account for the equal
#' allocation of basic votes to all members (itself about 5.5% of the overall voting
#' power), it provides a useful approximation of the distribution of voting power
#' between wealthier and poorer countries.

"imfquotas"


#' The Civilian Unemployment Rate, 2013-2018
#'
#' This is a simple data set on the monthly civilian unemployment rate in the
#' United States from 2013 to 2018. This is useful for illustrating the powerful
#' effect Britney Spears had on the job prospects of American workers.
#'
#' @format A data frame with 63 rows and two columns
#' \describe{
#' \item{\code{date}}{a date}
#' \item{\code{value}}{the civilian unemployment rate}
#' }
#'
#' @details Data from the U.S. Bureau of Labor Statistics, by way of the
#' Federal Reserve Bank of St. Louis. Inspired by a claim Donald Trump made early
#' into his first presidential tenure about how he single-handedly decreased the
#' unemployment rate in the United States. He didn't do that; Britney Spears did.

"britneywork"

#' Brandy, 1942-2017
#'
#' This is a simple data set on the yearly registration of new "Brandy"
#' registrations by the Social Security Administration.
#'
#' @format A data frame with 76 rows and 5 columns
#' \describe{
#' \item{\code{year}}{a year}
#' \item{\code{sex}}{a character of "F" for "female"}
#' \item{\code{name}}{a character, "Brandy"}
#' \item{\code{n}}{the number of new "Brandy" registrations that year}
#' \item{\code{prop}}{the proportion of all registrations of that name for that sex in that year}
#' }
#'
#' @details Data come from the Social Security Administration, by way of the
#' \pkg{babynames} package. Entries only here for names with at least 5 new
#' registrations in a year.

"brandy"


#' 2026 United States Senate election in South Carolina
#'
#' This is a simple data set on the results of the 2026 United States Senate
#' election in South Carolina.
#'
#' @format A data frame with 2185 rows and 17 columns
#' \describe{
#' \item{\code{long}}{a longitude coordinate}
#' \item{\code{lat}}{a latitude coordinate}
#' \item{\code{group}}{identifies the polygon to which a coordinate belongs}
#' \item{\code{order}}{an integer that determines the sequence in which coordinates are connected}
#' \item{\code{county}}{a county name for South Carolina}
#' \item{\code{aan}}{the number of votes Annie Andrews received in the county}
#' \item{\code{aap}}{the percentage of votes Annie Andrews received in the county}
#' \item{\code{dgn}}{the number of votes Darline Graham received in the county}
#' \item{\code{dgp}}{the percentage of votes Darline Graham received in the county}
#' \item{\code{mn}}{the vote margin in the count of votes in the county (Andrews' count minus Graham's count)}
#' \item{\code{mp}}{the vote margin in the percentage of votes in the county (Andrews' count minus Graham's count)}
#' \item{\code{tv}}{the total number of votes cast in the Senate race in the county}
#' \item{\code{pop}}{the estimated county population size from 2025}
#' \item{\code{area}}{the area of the county (in square kilometers)}
#' \item{\code{whitep}}{the percentage of the county that is white, non-hispanic, per the 2020 Census}
#' \item{\code{blackp}}{the percentage of the county that is black, non-hispanic, per the 2020 Census}
#' \item{\code{mcat}}{a factor categorizing the percentage vote margin}
#' }
#'
#' @details
#'
#' This is a Wikipedia scrape job from Nov. 18, 2026. It stands to reason this
#' information is not 100% of all votes cast, but the counting has just about
#' stopped completely and the outcome of the race is already known prior to
#' creating these data.
#'
#' The `mcat` column has values of "<= -20", "-20 to -10", "-5 to <0", ">0 to 5",
#' "5 to 10", "10 to 20", and ">= 20". Intervals are left-closed (e.g. [5, 10),
#' [10, 20)) and not the default right-closed. This doesn't matter so much in
#' cases like these as you will never observe actual integers in data like these,
#' nor will you observe actual zero.
#'

"SC26SE"

#' Support for Trade Protectionism in the U.S., 2012 and 2020
#'
#' This is a simple data set on the partisan breakdown of support for limiting
#' foreign imports to protect American workers in both 2012 and 2020.
#'
#' @format A data frame with 14 rows and 3 columns
#' \describe{
#' \item{\code{year}}{a year}
#' \item{\code{pid7}}{a factor of partisanship on a 7-point scale from "Strong Democrat" to "Strong Republican"}
#' \item{\code{prop}}{the proportion of repsondents in that category that would favor limiting imports}
#' }
#'
#' @details Data come from the American National Election Studies in 2012 and
#' 2020. Be mindful that, if given the option, most Americans will say they
#' haven't thought too much about this question.

"anesprotect"
