*3.4;
data oldcars;
infile  'D:\SAS DATA\MyRawData\Auction.dat' ;
input Make $1-13 Model $15-29 YearMade Seats MillionsPaid;
if YearMade < 1890 then Veteran = "Yes";
if model = "F-88" then do;
Make  = "Oldmobile";
Seats = 2;
end;
run;

proc print data = oldcars;
title "oldcar";
run;

*P60;
data home;
infile  'D:\SAS DATA\MyRawData\Home.dat' ;
input Name $ 1-7 Description $ 9-33 Cost;
if Cost = . then CostGroup = "missing";
else if Cost <2000 then CostGroup = "low";
else if Cost <10000 then CostGroup ="median";
else CostGroup = "high";
run;
proc print data = home;
title "home";
run;

*lms Airport;
data airport;
input country $1-9 CitiesInTour 11-12 USGate $14-26 Arrival $28-48;
length Airport $10;
if USGate = "San Francisco" then Airport = "SFO";
else if USGate = "Honolulu" then Airport = "HNL";
else if USGate = "New York" then Airport ="JKL or LGA";

datalines;
Japan      5 San Francisco          Tokyo, Osaka
Italy      8 New York               Rome, Naples
Australia 12 Honolulu           Sydney, Brisbane
Venezuela  4 Miami            Caracas, Maracaibo
Brazil     4               Rio de Janeiro, Belem
;
proc print data = airport;
var country USGate Airport;
title "airport";
run;

*lms CH3_4;
data CH34;
input name $1-15 status $ 35-40 ;
length action $ 7;

if lowcase(status) = "passed" then action = "none";
else  action ="contact";

datalines;
Alexander Smith 78 82 86 69 97 80 passed
John Simon      88 72 86 . 100 85 incomp
Patricia Jones  98 92 92 99 99 93 PAssed
Jack Benedict   54 63 71 49 82 69 FAILED
Rene Porter    100 62 88 74 98 92 PASSED
;
run;
proc print data = CH34;
title "CH34";
run;

*Today() returns the current date as a sas date value;
*YRDIF() ( start-date, end-date, <basis> )
*returns the difference in years between two dates according to specified day count conventions;
*<basis> -> AGE / ACT;

*YRDIF;
*/是go to next;

*30/360→設定一個月30天、一年360天去做相差計算
ACT/ACT→設定真實日期去計算
ACT/360→設定真實相差的日子、但除以360天
ACT/365→設定真實相差的日子、但除以365天(不管那一年幾天);

data _null_;-
s_date = '16oct1998'd;
e_date = '16feb2010'd;

y_age = yrdif (s_date, e_date, 'AGE');
*設定真實日期去計算;
yactact = yrdif (s_date, e_date, "ACT/ACT");
yact360 = yrdif( s_date, e_date, "ACT/360");
yact365 = yrdif( s_date, e_date, "ACT/365");
put y_age=/ yactact= / yact360=/ yact365=;
run;

*format;
*default沒有指定的都是8.2;
*W怪怪;
data tsfmt;
W = "Good morning";
X = 12.1;
Y = 13.2;
Z = "Howdy-doody";

format W $char3. 	Y 10.3 	default = 8.2 $char8.;
put W/X/Y/Z ;
RUN;

proc contents data = tsfmt;
run;

proc print data = tsfmt;
run;

*exercise;
* $12.1 共五個字 所以用5.1 小數點1位;
*用proc print可以定格式;
proc print data = tsfmt1;
	format W $char13. X dollar5.1 Y dollar5.1 Z $char5. ;
run;

data dollars;
length va1 8 va2 8 va3 8 va4 8;
format va1 dollar7. va2 dollar9.2  va3 4.2 va4 dollar10.2 ;

va1 = 12345.67;
va2 = 12345.67;
va3 = 12345.67;
va4 = 12345.67;

run;
proc contents data = dollars;
run;

proc print data =dollars;
run;
