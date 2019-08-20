dm 'clear log'; dm 'clear output';  /* clear log and output */
/*
proc import datafile = 'H:\Technology files\Technology files\adbe.us.txt'
 out = adbe
 dbms = csv
 replace;
run;

data newadbe;
set adbe;
symbol = 'adbe';
run;

proc import datafile = 'H:\Technology files\Technology files\fb.us.txt'
 out = fb
 dbms = csv
 replace;
run;
data newfb;
set fb; 
symbol = 'fb';
run;
proc import datafile = 'H:\Technology files\Technology files\googl.us.txt'
 out = googl
 dbms = csv
 replace;
run;
data newgoogl;
set googl; 
symbol = 'googl';
run;
proc import datafile = 'H:\Technology files\Technology files\msft.us.txt'
 out = msft
 dbms = csv
 replace;
run;
data newmsft;
set msft; 
symbol = 'msft';
run;

proc import datafile = 'H:\Technology files\Technology files\orcl.us.txt'
 out = orcl
 dbms = csv
 replace;
run;

data neworcl;
set orcl;
symbol = 'orcl';
run;

proc import datafile = 'H:\Technology files\Technology files\sap.us.txt'
 out = sap
 dbms = csv
 replace;
run;
data newsap;
set sap; 
symbol = 'sap';
run;

/* Importing Oil Company Data */

proc import datafile = 'H:\SAS Class\Project\Energy\cvx.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = cvx
dbms = csv
replace;
run;
data newcvx;
set cvx; 
symbol = 'cvx';
run;
proc import datafile = 'H:\SAS Class\Project\Energy\xom.us.txt' /* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\xom.us.txt' /* Ashish Path */
out = xom
dbms = csv
replace;
run;
data newxom;
set xom; 
symbol = 'xom';
run;
proc import datafile = 'H:\SAS Class\Project\Energy\bp.us.txt' /* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\bp.us.txt' /* Ashish Path */
 out = bp
 dbms = csv
 replace;
run;
data newbp;
set bp; 
symbol = 'bp';
run;
proc import datafile = 'H:\SAS Class\Project\Energy\vlo.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\vlo.us.txt' /* Ashish Path */
out = vlo
dbms = csv
replace;
run;
data newvlo;
set vlo; 
symbol = 'vlo';
run;
proc import datafile = 'H:\SAS Class\Project\Energy\cop.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cop.us.txt' /* Ashish Path */
out = cop
dbms = csv
replace;
run;
data newcop;
set cop; 
symbol = 'cop';
run;




/* Joinng technology companies dataset  
data stocks;
set newfb newgoogl newmsft;
run;
PROC PRINT DATA=stocks(obs=10);
RUN; */

/* Joining Oil companies dataset */

data stockoil;
set newxom newcvx newbp;
run;
/*
data stockcomparision;
set stocks stockoil;
run;
*/

/* Premininary analysis of series of different stocks */ 

/*
title1 "Technology Sector Close Value Analysis";
footnote1 j=l "Data Source: Kaggle";
proc sgplot data=stocks;
   series x=date y=close / group=symbol; 
   yaxis label="Close Value";
run;
*/
title1 "Energy Sector Close Value Analysis";
footnote1 j=l "Data Source: Kaggle";
proc sgplot data=stockoil;
   series x=date y=close / group=symbol; 
   yaxis label="Close Value";
run;

title "ExxonMobil Closing Price";
footnote j=l "Data Source: Kaggle";
proc sgplot data=xom;
	series x=date y=close;
	yaxis label="Close Value";
run;

title1 "Technology Vs Energy - Closing price analysis";
title2 "1990+";
proc sgplot data= stockcomparision;
   series x=date y=close / group=symbol; 
   yaxis label="closing price";
   xaxis min = 10958;
run;
title;

/* accumulate to a monthly interval using AVERAGE */
proc timeseries data=newxom out=out_totalmonth plots=(series);
    id date interval=day accumulate=average;
    var close;
	title "Accumulate by day - Average";
run;

/* log transformed series */
data lnewxom;
set newxom;
logclose = log(close);
run;

data lnewcop;
set newcop;
logclose = log(close);
run;

data lnewvlo;
set newvlo;
logclose = log(close);
run;

