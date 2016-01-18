/*****************************************************************************************************************
A do-file to determine which "multinational currency"  (e.g. US$, euro, ...) a country is using between 1948 and 2015.
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
/* Notes:
1. This file creates a variable called currency. For each country of the sample, we specify the currency used in that particular country.

2. However, we only report currencies that are "multinational", i.e. used at least in two countries.

3. On the contrary, if the currency is used only at home (the Brazilian Real, say...) then the variable currency is equal to "_".

4. The multinational currencies reported are mainly those tabulated in the Appendix B of Glick and Rose (2002, pp. 1141-1149) 
[hereafter GR] and used to form currency unions. They use an annual panel data set from 1948 through 1997. 

5. A country may use simultaneously various multinational currencies. The code allows for this multi-use.

6. Glick and Rose identify "16 switches into and 130 switches out of currency unions (for which we have data)". 
"Switches into a currency union" means that a country uses a new multinational currency.
I was able to identify 13 "switches into" out of the 16 mentioned. These switches into are not tabulated in Appendix B
but reported in their dataset. 

7. I also include a number of countries which are quite integrated to others in a way that independent trade data could be unavailable. 
Some of these countries are not tabulated in GR's Appendix B but mentioned in Footnote 9, p. 1129.

8. I also add the Euro currency which was introduced to world financial markets as an accounting currency on 1st January 1999, 
i.e. after the sample period of Glick and Rose. My sample covers the period from 1948 to 2015.
N.B. other changes may have occurred between 1997 and 2015. They are not accounted for here.

9. I use the most recent ISO3 codes. e.g.: COD (Congo, the Democratic Republic of the, instead of ZAR - note there is a currency called ZAR!),
ROU (instead of ROM). I also added the code "BLX" for "BEL" and "LUX"
*/
*
clear*
use tempcty.dta, clear // created with 1.iso3year.do
codebook iso3 year, compact
*
****************************************************************
* Variables: iso_o iso_d year
* 199 countries, 68 years (1948-2015)
* Observations: 13,532
* Note: If you want to reduce the size dimension of the data set, 
* please modify the 1.iso3year do file
****************************************************************
*
*** I generate the possibility that a country uses simultaneously three multinational currencies
gen str3 currency1="_"
gen str3 currency2="_"
gen str3 currency3="_"
*
*** According to the previous notes, I identify 20 multinational currencies:

*********************************************************************************************************
**** 1. The "British West Indies" Currency (BWI) ****
*********************************************************************************************************

** Antigua and Barbuda
replace currency1= "BWI" if (iso3=="ATG")

** Dominica
replace currency1= "BWI" if (iso3=="DMA")

** Grenada
replace currency1= "BWI" if (iso3=="GRD")

** St. Kitts and Nevis
replace currency1= "BWI" if (iso3=="KNA")

** St. Lucia
replace currency1= "BWI" if (iso3=="LCA")

** St. Vincent
replace currency1= "BWI" if (iso3=="VCT")

** Montserrat
replace currency1= "BWI" if (iso3=="MSR")

** Trinidad and Tobago
replace currency1= "BWI" if (iso3=="TTO") & (year<1976)

** Barbados 
replace currency1= "BWI" if (iso3=="BRB") & (year<1975)

** Guyana
replace currency1= "BWI" if (iso3=="GUY") & (year<1971)

tab currency1

*********************************************************************************************************
**** 2. The "Central America and the Caribbean" Currency (ANG) **** 
*********************************************************************************************************

*** Aruba
replace currency1= "ANG" if (iso3=="ABW") 

*** Netherlands Antilles
replace currency1= "ANG" if (iso3=="ANT")

** Suriname 
replace currency1= "ANG" if (iso3=="SUR") & (year<1994)

tab currency1

*********************************************************************************************************
**** 3. The "Commonwealth of Australia" Currency (AUD) **** 
*********************************************************************************************************

** Australia
replace currency1= "AUD" if (iso3=="AUS")

** Kiribati
replace currency1= "AUD" if (iso3=="KIR") 

** Nauru
replace currency1= "AUD" if (iso3=="NRU") 

** Solomon Islands 
replace currency1= "AUD" if (iso3=="SLB") & (year<1979)

** Tonga
replace currency1= "AUD" if (iso3=="TON") & (year<1991)

** Tuvalu
replace currency1= "AUD" if (iso3=="TUV")

tab currency1

