/* CORRELATION HEAT MAP */

/* Read data */

FILENAME REFFILE '/home/u63361983/sasuser.v94/AllCanc_0303.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.all;
	GETNAMES=YES;
RUN;

/* store vars as macro variable */

%let corr_vars = CDens RDens Black Smoking 
                 NearF_D NearR_D SF_D GINI Poverty Binge Obesity
                 MedIncome CheckUps;

/* Perform correlation analysis */
proc corr data=all outp=corr_matrix noprint;
    var &corr_vars ;
run;

/* Transform Data for Heatmap */
data heatmap;
    set corr_matrix(where=(_TYPE_="CORR"));
    array vars {*} &corr_vars ;
    do i = 1 to dim(vars);
        x = vname(vars[i]);
        y = _NAME_;
        value = vars[i];
        output;
    end;
run;
proc fontreg mode=all;
run;


/*Create a dataset with formatted numbers */
data heatmap_annotated;
    set heatmap;
    format value 4.2;  /* Format to 2 decimal places */
    value_text = put(value, 4.2);  /* Convert numeric values to text for display */
run;



/*ODS OUTPUT*/

ods graphics / reset imagename="CORRELATIONHEATMAP" 
outputfmt=pdf width=7.75in height=6in;
ods pdf file="/home/u63361983/sasuser.v94/CORRELATIONHEATMAP.pdf" style=journal2;

proc sgplot data=heatmap_annotated;
    heatmapparm x=x y=y colorresponse=value /  
        colormodel=(darkturquoise palg darkgreen) name="corr";
    gradlegend "corr";

    /* Step 2: Overlay text labels for values */
    text x=x y=y text=value_text / position=center textattrs=(size=10pt weight=bold color=white);

    xaxis discreteorder=data display=(nolabel);
    yaxis discreteorder=data display=(nolabel);
    title font="Helvetica" height=16pt "Correlation Heatmap";
run;

ods pdf close;