data lnewbp;
set newbp;
logclose = log(close);
run;

data lnewcvx;
set newcvx;
logclose = log(close);
run;
PROC PRINT DATA=lnewxom(obs=10);
RUN; 

/************************
***** TRANSPORTATION ****
************************/

proc import datafile = 'H:\SAS Class\Project\Transportation\znh.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = znh
dbms = csv
replace;
run;
data newznh05;
set znh; 
symbol = 'znh';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Transportation\skyw.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = skyw
dbms = csv
replace;
run;
data newskyw05;
set skyw; 
symbol = 'skyw';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Transportation\ryaay.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = ryaay
dbms = csv
replace;
run;
data newryaay05;
set ryaay; 
symbol = 'ryaay';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Transportation\jblu.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = jblu
dbms = csv
replace;
run;
data newjblu05;
set jblu; 
symbol = 'jblu';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Transportation\cea.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = cea
dbms = csv
replace;
run;
data newcea05;
set cea; 
symbol = 'cea';
if date <16492 then delete;
run;


/*******************
***** UTILITIES ****
********************/
proc import datafile = 'H:\SAS Class\Project\Utilities\cpl.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = cpl
dbms = csv
replace;
run;
data newcpl05;
set cpl; 
symbol = 'cpl';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Utilities\hnp.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = hnp
dbms = csv
replace;
run;
data newhnp05;
set hnp; 
symbol = 'hnp';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Utilities\kep.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = kep
dbms = csv
replace;
run;
data newkep05;
set kep; 
symbol = 'kep';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Utilities\ora.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = ora
dbms = csv
replace;
run;
data newora05;
set ora; 
symbol = 'ora';
if date <16492 then delete;
run;

proc import datafile = 'H:\SAS Class\Project\Utilities\etp.us.txt'/* Jesse path */
/*proc import datafile = 'H:\Oil Files\Oil Files\cvx.us.txt' /* Ashish Path */
out = etp
dbms = csv
replace;
run;
data newetp05;
set etp; 
symbol = 'etp';
if date <16492 then delete;
run;

/* Subsetting the series to take observations from 2005 onwards */
/* XOM */
data newxom05;
set newxom;
if date <16492 then delete;
run; 
data lnewxom05;
set lnewxom;
if date <16492 then delete;
run; 
/* BP */
data newbp05;
set newbp;
if date <16492 then delete;
run; 
data lnewbp05;
set lnewbp;
if date <16492 then delete;
run; 
/* CVX */
data newcvx05;
set newcvx;
if date <16492 then delete;
run; 
data lnewcvx05;
set lnewcvx;
if date <16492 then delete;
run; 
/* VLO */
data newvlo05;
set newvlo;
if date <16492 then delete;
run; 
data lnewvlo05;
set lnewvlo;
if date <16492 then delete;
run; 
/* COP */
data newcop05;
set newcop;
if date <16492 then delete;
run; 
data lnewcop05;
set lnewcop;
if date <16492 then delete;
run; 


PROC PRINT DATA=newxom05(obs=10);
RUN; 
PROC PRINT DATA=lnewxom05(obs=10);
RUN; 

title1 "ExxonMobil Closing Price";
title2 "2005+";
footnote j=l "Data Source: Kaggle";
proc sgplot data=newxom05;
	series x=date y=close;
	yaxis label="Close Value";
run;

/* Time Series Decomposition Exxon ;*/ 
proc timeseries data=newxom05 outdecomp=decompose
        print=(descstats seasons) plot=(series residual histogram corr cycles tc sc ic);
    id date interval=day;
    var close;
	title "Exxon closing price decomposition";
	run;

PROC PRINT DATA=newxom(obs=10);
RUN; 

/* KPSS tests for stationarity */
/*-- test for stationarity using quadratic
     spectral kernel and automatic bandwidth selection --*/

/* XOM */
proc autoreg data=newxom05;
   model close= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=lnewxom05;
   model logclose= /stationarity=(kpss=(kernel=qs auto));
run; 
/* series not stationary */

/* BP */
proc autoreg data=newbp05;
   model close= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=lnewbp05;
   model logclose= /stationarity=(kpss=(kernel=qs auto));
run; 
/* series not stationary */

