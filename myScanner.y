%{
//------------C declarations-----------
	void yyerror(char *s);
	#include <stdio.h>
	#include <stdlib.h>
	int nameToVal(char x);
	void updateVal(char c,int v);
	int symbols[26];
	extern int yylineno;
	extern char *yytext;
	int yylex();
%}
//-----------YACC Definitions----------

%union {int val;char id;}
%start prog
%token IF WHILE RETURN STAR PLUS LT EE VALUE SYMBOL
%type <val> VALUE expr prog
%type <id> SYMBOL

%%
//---------------------------Production Rules----------------------------------------
prog	: '[' '=' SYMBOL expr ']'		{updateVal($3,$4);}
		| '[' ';' prog prog ']'			{;}
		| '[' IF expr prog prog ']'		{if($3){$4;}else{$5;}}
		| '[' WHILE expr prog ']'		{while($3){$4;}}
		| '[' RETURN expr ']'			{printf("Returned %d\n",$3);}
		;

expr	: '[' PLUS expr expr ']'			{$$=$3+$4;printf("%d\n",$$);}
		| '[' STAR expr expr ']'			{$$=$3*$4;}
		| '[' EE expr expr ']'	{$$=($3==$4);}
		| '[' LT expr expr ']'  {$$=($3<$4);}
		| SYMBOL						{$$=nameToVal($1);}
		| VALUE							{$$=$1;}
		;
%%

//-----------------C Code-------------

void updateVal(char c,int v)
{
	symbols[c-'a']=v;
}
int nameToVal(char c)
{
	return symbols[c-'a'];
}

int main(void)
{
	int i;
	for(i=0;i<26;i++)
		symbols[i]=0;
	return yyparse();
}

void yyerror(char *s)
{
	fprintf(stderr,"%s at line %d, text: %s\n",s,yylineno,yytext);
}