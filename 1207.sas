data candy;
infile 'D:\SAS DATA\MyRawData\CandySales.dat';
input Name $ 1-11 Class $ @15 DateReturned MMDDYY10. CandyType $ Quantity;
Profit = Quantity *1.25;

proc sort data = candy;
by Class;

proc print data = candy;
sum Profit;

var Name DateReturned Profit ;
format DateReturned Date 9. Profit dollar 6.2 ;
title 'candy';
run;
* %可代表多個任何字元 ;
*_可代表一個任何字元;
proc print data = Sashelp.Company;
*where LEVEL5 like 'A%';
where LEVEL5 not like  'A%' and LEVEL5 not like 'S%' ;
*where scan( level5, 1) not like 'A%' and scan(level5, 1) not like 'S%';
title 'level5' ;
run;

*proc sort;
data lengths;
infile ' D:\SAS DATA\MyRawData\Lengths.dat';
input Name $ Family $ Length @@;
*Sort the data;
proc sort data = lengths out =seasort nodupkey;
by Family descending Length;
*記得print seasort;
proc print data = seasort;
title ' lengths ' ;
run;

*exercise;
proc sort data = Sashelp.Company out = company1;
by level2 descending level5;
where depthead ="1" ;

proc print data = company1;
run;
*???????;
data address;
infile 'D:\SAS DATA\MyRawData\Mail.dat';
input Name $ 6.  Street $ 18. City $ 9. State $ 6.;
*sortseq換一種排序方法;
*方法為linguistic;
*numeric_collation = on -> 把數字合起來比較 2和100, 2比較小;
proc sort data = address out = sortone
sortseq = linguistic ( numeric_collation = on );
by street;

proc print data = sortone;
title 'address';
run;


*exercise;
data candy;
infile 'D:\SAS DATA\MyRawData\CandySales.dat';
input Name $ 1-11 Class $ @15 DateReturned MMDDYY10. CandyType $ Quantity;
Profit = Quantity *1.25;
label DateReturned = 'Date-Returned'
CandyType = 'Type of Candy';

proc sort data = candy;
by CandyType descending Profit;

proc print data = candy label;
by CandyType;
sum Profit;
id Class;
var Name DateReturned Profit CandyType;
format DateReturned Date9. Profit dollar6.2 ; 
title 'candy';
run;