*********************************************************************************************************
**** 4. The "Indian Rupee" Currency (INR) ****
*********************************************************************************************************

** India
replace currency1= "INR" if (iso3=="IND")

** Bangladesh
replace currency1= "INR" if (iso3=="BGD") & (year<1974)

** Bhutan
replace currency1= "INR" if (iso3=="BTN") 

** Kuwait
replace currency1= "INR" if (iso3=="KWT") & (year<1961)

** Oman
replace currency1= "INR" if (iso3=="OMN") & (year<1970)

** Qatar
replace currency1= "INR" if (iso3=="QAT") & (year<1966)

** Yemen Arab Republic 
replace currency1= "INR" if (iso3=="YEM") & (year<1951)

** Pakistan 
replace currency1= "INR" if (iso3=="PAK") & (year<1966)

** Myanmar (Burma)
replace currency1= "INR" if (iso3=="MMR") & (year<1966) 

** Maldives
replace currency1= "INR" if (iso3=="MDV") & (year<1966)

** Mauritius
replace currency1= "INR" if (iso3=="MUS") & (year<1966)

** Seychelles
replace currency1= "INR" if (iso3=="SYC") & (year<1966)

** Sri Lanka
replace currency1= "INR" if (iso3=="LKA") & (year<1966)

tab currency1

*********************************************************************************************************
**** 5. The "Pakistan Rupee" Currency (PKR) ****
*********************************************************************************************************

** Pakistan
replace currency2= "PKR" if (iso3=="PAK") & (year<1971)

** Myanmar (Burma)
replace currency2= "PKR" if (iso3=="MMR") & (year<1971)

** Maldives 
replace currency2= "PKR" if (iso3=="MDV") & (year<1971)

tab currency2

*********************************************************************************************************
**** 6. The "Mauritius Rupee" Currency (MUR) ****
*********************************************************************************************************

** Mauritius 
replace currency2= "MUR" if (iso3=="MUS") & (year<1976)

** Seychelles
replace currency2= "MUR" if (iso3=="SYC") & (year<1976)			 

** Maldives 
replace currency3= "MUR" if (iso3=="MDV") & (year<1967)			 

** Pakistan 
replace currency3= "MUR" if (iso3=="PAK") & (year<1967)

** Sri Lanka
replace currency2= "MUR" if (iso3=="LKA") & (year<1967)

tab currency2
tab currency3			 

*********************************************************************************************************
**** 7. The "Belgian Franc" currency (BEF) ****
*********************************************************************************************************

** Belgium
replace currency1= "BEF" if (iso3=="BEL") & (year<1999)
replace currency1= "BEF" if (iso3=="BLX") & (year<1999)

** Burundi
replace currency1= "BEF" if (iso3=="BDI") & (year<1964)

** Rwanda
replace currency1= "BEF" if (iso3=="RWA") & (year<1966) 

** Congo 
replace currency1= "BEF" if (iso3=="COD") & (year<1961)

** Luxembourg
replace currency1= "BEF" if (iso3=="LUX") & (year<1999)

tab currency1


*********************************************************************************************************
*** 8. The CFA Franc currency (CFA) ***
*********************************************************************************************************

** Benin
replace currency1= "CFA" if (iso3=="BEN") 

** Burkina Faso
replace currency1= "CFA" if (iso3=="BFA")

** Cameroon
replace currency1= "CFA" if (iso3=="CMR") 

** Central African Rep
replace currency1= "CFA" if (iso3=="CAF") 

** Chad
replace currency1= "CFA" if (iso3=="TCD") 

** Comores 
replace currency1= "CFA" if (iso3=="COM") & (year<1994)

** Congo
replace currency1= "CFA" if (iso3=="COG") 

** Djibouti 
replace currency1= "CFA" if (iso3=="DJI") & (year<1949)

