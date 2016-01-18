/******************************************************************************************************************* 
A do-file to determine a bilateral currency union dummy (comcur).
(comcur is unity if country of origin and country of destination use a common currency at time t). 

Please read the FAQ at http://jdesousa.univ.free.fr/data/FAQcu for questions about the definition of 
the currency union and its transitivity.

First version: 4th March 2009
This version: 29th December 2014
Jose de Sousa (http://jdesousa.univ.free.fr/data)
*
If you use these do-files in your work, please cite: 
De Sousa, Jose (2012), "The currency union effect on trade is decreasing over time", Economics Letters 117(3), pp. 917–920.
*
* Disclaimer 
These data are to the best of my knowledge correct. If you double check them to ensure their accuracy and find errors 
I would appreciate it if you would inform me at jose.de-sousa@upsud.fr. Thank you.
******************************************************************************************************************/
*
** Create a dyad X year matrix
use tempyear, clear
scalar nyear = _N
*
use iso3.dta, clear
* add BLX for Belgium-Luxembourg together (see 2.currency.do)
expand 2 if iso3=="BEL", gen(tag)
replace iso3="BLX" if tag==1
drop tag
rename iso3 iso_d
save tempiso_d,replace 
*
use iso3.dta, clear
* add BLX for Belgium-Luxembourg together (see 2.currency.do)
expand 2 if iso3=="BEL", gen(tag)
replace iso3="BLX" if tag==1
drop tag
rename iso3 iso_o
duplicates report iso_o
scalar ncty = _N
cross using tempiso_d
duplicates report iso_o iso_d
* sample expected: 
assert _N == ncty*ncty
*
cross using tempyear
* sample expected: 
assert _N == ncty*ncty*nyear
save dyadyear, replace
*
use tempcurrency, clear
rename iso3 iso
sort iso year
save tempmona,replace 
*
** tempmona.dta is monadic, now create a dyadic dataset
use dyadyear,clear
rename iso_o iso
sort iso year
merge m:1 iso year using tempmona
drop _merge
rename currency1 cur1_o
rename currency2 cur2_o
rename currency3 cur3_o
rename iso iso_o 
rename iso_d iso
sort iso year
merge iso year using tempmona
tab _merge
keep if _merge==3
drop _merge
rename currency1 cur1_d
rename currency2 cur2_d
rename currency3 cur3_d
rename iso iso_d
count

** Create the dummy comcur
gen byte comcur = cur1_o == cur1_d & cur1_o!="_" 
label var comcur "=1 if iso_o and iso_d use a common currency at year t"
replace comcur = 1 if cur2_o == cur2_d & cur2_o!="_" 
replace comcur = 1 if cur3_o == cur3_d & cur3_o!="_" 
replace comcur = 1 if cur1_o == cur2_d & cur1_o!="_"
replace comcur = 1 if cur1_o == cur3_d & cur1_o!="_"
replace comcur = 1 if cur2_o == cur1_d & cur2_o!="_"
replace comcur = 1 if cur2_o == cur3_d & cur2_o!="_"
replace comcur = 1 if cur3_o == cur1_d & cur3_o!="_"
replace comcur = 1 if cur3_o == cur2_d & cur3_o!="_"

** and if iso_o == iso_d ?
* if you have no internal trade data
drop if iso_o == iso_d
* and iy you have such flows then
* replace comcur = 1 if iso_o==iso_d
* everyone has a common currency with themselves.

keep  iso_o iso_d year comcur
sort iso_o iso_d year
saveold comcur, replace

erase tempyear.dta
erase tempmona.dta
erase tempcurrency.dta
erase tempiso_d.dta
erase dyadyear.dta
erase tempcty.dta
exit

