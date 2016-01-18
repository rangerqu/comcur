/* 
A master do-file for executing all of the individual do-files in the appropriate order. 
*
First version: 4th March 2009
This version: 29th December 2014
Jose de Sousa (http://jdesousa.univ.free.fr/data)
*
If you use these do-files in your work, please cite: 
De Sousa, Jose (2012), "The currency union effect on trade is decreasing over time", Economics Letters 117(3), pp. 917–920.
*
******************************************************************************************************************/
*
** Enter the path to the files
global Path ""

cd $Path
clear* 

** If using a Stata version lower than 13, allocate memory and matsize because the dyadic dataset is huge.
set mem 500M
set matsize 800

/* A do-file to form every pairwise combination of countries with years (from 1948 to 2015)*/
do 1.iso3year.do

/* A do-file to determine which "multinational currency"  (e.g. US$, euro, ...) a country is using between 1948 and 2015. */
do 2.currency.do

/* A do-file to determine a bilateral currency union dummy (comcur).*/
do 3.dummycu.do


/* Acknowledgements
I am indebted to Keith Head for much helpful advice and insightful discussions in the construction of this file 
and to Laura Lebastard for her help to revise the data.*/

/* Disclaimer 
These data are to the best of my knowledge correct. If you double check them to ensure their accuracy and find errors, 
I would appreciate it if you would inform me. Thank you. */

exit