** Equatorial Guinea (switch into cu #1)
replace currency1= "CFA" if (iso3=="GNQ") & (year>=1985) 

** Gabon
replace currency1= "CFA" if (iso3=="GAB") 

** Guinea (GIN)
replace currency1= "CFA" if (iso3=="GIN") & (year<1969)

** Guinea Bissau (GNB) (switch into cu #2) 
replace currency1= "CFA" if (iso3=="GNB") & (year>=1997)

** Ivory Coast
replace currency1= "CFA" if (iso3=="CIV")

** Madagascar
replace currency1= "CFA" if (iso3=="MDG") & (year<1982)

** Mali (switch into cu #3)
replace currency1= "CFA" if (iso3=="MLI") & (year<1962)
replace currency1= "CFA" if (iso3=="MLI") & (year>=1984)

** Mauritania 
replace currency1= "CFA" if (iso3=="MRT") & (year<1974)

** Niger
replace currency1= "CFA" if (iso3=="NER")

** Senegal
replace currency1= "CFA" if (iso3=="SEN")

** Reunion 
replace currency1= "CFA" if (iso3=="REU") & (year<1976) 

*** St. Pierre and Miquelon
replace currency1= "CFA" if (iso3=="SPM") & (year<1976)

** Togo (switch into cu #4)
replace currency1= "CFA" if (iso3=="TGO") & (year<1962) 
replace currency1= "CFA" if (iso3=="TGO") & (year>=1963) 			

tab currency1
tab currency2
tab currency3


*********************************************************************************************************
**** 9. The "South Africa Rand" currency (ZAR) ****
*********************************************************************************************************

* South Africa
replace currency1= "ZAR" if (iso3=="ZAF")

* Botswana
replace currency1= "ZAR" if (iso3=="BWA") & (year<1977)

* Lesotho 
replace currency1= "ZAR" if (iso3=="LSO") 

* Swaziland 
replace currency1= "ZAR" if (iso3=="SWZ") 

* Namibia (mentionned in Ffootnote 9)
replace currency1= "ZAR" if (iso3=="NAM")  

tab currency1


*********************************************************************************************************
**** 10. The "Malaya dollar" currency (MYR) ****
*********************************************************************************************************

* Malaysia
replace currency1= "MYR" if (iso3=="MYS") & (year<1973)

* Singapore
replace currency1= "MYR" if (iso3=="SGP")

* Brunei
replace currency1= "MYR" if (iso3=="BRN")

tab currency1

*********************************************************************************************************
**** 11. The "Danish Krone" currency (DKK) ****
*********************************************************************************************************

* Denmark
replace currency1= "DKK" if (iso3=="DNK") 

* Faeroe Islands
replace currency1= "DKK" if (iso3=="FRO") 

* Greenland
replace currency1= "DKK" if (iso3=="GRL") 

tab currency1


*********************************************************************************************************
**** 12. The "French Franc" currency (FRF) ****
*********************************************************************************************************

** France
replace currency1= "FRF" if (iso3=="FRA") & (year<1999)

** French Guiana
replace currency1= "FRF" if (iso3=="GUF") & (year<1999)

** Guadeloupe
replace currency1= "FRF" if (iso3=="GLP") & (year<1999)

** Martinique
replace currency1= "FRF" if (iso3=="MTQ") & (year<1999)

** Monaco (considered in Footnote 9)
replace currency1= "FRF" if (iso3=="MCO") & (year<1999)

** Andorra (considered in Footnote 9)
replace currency1= "FRF" if (iso3=="AND") & (year<1999)

** Algeria
replace currency1= "FRF" if (iso3=="DZA") & (year<1969)

** Reunion (switch into cu #5) 
replace currency1= "FRF" if (iso3=="REU") & (year>=1976 & year<1999)

** St. Pierre and Miquelon (switch into cu #6)
replace currency1= "FRF" if (iso3=="SPM") & (year>=1976 & year<1999)

** Morocco
replace currency1= "FRF" if (iso3=="MAR") & (year<1959)

** Tunisia
replace currency1= "FRF" if (iso3=="TUN") & (year<1958)

tab currency1

*********************************************************************************************************
**** 13. The CFP Franc (XPF) ****
*********************************************************************************************************

** French Polynesia
replace currency1= "XPF" if (iso3=="PYF") 

** New Caledonia 
replace currency1= "XPF" if (iso3=="NCL") 

**  Wallis and Futuna
replace currency1= "XPF" if (iso3=="WLF")

** Vanuatu (GR: CU stopped in 1971)
replace currency1= "XPF" if (iso3=="VUT") & (year<1971)

tab currency1


*********************************************************************************************************
**** 14. The "Escudo" currency (PTE) ****
*********************************************************************************************************

** Portugal
replace currency1= "PTE" if (iso3=="PRT") & (year<1999)

** Cape Verde
replace currency1= "PTE" if (iso3=="CPV") & (year<1977)

** Angola
replace currency1= "PTE" if (iso3=="AGO") & (year<1977)

** Guinea-Bissau
replace currency2= "PTE" if (iso3=="GNB") & (year<1977)

** Mozambique
replace currency1= "PTE" if (iso3=="MOZ") & (year<1977)

** Sao Tome & Principe
replace currency1= "PTE" if (iso3=="STP") & (year<1977)

tab currency1


*********************************************************************************************************
**** 15. The "Saudi Riyal" currency (SAR) ****
*********************************************************************************************************

** Qatar (switch into cu #7)
replace currency1= "SAR" if (iso3=="QAT") & (year>=1981) 	

** United Arab Emirates  (switch into cu #8)
replace currency2= "SAR" if (iso3=="ARE") & (year>=1981)

tab currency1
tab currency2

*********************************************************************************************************
**** 16. The "Peseta" currency (ESP) ****
*********************************************************************************************************

** Spain
replace currency1= "ESP" if (iso3=="ESP") & (year<1999)			

** Andorra
replace currency2= "ESP" if (iso3=="AND") & (year<1999)			

** Equatorial Guinea
replace currency1= "ESP" if (iso3=="GNQ") & (year<1969)

tab currency1
tab currency2


*********************************************************************************************************
**** 17. The "East African Currency Area" currency (EAS) ****
*********************************************************************************************************

** Kenya
replace currency1= "EAS" if (iso3=="KEN") & (year<1978)

** Uganda
replace currency1= "EAS" if (iso3=="UGA") & (year<1978)

** Tanzania 
replace currency1= "EAS" if (iso3=="TZA") & (year<1978)

** Somalia
replace currency1= "EAS" if (iso3=="SOM") & (year<1971)

** Yemen Arab Republic (switch into cu #9)
replace currency1= "EAS" if (iso3=="YEM") & (year>1950 & year<1972)

tab currency1

*********************************************************************************************************
**** 18. The "Pound Sterling" curreny, called GBP ****
*********************************************************************************************************

** GBR
replace currency1= "GBP" if (iso3=="GBR") 

** Bahamas 
replace currency1= "GBP" if (iso3=="BHS") & (year<1966)

** Bermuda 
replace currency1= "GBP" if (iso3=="BMU") & (year<1970)

** Cyprus 
replace currency1= "GBP" if (iso3=="CYP") & (year<1972)

** Falkland Islands
replace currency1= "GBP" if (iso3=="FLK")

** Gambia
replace currency1= "GBP" if (iso3=="GMB") & (year<1971)

** Ghana 
replace currency1= "GBP" if (iso3=="GHA") & (year<1965)

** Gibraltar
replace currency1= "GBP" if (iso3=="GIB") 

** Iraq
replace currency1= "GBP" if (iso3=="IRQ") & (year<1967)

** Ireland
replace currency1= "GBP" if (iso3=="IRL") & (year<1979)

** Israel
replace currency1= "GBP" if (iso3=="ISR") & (year<1954)

** Jamaica 
replace currency2= "GBP" if (iso3=="JAM") & (year<1969)

** Jordan
replace currency1= "GBP" if (iso3=="JOR") & (year<1967)

** Kenya
replace currency2= "GBP" if (iso3=="KEN") & (year<1967)

** Kuwait (switch into cu #10)
replace currency1= "GBP" if (iso3=="KWT") & (year>=1961 & year<1967)

** Lybia
replace currency1= "GBP" if (iso3=="LBY") & (year<1967)

** Malawi
replace currency1= "GBP" if (iso3=="MWI") & (year<1971)

** Malta
replace currency1= "GBP" if (iso3=="MLT") & (year<1971)

** New Zealand
replace currency1= "GBP" if (iso3=="NZL") & (year<1967)   			

** Nigeria
replace currency1= "GBP" if (iso3=="NGA") & (year<1967)

** Oman (switch into cu #11)
replace currency1= "GBP" if (iso3=="OMN") & (year==1970) 

** Samoa
replace currency1= "GBP" if (iso3=="WSM") & (year<1967) 

** Sierra Leone
replace currency1= "GBP" if (iso3=="SLE") & (year<1965)

** Somalia
replace currency2= "GBP" if (iso3=="SOM") & (year<1967)

** South Africa
replace currency2= "GBP" if (iso3=="ZAF") & (year<1961) 		  

** St. Helena
replace currency1= "GBP" if (iso3=="SHN") 

** Tanzania
replace currency2= "GBP" if (iso3=="TZA") & (year<1967)

** Uganda
replace currency2= "GBP" if (iso3=="UGA") & (year<1967)

** Yemen Arab Republic
replace currency2= "GBP" if (iso3=="YEM") & (year<1972)			 

** Zambia
replace currency1= "GBP" if (iso3=="ZMB") & (year<1967)

** Zimbabwe
replace currency1= "GBP" if (iso3=="ZWE") & (year<1967)

tab currency1
tab currency2
tab currency3


*********************************************************************************************************
**** 19. The United States "Currency Union", called USA ****
*********************************************************************************************************

** United States				
replace currency1= "USD" if (iso3=="USA")

** American Samoa 
replace currency1= "USD" if (iso3=="ASM")

** Bahamas (switch into cu #12)
replace currency1= "USD" if (iso3=="BHS") & (year>=1966) 

** Belize 
replace currency1= "USD" if (iso3=="BLZ") & (year<1949) 

** Bermuda (switch into cu #13)
replace currency1= "USD" if (iso3=="BMU") & (year>=1970)

** Dominican Republic
replace currency1= "USD" if (iso3=="DOM") & (year<1985) 

** Guam
replace currency1= "USD" if (iso3=="GUM") 

** Guatemala
replace currency1= "USD" if (iso3=="GTM") & (year<1986)

** Liberia
replace currency1= "USD" if (iso3=="LBR") 

** Panama 
replace currency1= "USD" if (iso3=="PAN") 

tab currency1

*********************************************************************************************************
*** 20. The European Monetary Union, called EUR *** NOT CONSIDERED IN Glick and Rose (2002)
*********************************************************************************************************

** Andorra
replace currency3= "EUR" if (iso3=="AND") & (year>=1999)			

** Austria
replace currency1= "EUR" if (iso3=="AUT") & (year>=1999)			

** Belgium
replace currency2= "EUR" if (iso3=="BEL") & (year>=1999)			
replace currency2= "EUR" if (iso3=="BLX") & (year>=1999)			

** Finland
replace currency1= "EUR" if (iso3=="FIN") & (year>=1999)			

** France
replace currency2= "EUR" if (iso3=="FRA") & (year>=1999)			

** French Guiana
replace currency2= "EUR" if (iso3=="GUF") & (year>=1999)			

** Guadeloupe
replace currency2= "EUR" if (iso3=="GLP") & (year>=1999)			

** Germany
replace currency2= "EUR" if (iso3=="DEU") & (year>=1999)			

** Ireland
replace currency2= "EUR" if (iso3=="IRL") & (year>=1999)			

** Italy
replace currency1= "EUR" if (iso3=="ITA") & (year>=1999)			

** Luxembourg
replace currency2= "EUR" if (iso3=="LUX") & (year>=1999)			

** Martinique
replace currency2= "EUR" if (iso3=="MTQ") & (year>=1999)			

** Monaco
replace currency2= "EUR" if (iso3=="MCO") & (year>=1999)			

** Netherlands
replace currency1= "EUR" if (iso3=="NLD") & (year>=1999)			

** Portugal
replace currency2= "EUR" if (iso3=="PRT") & (year>=1999)			

** Reunion 
replace currency2= "EUR" if (iso3=="REU") & (year>=1999)			

** San Marino
replace currency1= "EUR" if (iso3=="SMR") & (year>=1999)			

** Spain
replace currency2= "EUR" if (iso3=="ESP") & (year>=1999)			

** St. Pierre and Miquelon
replace currency2= "EUR" if (iso3=="SPM") & (year>=1999)			

** Greece
replace currency1= "EUR" if (iso3=="GRC") & (year>=2001)			

** Montenegro 
replace currency1= "EUR" if (iso3=="MNE") & (year>=2002)			

** Slovenia
replace currency1= "EUR" if (iso3=="SVN") & (year>=2007)			

** Cyprus
replace currency2= "EUR" if (iso3=="CYP") & (year>=2008)			

** Malta
replace currency2= "EUR" if (iso3=="MLT") & (year>=2008)

** Slovakia
replace currency2= "EUR" if (iso3=="SVK") & (year>=2009)

** Estonia
replace currency2= "EUR" if (iso3=="EST") & (year>=2011)

** Latvia
replace currency2= "EUR" if (iso3=="LVA") & (year>=2014)	
	
** Lithuania
replace currency2= "EUR" if (iso3=="LTU") & (year>=2015)	

tab currency1
tab currency2
tab currency3

save tempcurrency, replace

exit