/* CVX */
proc autoreg data=newcvx05;
   model close= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=lnewcvx05;
   model logclose= /stationarity=(kpss=(kernel=qs auto));
run; 

/* series not stationary */

/* VLO */
proc autoreg data=newvlo05;
   model close= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=lnewvlo05;
   model logclose= /stationarity=(kpss=(kernel=qs auto));
run; 
/* series not stationary */

/* COP */
proc autoreg data=newcop05;
   model close= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=lnewcop05;
   model logclose= /stationarity=(kpss=(kernel=qs auto));
run; 
/* series not stationary */




/*White Noise and Autocorrelation with out differencing*/ 	
proc timeseries data = newxom05 plots=(corr);
id date interval = day;
var close;
run;
proc timeseries data = lnewxom05 plots=(corr);
id date interval = day;
var logclose;
run;


/* Other tests for stationarity not used in the report, but kept for ref */
/* Dickey Fuller Test */
/* Null hypothesis is Ho = series has unit root or phi = 1, series in non stationary against one-sided alternative 
phi <1 i.e series is stationary */  

%dftest( newxom05, close); 
	%put p=&dftest;

	%dftest( newxom05, close,DIF = (1)); 
	%put p=&dftest;

	%dftest( lnewxom05, logclose);
   %put p=&dftest;

   %dftest( lnewxom05, logclose, DIF = (1));
   %put p=&dftest;

	%dftest( newxom, close,DIF = (1)); 
	%put p=&dftest;
/* augmented dickey fuller tests for stationarity */

/* The null (H0) and alternative (H1) models in each case are
i)
H0: yt= yt-1+ut
H1: yt =fyt-1+ut, f<1
This is a test for a random walk against a stationary autoregressive process of
order one (AR(1)) (Zero Mean)
ii)
H0: yt = yt-1+ut
H1: yt =fyt-1+µ+ut, f<1
This is a test for a random walk against a stationary AR(1) with drift.(single Mean)
iii)
H0: yt = yt-1+ut
H1: yt =fyt-1+µ+?t+ut, f<1
This is a test for a random walk against a stationary AR(1) with drift and a
time trend. (Trend) */


proc autoreg data = newxom05;
   model close = / stationarity =(adf =3); 
run;

proc autoreg data = lnewxom05;
   model logclose = / stationarity =(adf =3);

/* In interpreting the output, one starts from the most general model of a constant (single mean) and trend
and continues to the most specific (zero mean and no trend) stopping when one can reject the null
hypothesis of a unit root using the results of t and F type test, the results of which are provided in the
table under the columns “tau”, “F” (test statistics) , and “pr<tau”, and “pr<F” (p-values). In the above
output, the results for the trend, constant model are summarized in the third row. The F statistic is the test
of the hypothesis that ß1= ß2=0 and one cannot reject the null of a unit root. The next step is to examine
the tau statistic which is the test that ß1=0. Again one cannot reject the null. One then proceeds to the
constant, no trend model of row two. As with the trend, constant model, one cannot reject the null. Finally
one considers the no constant, no trend model of row one. As with the more general models, one cannot
reject the null of a unit root. The results of the test are consistent with the series having a unit root */


/* Phillips and Perron Tests for stationarity */

proc autoreg
data = newxom05;
model close = /stationarity=(phillips);
run;

proc autoreg
data = lnewxom05;
model logclose = /stationarity=(phillips);
run;


/* KPSS tests for stationarity */
/*-- test for stationarity using quadratic
     spectral kernel and automatic bandwidth selection --*/

proc autoreg data=newxom05;
   model close= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=lnewxom05;
   model logclose= /stationarity=(kpss=(kernel=qs auto));
run; 

/*Unspecified model*/
proc arima data= newxom05;
	identify var = close;
run;

/* Taking the first difference of the non-log series  */

proc arima data=newxom05
plots(only) = (series(corr acf pacf) residual(pacf corr));
identify var = close(1);
run;

data diffnewxom05;
set newxom05;
dclose = dif(close);
run;

PROC PRINT DATA=diffnewxom05(obs=10);
RUN; 

 
/* Taking the first difference of the the log series  */

proc arima data=lnewxom05 out = difflnewxom05
plots(only) = (series(corr acf pacf) residual(pacf corr));
identify var = logclose(1);
run;

