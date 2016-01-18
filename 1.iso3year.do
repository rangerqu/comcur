/*****************************************************************************************************************
A do-file to form every pairwise combination of countries with years (from 1948 to 2015).
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
clear*
*
** Choose your first and last years
global fstyr "1948"
global lstyr "2015"  
*
** Create the year dta
global nobs = $lstyr - $fstyr + 1
set obs $nobs
gen year = ($fstyr-1)+_n
save tempyear, replace
scalar nyear = _N
*
** Mege to iso3.dta
use iso3.dta, clear
*
** add BLX for Belgium-Luxembourg together (see 2.currency.do)
expand 2 if iso3=="BEL", gen(tag)
replace iso3="BLX" if tag==1
drop tag
scalar ncty = _N
duplicates report iso3 	
cross using tempyear
*
** sample expected 
assert _N == ncty*nyear
sort iso3 year
save tempcty, replace
*
exit





