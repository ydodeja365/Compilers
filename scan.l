%{
#include <stdlib.h>
#include "new.h"
#include "y.tab.h"
void yyerror(char *);
%}

%%

"=="            return EE;
"while"         return WHILE;
"if"            return IF;
"return"         return RETURN;
exit			exit(EXIT_SUCCESS);
[a-zA-Z]+ { yylval.sIndex = *yytext - 'a'; return VARIABLE;}

[0-9]+ { yylval.number = atoi(yytext); return INTEGER; }

[<=+*;\[\]] { return *yytext; }

[ \t\n]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