data difflnewxom05;
set lnewxom05;
dlogclose = dif(logclose);
run;

PROC PRINT DATA=difflnewxom05(obs=10);
RUN; 

/* running stationatity tests again on differenced I(1) order series */ 

/* augmented dickey fuller tests for stationarity */

proc autoreg data = diffnewxom05;
model dclose = / stationarity =(adf =3); 
run;

proc autoreg data = difflnewxom05;
model dlogclose = / stationarity =(adf =3);
run;

/* Test clearly shows that there is no unit root and series is stationary after first difference */

/* Phillips and Perron Tests for stationarity */

proc autoreg
data = diffnewxom05;
model dclose = /stationarity=(phillips);
run;

proc autoreg
data = difflnewxom05;
model dlogclose = /stationarity=(phillips);
run;

/* Test clearly shows that there is no unit root and series is stationary after first difference */


/* KPSS tests for stationarity */
/*-- test for stationarity using quadratic
     spectral kernel and automatic bandwidth selection --*/

proc autoreg data=diffnewxom05;
   model dclose= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=difflnewxom05;
   model dlogclose= /stationarity=(kpss=(kernel=qs auto));
run; 

/* Test clearly shows that there is no unit root and series is stationary after first difference */

/* White noise test after Differencing */

proc arima data= lnewxom05;
	identify var = logclose(1);




*Estimation and Diagnostics;

/* Estimatiing values of p & q */
proc arima data=newxom05;
identify var = close scan esacf;
run;
proc arima data=lnewxom05;
identify var = logclose scan esacf;
run;

/* ARIMA MODELING  -  EXXON STOCK */

/* Log Model */
/* Since series after first differencing shows negative correlation, and there is sharp decline in pacf and continuing correlations 
in acf indicating MA series, we use q = 2 as a start */

/* running a (0,1,0) model  */
proc arima data= lnewxom05;
	identify var = logclose(1);
	estimate p=0 q=0 method=ml;
	outlier ;
run;


/* running a (0,1,2) model  */
proc arima data= lnewxom05;
	identify var = logclose(1);
	estimate q=2 method=ml;
	outlier ;
run;

/* Based on our model above using a moving average of 2 periods has fairly subsided our correlations to zero if we look at
the correlation table, further the coefficients of MA is signigficant and near to zero */


/* Non-Log Model */
/* Since series after first differencing shows negative correlation, and there is sharp decline in pacf and continuing correlations 
in acf indicating MA series, we use q = 2 as a start */

/* running a (0,1,0) model  */
proc arima data= lnewxom05;
	identify var = close(1);
	estimate p=0 q=0 method=ml;
	outlier ;
run;

/* ARIMA (0,1,2) model */

proc arima data= newxom05;
	identify var = close(1);
	estimate q=2 method=ml;
	outlier ;
run;


/* ARIMA MODELING  -  BP STOCK */

/* running a (0,1,0) model  - to identify AR and MA values */
/*log model*/
proc arima data= lnewbp05;
	identify var = logclose(1);
	outlier ;
run;
/* running (0,1,2) model */
proc arima data= lnewbp05;
	identify var = logclose(1);
	estimate q=2 method=ML;
	outlier ;
run;


/*non-log model*/
proc arima data= newbp05;
	identify var = close(1);
	outlier ;
run;
/* running (0,1,2) model */
proc arima data= newbp05;
	identify var = close(1);
	estimate q=2 method=ML;
	outlier ;
run;


/* ARIMA MODELING  -  CVX STOCK */

/* running a (0,1,0) model  - to identify AR and MA values */
/*log model*/
proc arima data= lnewcvx05;
	identify var = logclose(1);
	outlier ;
run;

/* running (0,1,1) model */
proc arima data= lnewcvx05;
	identify var = logclose(1);
	estimate q=1 method=ML;
	outlier ;
run;


/*non-log model*/
proc arima data= newbp05;
	identify var = close(1);
	outlier ;
run;

/* running (0,1,1) model */
proc arima data= newcvx05;
	identify var = close(1);
	estimate q=1 method=ML;
	outlier ;
run;



/* ARIMA MODELING  -  VLO STOCK */

