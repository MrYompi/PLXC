import java_cup.runtime.*;
%%
%{
String aux="";
%}
%cup
%state CAR
%%

<YYINITIAL>{
      "int"        {return new Symbol(sym.TINT);}
      "char"       {return new Symbol(sym.TCHAR);}
      "if"         {return new Symbol(sym.IF);}
      "for"        {return new Symbol(sym.FOR);}
      "else"        {return new Symbol(sym.ELSE);}
      "while"       {return new Symbol(sym.WHILE);}
      "do"          {return new Symbol(sym.DO);}
      "print"       {return new Symbol(sym.PRINT);}
      "("         {return new Symbol(sym.AP);}
      ")"         {return new Symbol(sym.CP);}
      "+"         {return new Symbol(sym.MAS);}
      "++"        {return new Symbol(sym.INC);}
      "--"        {return new Symbol(sym.DEC);}
      "-"         {return new Symbol(sym.MENOS);}
      "%"         {return new Symbol(sym.MOD);}
      "*"         {return new Symbol(sym.POR);}
      "/"         {return new Symbol(sym.DIV);}
      "="         {return new Symbol(sym.IGUAL);}
      "=="        {return new Symbol(sym.IGUALCOMP);}
      ">"         {return new Symbol(sym.MAYOR);}
      "<"         {return new Symbol(sym.MENOR);}
      "!"         {return new Symbol(sym.NO);}
      "&&"        {return new Symbol(sym.AND);}
      "||"        {return new Symbol(sym.OR);}
      ";"         {return new Symbol(sym.PYC);}
      ","         {return new Symbol(sym.COMA);}
      "{"         {return new Symbol(sym.AL);}
      "}"         {return new Symbol(sym.CL);}
      "to"        {return new Symbol(sym.TO);}
      "downto"    {return new Symbol(sym.DOWNTO);}
      "step"      {return new Symbol(sym.STEP);}
      [ \f\t\n\r] {}
      "'"          {yybegin(CAR);}
      0|[1-9][0-9]*      {return new Symbol(sym.ENTERO, yytext());}
      [0-9]*            {return new Symbol(sym.ENTERO, new Integer(Integer.parseInt(yytext(), 8)).toString());}
      0x[0-9]*            {return new Symbol(sym.ENTERO, new Integer(Integer.parseInt(yytext().substring(2, yytext().length()), 16)).toString());}
      [a-zA-Z][a-zA-Z0-9]* {return new Symbol(sym.IDENT, yytext());}
      [^]         {System.out.println("Invalid char: "+yytext());}
}
<CAR>{
      [^]"'"            {yybegin(YYINITIAL);return new Symbol(sym.CHAR, yytext().substring(0, yytext().length()-1));}
      "\\u"[0-9]+"'"      {yybegin(YYINITIAL);return new Symbol(sym.CHAR, Character.toString((char) Integer.parseInt(yytext().substring(2, yytext().length()-1), 16)));}
      [^]               {System.out.println("Invalid char: "+yytext());}
}
