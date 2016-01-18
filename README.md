# comcur

The following do-files build data sets giving information on which countries enter a currency union.

The do-files are first created by [de Sousa (2012)](http://dx.doi.org/10.1016/j.econlet.2012.07.009), with the aim to replicate the [Glick and Rose (2002)](http://dx.doi.org/10.1016/S0014-2921(01)00202-1) dataset. I made modifications to correct some errors.

For more details, please visit de Sousa's [website](http://jdesousa.univ.free.fr/data.htm#CurrencyUnions).

## Usage

Copy all the files into the same folder. Then, run `mastercu.do`.

## List of files

1. The list of countries in .dta: [`iso3.dta`](https://github.com/rangerqu/comcur/blob/master/iso3.dta)
2. A do-file to form every pairwise combination of countries with years (from 1948 to 2015): [`1.iso3year.do`](https://github.com/rangerqu/comcur/blob/master/1.iso3year.do)
3. A do-file to determine which "multinational currency"  (e.g. US$, euro, ...) a country is using between 1948 and 2015. [`2.currency.do`](https://github.com/rangerqu/comcur/blob/master/2.currency.do)
4. A do-file to build a currency union dummy: [`3.dummycu.do`](https://github.com/rangerqu/comcur/blob/master/3.dummycu.do)
5. A do-file to execute all of the individual do-files in the appropriate order: [`mastercu.do`](https://github.com/rangerqu/comcur/blob/master/mastercu.do)

## Changelog

### 2016-01-18

- Fixed an error on the currency union of Malaysia, Singapore, and Brunei.