/* running a (0,1,0) model  - to identify AR and MA values */
/*log model*/
proc arima data= lnewvlo05;
	identify var = logclose(1);
	outlier ;
run;
/* running (0,1,1) model */
proc arima data= lnewvlo05;
	identify var = logclose(1);
	estimate q=1 method=ML;
	outlier ;
run;


/*non-log model*/
proc arima data= newvlo05;
	identify var = close(1);
	outlier ;
run;
/* running (0,1,1) model */
proc arima data= newvlo05;
	identify var = close(1);
	estimate q=1 method=ML;
	outlier ;
run;

/* ARIMA MODELING  -  COP STOCK */

/* running a (0,1,0) model  - to identify AR and MA values */
/*log model*/
proc arima data= lnewcop05;
	identify var = logclose(1);
	outlier ;
run;
/* running (0,1,1) model */
proc arima data= lnewcop05;
	identify var = logclose(1);
	estimate q=1 method=ML;
	outlier ;
run;


/*non-log model*/
proc arima data= newcop05;
	identify var = close(1);
	outlier ;
run;
/* running (0,1,1) model */
proc arima data= newcop05;
	identify var = close(1);
	estimate q=1 method=ML;
	outlier ;
run;








/*******JESSE's SECTION*******
******************************
******************************/
/* step 1, first difference, determing value for p=?
The model below indicates p=1,2,7,8,17,18 have highest autocorrelations*/
proc arima data=lnewxom05 out = difflnewxom05
plots(only) = (series(corr acf pacf) residual(pacf corr));
identify var = logclose(1);
run;
/*the model below indicates q=5 has the highest MA, residual autocorrelations*/
proc arima data = lnewxom05
	plots(only) = (series(corr acf pacf) residual(pacf corr));
	identify var = logclose(1);
	estimate p= (1)(2)(7)(8)(17)(18)
	method=ml;
run;

proc arima data = lnewxom05;
	identify var = logclose(1);
	estimate p= (1)(2)(7)(8)(17)(18) q=(5)
	method=ml;
	forecast lead=30 back =0 alpha=0.05 interval=day id=date out=b;
run;
/*****************************
******END JESSE'S EDITS*******
******************************/

/* Exectuing forecast based on the models identified and selected above */   

/* Arima model - log - forecast */
proc arima data= lnewxom05;
	identify var = logclose(1);
	estimate q=2 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = b; 
run;

/* Printing Forecast values by exponentiating the log values */ 
PROC PRINT DATA=c;
where date >= '5Nov17'd; 
RUN; 


data c;
      set b;
      x = exp(logclose);
	  l95 = exp(l95);
      u95 = exp(u95);
      forecast = exp( forecast + std*std/2 );
   run;

proc sgplot data=c;
   where date >= '5Nov17'd;
   band Upper=u95 Lower=l95 x=date
      / LegendLabel="95% Confidence Limits";
   scatter x=date y=x;
   series x=date y=forecast;
run;
/* model method = Non- log - forecast */
proc arima data= newxom05;
	identify var = close(1);
	estimate q=2 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*Plotting Forecast*/
proc sgplot data=d;
where date >= '5Nov17'd;
   band Upper=u95 Lower=l95 x=date
      / LegendLabel="95% Confidence Limits";
   scatter x=date y=close;
   series x=date y=forecast;
run;


/*Forecast for non-log XOM (0,1,0) model */
proc arima data= newxom05;
	identify var = close(1);
	estimate p=0 q=0 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*Forecast for non-log CVX (0,1,1) model */
proc arima data= newcvx05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*Forecast for non-log BP (0,1,2) model */
proc arima data= newbp05;
	identify var = close(1);
	estimate p=0 q=2 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*Forecast for non-log VLO (0,1,1) model */
proc arima data= newvlo05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*Forecast for non-log COP (0,1,1) model */
proc arima data= newcop05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/******************
**** UTILITIES ****
******************/

/*CPL 0,1,1*/
proc arima data= newcpl05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*ETP 0,1,1*/
proc arima data= newetp05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*HNP 0,1,1*/
proc arima data= newHNP05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*KEP 0,1,1*/
proc arima data= newkep05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 

