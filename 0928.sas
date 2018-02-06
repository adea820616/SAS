DATA sales;
INFILE  'D:\SAS DATA\MyRawData\Onions.dat' ;
INPUT VisitinqTeam $ 1-20 ConcessionSales 21-24 BleacherSales 25-28 OurHits 29-31 TheirHits 32-34 OurRuns 35-37 TheirRuns 38-40 ;

PROC PRINT DATA = sales;
 TITLE 'SAS Data Set Sales' ;
RUN;

DATA contest ;
      INFILE  'D:\SAS DATA\MyRawData\Pumpkin.dat' ;
      INPUT Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10.      (Score1 Score2 Score3 Score4 Score5) (4.1) ;
run;
PROC PRINT DATA = contest ;
      TITLE 'Pumpkin Carving Contest'  ;
RUN;

Data nationalparks;
infile 'D:\SAS DATA\MyRawData\NatPark.dat' ;
input ParkName $ 1-22 State $ Year @40 Acreage comma9 ;
run;
PROC PRINT DATA = nationalparks ;
TITLE ' Selected National Parks ' ;
run;


data Q1;
input  IdNumber
        Name $18.
        Team $25-30
        StartWeight $ EndWeight ;
datalines;
1023 David Shaw         red    189 165
1049 Amelia Serrano     yellow 145 124
1219 Alan Nance          red    210 192
1246 Ravi Sinha         yellow 194 177
1078 Ashley McKnight    red    127 118
1221 Jim Brown          yellow 220
;
run;

proc print data = q1;
title 'Weight Club Members' ;
run;


data Q2;
input  SSN $CHAR9.
        HireDate DDMMMYY7.
        Salary COMMA6.
        Department $ Phone;
datalines;
209-20-3721 07JAN78 41,983 SALES     2896
223-96-8933 03MAY86 27,356 EDUCATION 2344
232-18-3485 17AUG81 33,167 MARKETING 2674
251-25-9392 08SEP84 34,033 RESEARCH  2956
;
run;

proc print data = Q2;
title 'Salary Table' ;
run;
