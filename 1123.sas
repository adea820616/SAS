data songs;
infile"D:\SAS DATA\MyRawData\KBRK.dat";
input City $1-15 age a b c d e;
Sumscore = sum ( of a - numeric - e);
Meanscore = mean ( of _numeric_);
run;
proc print data = songs;
title'songs';
run;
*proc contents;
data songs;
infile"D:\SAS DATA\MyRawData\KBRK.dat";
input City $1-15 age a b c d e;
array songs(5) a b c d e;
do i = 1 to 5;
if songs(i) = 9 then songs(i) = . ;
end;
run;
proc contents data = songs position;
run;


*Name Prefix Lists;
data songs;
infile"D:\SAS DATA\MyRawData\KBRK.dat";
input City $1-15 @19 a b c d e;
Meanscore = mean ( of _numeric_);
Sumscore = sum ( of a - numeric - e);
*Meanscore = mean ( of a - numeric - e);
run;
proc print data = songs;
title'songs';
run;


*CH4;
*Where;
data garden;
infile"D:\SAS DATA\MyRawData\Garden.dat";
input Name $ a b c d;
run;

proc print data = garden;
where Name between 'Molly' and 'Susan';
title 'garden';
run;

*contains;
data class;
input Name $ Gender $ Age;

datalines;
Joyce	F	11
Thomas	M	11
Jane	F	12
Louise	F	12
James	M	12
John	M	12
Robert	M	12
Alice	F	13
Barbara	F	13
Jeffery	M	13
Carol	F	14
Judy	F	14
Alfred	M	14
Henry	M	14
Jenet	F	15
Mary	F	15
Ronald	M	15
William	M	15
Philip	M	16
;

proc print data = class;
where Name contains 'ar';
title 'class';
run;

*?;
proc import datafile = 'D:\SAS DATA\上課\tab.txt' 
out = class dbms=dlm ;
run;

*用proc print，已經有data直接proc print;
proc print data = Sashelp.Company;
where LEVEL4 in ('SALES' , 'FINANCE' , 'MARKETING' );
title 'sashelp';
run;