RUN; 
/*ORA 0,1,1*/
proc arima data= newora05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/******************
**** TRANSPORT ****
******************/
/*JBLU 0,1,1*/
proc arima data= newJBLU05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 

/*ZNH 0,1,1*/
proc arima data= newznh05;
	identify var = close(1);
	estimate p=0 q=1 method = ml;
	forecast lead=30 alpha = 0.05 back = 0 id=date interval=day out = d; 
run;

   /* Printing Forecast valuse for non-log model */ 
PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 


/****** Arimax model*******/
 
/* Combining files XOM */
proc import datafile = 'H:\SAS Class\Project\ARIMAX_Vars\oil.csv' /*JESSE*/
proc import datafile = 'H:\Arimax exogenous variables\oil.csv' /*ASHISH*/
out = oil
dbms = csv
replace;
run;

 
proc import datafile = 'H:\SAS Class\Project\ARIMAX_Vars\gold.csv' /*JESSE*/
proc import datafile = 'H:\Arimax exogenous variables\gold.csv' /* ASHISH*/
out = gold
dbms = csv
replace;
run;

proc import datafile = 'H:\SAS Class\Project\ARIMAX_Vars\Ngas.csv' /*JESSE*/
proc import datafile = 'H:\Arimax exogenous variables\Ngas.csv' /* ASHISH*/
out = gas
dbms = csv
replace;
run;


PROC PRINT DATA=oil(obs=10);
RUN; 
PROC PRINT DATA=gold(obs=10);
RUN; 
PROC PRINT DATA=gas(obs=10);
RUN; 

/* XOM - Joining data */ 
proc sql;
create table oil_gold as
select a.*, b.gold
from oil a left join gold b
on a.DATE=b.DATE
order by Date;
quit;

PROC PRINT DATA=oil_gold(obs=10);
RUN; 
 

proc sql;
create table x_variables as
select c.*, d.gas
from oil_gold c left join gas d
on c.DATE=d.DATE
order by Date;
quit;

 proc timeseries data= x_variables out= x_variables_out;
 id DATE interval=weekday setmissing=previous
 accumulate=average;
 var oil gas gold;
 run;

PROC PRINT DATA=x_variables_out(obs=10);
RUN; 

/* Oil companies */
proc sql;
create table xom_arimax as
select e.*, f.close
from newxom05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=xom_arimax;
RUN; 


proc sql;
create table vlo_arimax as
select e.*, f.close
from newvlo05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

proc sql;
create table cop_arimax as
select e.*, f.close
from newcop05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

proc sql;
create table bp_arimax as
select e.*, f.close
from newbp05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

proc sql;
create table cvx_arimax as
select e.*, f.close
from newcvx05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

/* Utilities */

proc sql;
create table cpl_arimax as
select e.*, f.close
from newcpl05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=cpl_arimax(obs=10);
RUN; 


proc sql;
create table etp_arimax as
select e.*, f.close
from newetp05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=etp_arimax(obs=10);
RUN; 

proc sql;
create table hnp_arimax as
select e.*, f.close
from newhnp05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=hnp_arimax(obs=10);
RUN; 


proc sql;
create table kep_arimax as
select e.*, f.close
from newkep05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=kep_arimax(obs=10);
RUN; 

proc sql;
create table ora_arimax as
select e.*, f.close
from newora05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=ora_arimax(obs=10);
RUN; 


/* Transportation companies */

proc sql;
create table jblu_arimax as
select e.*, f.close
from newjblu05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=jblu_arimax(obs=10);
RUN; 


proc sql;
create table ryaay_arimax as
select e.*, f.close
from newryaay05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=ryaay_arimax(obs=10);
RUN; 


proc sql;
create table skyw_arimax as
select e.*, f.close
from newskyw05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;

PROC PRINT DATA=skyw_arimax(obs=10);
RUN; 

proc sql;
create table cea_arimax as
select e.*, f.close
from newcea05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;
PROC PRINT DATA=cea_arimax(obs=10);
RUN; 


proc sql;
create table znh_arimax as
select e.*, f.close
from newznh05 f left join x_variables_out e
on f.DATE=e.DATE
order by Date;
quit;
PROC PRINT DATA=znh_arimax(obs=10);
RUN; 

