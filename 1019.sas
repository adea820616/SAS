data reading;
infile 'D:\SAS DATA\MyRawData\Books.dat' DLM = ',' ;
input Name$ Weel1 Week2 Week3 Week4 Week5;
run;
proc print data = reading;
title 'reading' ;
run;

data music;
infile 'D:\SAS DATA\MyRawData\Bands.csv' DLM=',' DSD missover;
input BandName :$30. GigDate :MMDDYY10. EightPM NinePM TenPM ElevenPM;
run;
proc print data = music;
title'music';
run;

data e1;
infile datalines  DLM='ab'  DSD;
input x  y  z  ;

datalines;
1aa2ab3
4b5bab6
7a8b9
;
proc print data=e1;
title 'exercise1';
run;

data e2;
infile datalines  DLM='prdPRD' ;
*infile datalines dlmstr='PRD' dlmsopt=' i ' dsd;
input x  y  z  ;
datalines;
1PRD2PRd3
4PrD5Prd6
7pRd8pRD9
;
proc print data=e2;
title 'exercise2';
run;

proc import datafile='D:\SAS DATA\MyRawData\Bands2.csv' out = music replace;
run;
proc print data = music;
title'bands2';
run;

proc import datafile = 'D:\SAS DATA\上課\tab.txt' out= class dbms=dlm replace;
delimiter= '09'x;
datarow=5;
run;
proc print data= class;
title ' class';
run;

libname plants 'D:\SAS DATA\MySASLib' ;
data plants.magnolia  ;
infile 'D:\SAS DATA\MyRawData\Mag.dat' ;
input ScientificName $ 1-14 CommonName $ 16-32 MaximumHeight 
	AgeBloom Type $ Color $ ;
run;

proc print data = plants.magnolia;
title ' Mag' ;
run;


*practice;
*記得加: ;
data list;
infile 'D:\SAS DATA\上課\list.csv' DLM=',' DSD;
input subj $ Name :$21. DOB :MMDDYY10. salary :comma8. ;
run;
proc print data = list;
title'list';
run;

data bank;
infile datalines ;
input Gender $14 @;
if Gender = 'M' then delete;
input Subj $1-3 DOB MMDDYY10. Balance 15-21;

datalines;
00110/21/1955M   1145
00211/18/2001F  18722
00305/07/1944M 123.45
00407/25/1945F -12345
;
proc print data=bank;
title 'bank';
run;

