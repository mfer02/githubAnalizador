//REGLAS LEXICAS DEL ANALIZADOR

package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Palabra reservadas */
( if ) {lexeme=yytext(); return If;}
( else ) {lexeme=yytext(); return Else;}
( do ) {lexeme=yytext(); return Do;}
( while ) {lexeme=yytext(); return While;}
( for ) {lexeme=yytext(); return For;}
( "main" ) {lexeme=yytext(); return Main;}
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); return T_dato;}
( String ) {lexeme=yytext(); return Cadena;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}
( "+" ) {lexeme=yytext(); return Suma;}
( "-" ) {lexeme=yytext(); return Resta;}
( "*" ) {lexeme=yytext(); return Multiplicacion;}
( "/" ) {lexeme=yytext(); return Division;}
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}


/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Error de analisis */
 . {return ERROR;}