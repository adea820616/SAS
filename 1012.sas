data canoes ;
infile 'D:\SAS DATA\MyRawData\Canoes.dat' ;
input @' School: ' School $ @'Time:' RaceTime :STIMER8. ;
run;

proc print data = canoes;
title "concrete canoe men's sprint result" ;
run;


data site;
input age 
	site :$41.  
	hits :comma7. ;
datalines;
12 http://www.site1.org/default.htm 123,456
230 http://www.site2.com./index.htm 97,654
254 http://www.site3.edu/department/index.htm 987,654
;
proc print data = site;
run;

data highlow;
infile 'D:\SAS DATA\MyRawData\Temperature.dat' ;
input City $ State $
	/ Normalhigh Normallow
	#3 RecordHigh RecordLow ;
proc print data = highlow;
title "Temperature" ;
run;


data freeway;
infile 'D:\SAS DATA\MyRawData\Traffic.dat' ;
input type $ @;
if type = 'surface' then delete;
input Name $ AMTraffic PMTraffic ;

proc print data = freeway;
title "freeway" ;
run;

data gender;
input gender $ @;
	if gender = 'M' then delete;
	input age2. height2. ;
datalines;
M 2368
F 4462
;
run;
proc print data = gender ;
title 'gender';
run;

data class102;
infile 'D:\SAS DATA\MyRawData\ALLScores.dat' missover;
input Name $ Test1 Test2 Test3 Test4 Test5;
run;
proc print data = class102;
run;

data pumpkin;
infile 'D:\SAS DATA\MyRawData\Pumpkin.dat' truncover;
input Name $16. age @;
if age > 10 then delete;
input Type $1. +1  Date MMDDYY10. +1  (Score1 Score2 Score3 Score4 Score5) ( 3.1 +1 ) Grade1 $1. @;
if Score1 >= 8 then Grade1 = "A" ;
input  ;
run;

proc print data = pumpkin;
title 'exercise';
run;
