*P55 Variable=expression;
data home;
infile 'D:\SAS DATA\MyRawData\Garden.dat' ;
input Name $ 1-7 Tomato Zucchini Peas Grapes ;
Zone = 14;
Type = 'home';
Zucchini = Zucchini *10;
Total = Tomato +Zucchini+ Peas + Grapes;
PerTom = (Tomato / Total)*100;
proc print data = home;
title'home gardening survey';
run;

*P56 SAS函?;
data contest;
infile ' D:\SAS DATA\MyRawData\Pumpkin.dat' ;
input Name $ 16. Age 3. +1 Type $1. +1 Date MMDDYY10.
	(scr1 scr2 scr3 scr4 scr5) (4.1);
AvgScore = MEAN(scr1, scr2, scr3, scr4, scr5) ;
DayEntered = DAY(Date);
Type = UPCASE(Type);
proc print data= contest;
title 'pumkin';
run;

*結果在日誌裡log file，不用創一堆data set;
data _null_;
input name $1-10 sex $ 12 age 15-16 ;
put name sex age;
datalines;
Joseph     M 13
Michel     M 14
Sue Ellen  F 11
;

*trim-修剪空格
cat concatenate -串聯
s - 空格都去掉;
*trim() 去掉字符串尾部空格，如果字符串?空，?返回一?空格
left() 把字符串??的空格移到尾部
strip() 去掉字符串??和?尾的所有空格
cat() 与||作用?似，保留首尾全部空格
catt() 但是?接之前?去掉各字符串尾部空格，相?于?接符?合trim()使用
cats() 但是?接之前?去掉首尾全部空格，相?于?接符?合strip()使用
catx() 但是?接之前?去掉首尾全部空格，并且在字符串之?加上一?指定的字符串
;
data test_cat;
a = ' a ';
b = ' b ';
c =  ' c ';
cat_example = cat(a,b,c) ; *concatenate串連;
catt_example = catt(a,b,c) ; *修剪空白;
trim_cat = cat( trim(a), trim(b), trim(c) ); *也是修剪空白;
cats_ex = cats(a,b,c) ; *空白都去掉;
trimleft_ex = cat( trim(left(a)), trim(left(b)), trim(left(c)) ); *也是空白都去掉;
catx_ex = catx( ',' , a,b,c );
put cat_example $char; 
put catt_example $char; 
put trim_cat $char; 
put cats_ex $char; 
put trimleft_ex $char; 
put catx_ex $char; 
run;

*length(string)
anyspace(string <, start> ) 找出space的位子，指定space後取第幾個數
anydigit( string <,start>) 找到數字的位子，可以不用放起始位子
anyalpha(string<,start>) 
substr( 變數, 位置, 長度) 想截取的變項名稱
;

data contest ; 
infile 'D:\SAS DATA\MyRawData\Pumpkin.dat' ;
input Name $ 16. Age 3. +1 Type $1. +1 Date MMDDYY10.
	(scr1 scr2 scr3 scr4 scr5) (4.1);
Last_Name = substr( Name , anyspace(Name,1));
Last_Name1 = substr( Name , length(Name), 1 );
run;
proc print data= contest;
title 'pumkin';
run;



data _null_;
input Phone $22. ;
substr( Phone, anydigit(Phone,1) , 3 ) =773;

put Phone ;
datalines;
Phone = (312) 555-1212
;


*lms chapter3 exercise2;
data exercise;
input First $ Last $ ;
First = lowcase(First);
Last = lowcase(Last);

substr( First ,1,1) = upcase (substr( First ,1,1));
*substr(First, 2) = lowcase( substr(First, 2));
substr( Last, 1,1) = upcase( substr( Last, 1,1));
*substr(Last,2) = lowcase( substr(Last,2)); 

datalines;
ronald cODy
THomaS eDISON
albert einstein
;
run;
proc print data = exercise;
title ' exercise';
run;

*input(source,informat)
returns the value that is produced when sas.....;
data test;
input sale $9. ;
put sale;
*comma9把,拿掉;
fmtsale = input(sale, comma9.) ;
put fmtsale;

datalines;
2,115,353
;

*lms chapter3 exercise3;
data exercise1;
input String $36. ;
Start = anydigit(String) ;
End = anyspace( String, anydigit(String))   ;
Num = input( substr( String, anydigit(String), (End-Start) ),9. );
datalines;
This line has a 56 in it
two numbers 123 and 456 in this line
No digits here
;
run;

proc print data=exercise1;
title 'exercise1';
run;

*Start = length ( substr( String, 1, length(anydigit(String,1,1) ) ));
*End = length( substr( String, 1, length(anydigit(String,1))));
*um = substr( String, anydigit(String,1) );