/* Print oil companies data */
PROC PRINT DATA=vlo_arimax(obs=10);
RUN; 

PROC PRINT DATA=bp_arimax(obs=10);
RUN; 

PROC PRINT DATA=cop_arimax(obs=10);
RUN; 

PROC PRINT DATA=cvx_arimax(obs=10);
RUN; 

/* We know from our analysis above the close price for all stocks is not stationary, over here we also need 
to see if the exogenous variables are stationary */

/* KPSS test for stationarity on exogenous variables */  

proc autoreg data=xom_arimax;
   model oil= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=xom_arimax;
   model gas= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=xom_arimax;
   model gold= /stationarity=(kpss=(kernel=qs auto));
run; 

/* The above exogenous series are not stationary, lets take the first difference and test again */

data diffx_variables;
set x_variables;
doil = dif(oil);
dgas = dif(gas);
dgold = dif(gold);
run;

proc autoreg data=diffx_variables;
   model doil= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=diffx_variables;
   model dgas= /stationarity=(kpss=(kernel=qs auto));
run; 

proc autoreg data=diffx_variables;
   model dgold= /stationarity=(kpss=(kernel=qs auto));
run; 

/* With taking a non-seasonal difference value of 1 , our exogenous series are now stationary for modelling
now that we have established the differencing value of our series we can further assess based on their ACF and PACF 
the values for AR and MA


/* Running Arimax Model Identification */

proc arima data=xom_arimax;
      identify var=close(1) crosscorr=(oil(1) gold(1) gas(1));
      estimate input=(oil gold gas) plot;
      run;
      estimate input= (oil gold gas);
   run;


 proc arima data=xom_arimax;
 identify var=oil(1)
 estimate p=1 q=1;
 identify var=gold(1)
 estimate p=1 q=1;
 identify var=gas(1)
 estimate p=1 q=1;
 identify var=close(1) crosscorr=(oil(1) gold(1) gas(1));
 estimate input= q=2 (oil gold gas);
 run;
 estimate input= (oil gold gas) plot;
 run;

/* removing gas and gold as they are not significant */

 /* Oil Companies */
/*XOM Arimax */ 
 proc arima data=xom_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

 proc contents data = results;
 run;
 /*Plotting Forecast*/
 title "ARIMAX Forecast for XOM";
proc sgplot data=results;
where date >= '5Nov17'd;
   band Upper=u95 Lower=l95 x=date
      / LegendLabel="95% Confidence Limits";
   scatter x=date y=close;
   series x=date y=forecast;
run;

/*log arimax w/XOM and OIL*/
 proc arima data=logarimax_data;
  	identify var=oil(1);
	estimate p=1;
      identify var=logclose(1) crosscorr=oil(1);
      estimate q=2 input=(oil);
      run;
      forecast lead=30 alpha=0.05 back=0 interval=day id=date out=d;
   run;

PROC PRINT DATA=d;
where date >= '5Nov17'd; 
RUN; 
/* VLO- ARIMAX */

 proc arima data=vlo_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

/* BP- ARIMAX */
 proc arima data=bp_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

/* CVX- ARIMAX */
proc arima data=cvx_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

/* COP- ARIMAX */ 
proc arima data=cop_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

/* Public Utilities */

/* CPL- ARIMAX */ 
 proc arima data=cpl_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

 /* ETP- ARIMAX */ 
 proc arima data=etp_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

/* HNP- ARIMAX */
proc arima data=hnp_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;
 
/* KEP- ARIMAX */
proc arima data=kep_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;
 
/* ORA- ARIMAX */
proc arima data=ora_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;
 
/* Transportation */

/* JBLU- ARIMAX */
proc arima data=jblu_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;
 
/* RYAAY- ARIMAX */
proc arima data=ryaay_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;
 
/* SKYW- ARIMAX */
proc arima data=skyw_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;
 
/* CEA- ARIMAX */ 
 proc arima data=cea_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

/* ZNH- ARIMAX */ 
 proc arima data=znh_arimax;
 identify var=oil(1);
 estimate p=1;
 identify var=close(1) crosscorr=oil(1);
 estimate q=2 input=(oil);
 run;
 forecast lead=30 alpha=0.05 back=0 interval=day id=date out=results;
 run;

