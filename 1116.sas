data library;
infile 'D:\SAS DATA\MyRawData\library.dat' truncover;
input name $11.+1 Birthdate MMDDYY10. +1 issuedate anydtdte10. DueDate Date11. ;
DaysOverDue = TODAY() - DueDate;
CurrentAge = int(yrdif(Birthdate, Today(), 'age') );
if issuedate > '01Jan2012'd then newcard = 'yes';
run;
proc print data = library;
format issudate mmddyy8. duedate weekdate17.;
title'library';
run;

*3.9Retain;

data games;
infile 'D:\SAS DATA\MyRawData\Games.dat' ;
input Month 1 day 3-4 team $6-25 Hits 27-28 Runs 30-31;
retain MaxRuns;
MaxRuns = max( MaxRuns,Runs);
*RunsToDate + Runs;
*retain RunsToDate 0;
RunsToDate + Runs;
run;
proc print data = games;
title'games';
run;


data Test_1;
put "before the input statment:" _all_;
input x @@;
put"after the input statement" _all_;
datalines;
1 2 . 3
;

data test_2;
retain old_x;
put "before input:" _all_;
input x @@;
if x ne . then old_x = x;
else x = old_x;
put "after assignment:" _all_;
datalines;
1 2 . 3
;
*array;
*把9換成.;
data songs;
infile"D:\SAS DATA\MyRawData\KBRK.dat";
input City $1-15 age a b c d e;
array songs(5) a b c d e;
do i = 1 to 5;
if songs(i) = 9 then songs(i) = . ;
end;
run;
proc print data=songs;
title 'songs';
run;

*有幾個3;
data songs;
infile"D:\SAS DATA\MyRawData\KBRK.dat";
input City $1-15 age a b c d e;
array songs(5) a b c d e;
count = 0;
do i = 1 to 5;
if songs(i) = 3 then count +1;
end;
run;
proc print data=songs;
title 'songs';
run;

data work.earn;
value = 2000;
do year = 1 to 20;
interest = value *0.075;
value + interest ;
output;
end;
run;
proc print data = earn;
run;

data ex;
array test(3) t1 t2 t3(90,80,70) ;
array score(3) s1 s2 s3;
input s1 6-7  s2 9-10 s3 12-13 id 1-4 ;

do i = 1 to 3;
	if score(i) >= test(i) then do newscore = score(i);
	output;
	end;
end;

datalines;
1234 99 60 82
5678 80 85 75
; 

proc print data = ex;
title 'ex';
run;
