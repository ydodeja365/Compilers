%{
	#include "y.tab.h"
%}
%%
"if" 	return IF;
"while"	return WHILE;
"return" {return RETURN;}
"+"	return PLUS;
"*"	return STAR;
"<"	return LT;
"=="	return EE;
"="	return *yytext;
[\[\]]	return *yytext;
[\n\t ]	;
[=;]	return *yytext;
[0-9]+ 	{yylval.val=atoi(yytext);return VALUE;}
[A-Za-z]+	{yylval.id=yytext[0];return SYMBOL;}
.	{yyerror("Unexpected Character");}
%%
int yywrap(void)
{
	return 1;
}