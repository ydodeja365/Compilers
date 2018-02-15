#define IF 257
#define WHILE 258
#define RETURN 259
#define STAR 260
#define PLUS 261
#define LT 262
#define EE 263
#define VALUE 264
#define SYMBOL 265
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {int val;char id;} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
