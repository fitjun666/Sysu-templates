%% BibTeX style for the supplied SYSU Physics proposal Word template.
%% UTF-8; citation order, no alphabetical sorting.
%% zh articles: Author. Title[J]. Journal，year，volume（number）：pages.
%% en articles: A. Author, B. Author, and C. Author, Title. Journal volume, pages（year）
%% Parentheses are Chinese per the explicit punctuation rule in section VI.
%% The remaining types follow the book / conference / thesis / web examples.
ENTRY
  { author editor translator title journal volume number year month day
    pages address publisher booktitle school type language langid url note }
  {} {}
INTEGERS { nameptr numnames namelimit entrycount }
STRINGS { s t names }

FUNCTION {not} { { #0 } { #1 } if$ }
FUNCTION {and} { 'skip$ { pop$ #0 } if$ }
FUNCTION {or} { { pop$ #1 } 'skip$ if$ }
FUNCTION {field.or.null} { duplicate$ empty$ { pop$ "" } 'skip$ if$ }

FUNCTION {is.zh}
{ language field.or.null "zh" = language field.or.null "chinese" = or
  langid field.or.null "chinese" = or langid field.or.null "zh" = or }

FUNCTION {write.field}
{ duplicate$ empty$ { pop$ } { write$ } if$ }

FUNCTION {author.separator}
{ is.zh { "，" } { ", " } if$ }

FUNCTION {format.names}
{ field.or.null 's :=
  s empty$
    { "" }
    { #1 'nameptr :=
      s num.names$ 'numnames :=
      numnames #3 > { #3 } { numnames } if$ 'namelimit :=
      "" 'names :=
      { nameptr namelimit > not }
      { is.zh
          { s nameptr "{ll}{ff}" format.name$ }
          { s nameptr "{f. }{vv~}{ll}{, jj}" format.name$ }
        if$ 't :=
        t "others" =
          { names author.separator *
            is.zh { "等" } { "et~al." } if$ * 'names := }
          { nameptr #1 >
              { names author.separator * 'names :=
                is.zh not nameptr numnames = and numnames #3 > not and
                  { names "and " * 'names := } 'skip$ if$ }
              'skip$ if$
            names t * 'names := }
        if$
        nameptr #1 + 'nameptr := }
      while$
      numnames #3 >
        { names author.separator *
          is.zh { "等" } { "et~al." } if$ * 'names := }
        'skip$ if$
      names }
  if$ }

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$ cite$ write$ "}" write$ newline$ }

FUNCTION {output.authors.period}
{ author empty$
    { editor empty$ 'skip$ { editor format.names write$ ". " write$ } if$ }
    { author format.names write$ ". " write$ }
  if$ }

FUNCTION {output.title}
{ title empty$
    { "Missing title in " cite$ * warning$ }
    { title write$ }
  if$ }

FUNCTION {output.address.publisher}
{ address empty$ 'skip$ { address write$ "：" write$ } if$
  publisher write.field
  year empty$ 'skip$ { "，" write$ year write$ } if$ }

FUNCTION {output.pages}
{ pages empty$ 'skip$ { "：" write$ pages write$ } if$ }

FUNCTION {article}
{ output.bibitem
  is.zh
    { output.authors.period output.title "[J]. " write$
      journal write.field
      year empty$ 'skip$ { "，" write$ year write$ } if$
      volume empty$
        { number empty$ 'skip$ { "，" write$ number write$ } if$ }
        { "，" write$ volume write$
          number empty$ 'skip$ { "（" write$ number write$ "）" write$ } if$ }
      if$
      output.pages "." write$ }
    { author format.names write$ ", " write$
      output.title ". " write$ journal write.field
      volume empty$ 'skip$ { " " write$ volume write$ } if$
      number empty$ 'skip$ { "（" write$ number write$ "）" write$ } if$
      pages empty$ 'skip$ { ", " write$ pages write$ } if$
      year empty$ 'skip$ { "（" write$ year write$ "）" write$ } if$ }
  if$ newline$ }

FUNCTION {book}
{ output.bibitem output.authors.period output.title "[M]. " write$
  translator empty$ 'skip$
    { translator format.names write$ "，译. " write$ } if$
  output.address.publisher output.pages "." write$ newline$ }

FUNCTION {inproceedings}
{ output.bibitem output.authors.period output.title "[C]//" write$
  booktitle write.field ". " write$
  output.address.publisher output.pages "." write$ newline$ }

FUNCTION {thesis}
{ output.bibitem output.authors.period output.title "[D]. " write$
  address empty$ 'skip$ { address write$ "：" write$ } if$
  school write.field type write.field
  year empty$ 'skip$ { "，" write$ year write$ } if$
  output.pages "." write$ newline$ }

FUNCTION {phdthesis} { thesis }
FUNCTION {mastersthesis} { thesis }
FUNCTION {conference} { inproceedings }
FUNCTION {incollection} { inproceedings }
FUNCTION {proceedings} { book }

FUNCTION {misc}
{ output.bibitem output.authors.period output.title ". " write$
  url empty$ 'skip$ { "\url{" write$ url write$ "}" write$ } if$
  year empty$ 'skip$ { "，" write$ year write$ } if$
  month empty$ 'skip$ { "，" write$ month write$ } if$
  day empty$ 'skip$ { "，" write$ day write$ } if$
  note empty$ 'skip$ { ". " write$ note write$ } if$ newline$ }
FUNCTION {online} { misc }
FUNCTION {electronic} { misc }
FUNCTION {default.type} { misc }

FUNCTION {initialize} { #0 'entrycount := }
FUNCTION {count.entry} { entrycount #1 + 'entrycount := }
FUNCTION {begin.bib}
{ "\begin{thebibliography}{" write$
  entrycount int.to.str$ write$ "}" write$ newline$ }
FUNCTION {end.bib}
{ newline$ "\end{thebibliography}" write$ newline$ }

READ
EXECUTE {initialize}
ITERATE {count.entry}
EXECUTE {begin.bib}
ITERATE {call.type$}
EXECUTE {end.bib}
