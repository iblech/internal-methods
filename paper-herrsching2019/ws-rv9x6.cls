%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% For support: Yolande Koh, <ykoh@wspc.com.sg>               
%%              D. Rajesh Babu, <rajesh@wspc.com.sg>         
%%
%% Trim Size: 9.61in x 6.69in
%% Text Area: 8in (include runningheads) x 5in
%% Main Text: 10/13pt
%%
%% The content, structure, format and layout of this style file is
%% the property of World Scientific Publishing Co. Pte. Ltd.
%% Copyright (C) 2015 World Scientific Publishing Co.
%% All rights are reserved. Last updated on 05-05-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ws-rv9x6}[2015/04/20 v2r Standard LaTeX document class]
\newif\if@restonecol
\newif\if@openright
\@twosidetrue\@mparswitchtrue\@twocolumnfalse
%
\newif\if@wsdraft
\newif\if@wsmaster  %rvs
\newif\if@bcrhead
\newif\if@csrhead
\newif\if@acrhead
\newif\if@onethmnum
\newif\if@addchapnum
\newif\if@eqsecspace
%
%
\hoffset=0.15in
\voffset=0.25in
%
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
%
\DeclareOption{master}{\@wsmastertrue}  %rvs
\DeclareOption{bcrhead}{\@bcrheadtrue}
\DeclareOption{csrhead}{\@csrheadtrue}
\DeclareOption{acrhead}{\@acrheadtrue}
\DeclareOption{onethmnum}{\@onethmnumtrue}
\DeclareOption{wsdraft}{\@wsdrafttrue}
\DeclareOption{eqsecspace}{\@eqsecspacetrue}
\DeclareOption{addchapnum}{\@addchapnumtrue}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{twocolumn}{\twocolumn\sloppy\flushbottom}
\ExecuteOptions{a4,10pt,twoside,onecolumn,final,openright,acrhead}  %maintext-10pt
\ProcessOptions
%
\newdimen\typeheight
\newdimen\typewidth 
\newdimen\normaltextheight
\newdimen\normaltextwidth
\newdimen\tablewidth
\newdimen\tempdimen
\newdimen\tablewd
%
\newbox\tempbox
%
\newcommand\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
%
\newcount\minute
\newcount\hour
\def\currenttime{%
    \minute\time
    \hour\minute
    \divide\hour60
    \the\hour:\multiply\hour60\advance\minute-\hour\the\minute}
%
\newtoks\title
\title{Book Title}
\newcommand\booktitle{\the\title}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\indexname{Index}
\newcommand\appendixname{Appendix}
\newcommand\prefacename{Preface}
\newcommand\forewordname{Foreword}
\newcommand\acknowledgmentsname{Acknowledgments}
\newcommand\acknowledgmentname{Acknowledgment}
%\newcommand\chapname{Chapter~\thechapter\unskip\hspace*{1em}}
\newcommand\partname{Part}
\newcommand\outchapter{\thechapter.\unskip\hspace*{1em}}  %rvs
\newcommand\appname{Appendix~\theappendix}
\newcommand\bibname{References}  %rvs
%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
%%
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\if@wsmaster
    \setcounter{tocdepth}{0}    %rvs
\else
    \setcounter{tocdepth}{2}    %rvs
\fi
\newdimen\@cnumwidth        %ADDED FOR CONTENT
\setlength\@cnumwidth{5pc}  %ADDED FOR CONTENT

\newcommand\mastertoc{%  %rvs
    {\cleardoublepage
     \renewcommand\thepage{\roman{page}}
         \thispagestyle{plain}%
         \global\@topnum\z@
         \@afterindentfalse
    \if@twocolumn
        \@restonecoltrue\onecolumn
        \else
        \@restonecolfalse
        \fi
    {\vbox to 110pt{%
    \vspace*{33pt}
    \parindent\z@\raggedright\reset@font
    {\centering{{\CNfont \phantom{Chapter \thechapter}\par}
        \vskip 0.25in
    \vbox{\CTfont\contentsname}\par}\par}\nobreak\vfill}}
\markboth{\booktitle}{Contents}
\if@csrhead
\markboth{Contents}{Contents}
\fi
\if@acrhead
\markboth{Contents}{Contents}
\fi
\@starttoc{toc}%
        \if@restonecol \twocolumn\fi}\par\vfill\pagebreak\par}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%   %3em
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode\bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
%
%CHANGE HERE FOR CONTENT TEXT
\if@wsmaster
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.3em \@plus\p@         %CONTROL CHAPTER HEADS
    \setlength\@tempdima{1.8em}%   %CONTROL P1-heads TURNLINES
    \begingroup
      \parindent \z@ \rightskip \@cnumwidth      %ADDED HERE
      \parfillskip -\@cnumwidth                  %ADDED HERE
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {#1}\nobreak\hfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \vspace*{4pt}    %more space
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@author[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip0em \@plus\p@
     \setlength\@tempdima{1.8em}%
     \begingroup
      \parindent1.9em \rightskip \@cnumwidth
      \parfillskip -\@cnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\it#1}\nobreak\hfill \nobreak\hb@xt@\@pnumwidth{\hss \phantom{#2}}\par
      \vskip0.3em \@plus\p@
      \penalty\@highpenalty
    \endgroup
  \fi}
\else
\newcommand*\l@chapter[2]{}
\newcommand*\l@author[2]{}
\fi
%
\newcommand*\l@appenx[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em  \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%
%CHANGE HERE FOR CONTENT TEXT of \chapter*
\newcommand*\l@schapter[2]{%
  \ifnum \c@tocdepth >\m@ne
   \addpenalty{-\@highpenalty}%
   \vskip 1.2em \@plus\p@         %CONTROL SPACE FOR TOC AS IN \chapter
   \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode        %roman content.toc pg nos.
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\it #1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \vspace*{1pt}    %more space
      \penalty\@highpenalty
    \endgroup
  \fi}
%
%default toc
\if@addchapnum
    \newcommand*\l@section{\@dottedtocline{1}{0em}{2.1em}}         %1.1
    \newcommand*\l@subsection{\@dottedtocline{2}{2.1em}{2.9em}}    %1.1.1
    \newcommand*\l@subsubsection{\@dottedtocline{3}{6.9em}{3.7em}} %1.1.1.1
\else
    \newcommand*\l@section{\@dottedtocline{1}{0em}{1.9em}}       %1
    \newcommand*\l@subsection{\@dottedtocline{2}{1.9em}{2.5em}}    %1.1
    \newcommand*\l@subsubsection{\@dottedtocline{3}{6.9em}{3.3em}} %1.1.1
\fi

\def\smalltoc{
\if@addchapnum
    \renewcommand*\l@section{\@dottedtocline{1}{0em}{2.1em}}         %1.1
    \renewcommand*\l@subsection{\@dottedtocline{2}{2.1em}{2.9em}}    %1.1.1
    \renewcommand*\l@subsubsection{\@dottedtocline{3}{6.9em}{3.7em}} %1.1.1.1
\else
    \renewcommand*\l@section{\@dottedtocline{1}{0em}{1.7em}}         %1
    \renewcommand*\l@subsection{\@dottedtocline{2}{1.7em}{2.2em}}    %1.1
    \renewcommand*\l@subsubsection{\@dottedtocline{3}{6.9em}{3.3em}} %1.1.1
\fi
}

\def\bigtoc{
\if@addchapnum
    \renewcommand*\l@section{\@dottedtocline{1}{0em}{2.8em}}          %1.12
    \renewcommand*\l@subsection{\@dottedtocline{2}{2.8em}{3.5em}}     %1.12.1
    \renewcommand*\l@subsubsection{\@dottedtocline{3}{7.8em}{4.2em}}  %1.12.1.1
\else
    \renewcommand*\l@section{\@dottedtocline{1}{0em}{2.2em}}          %12
    \renewcommand*\l@subsection{\@dottedtocline{2}{2.2em}{2.6em}}     %12.1
    \renewcommand*\l@subsubsection{\@dottedtocline{3}{7.4em}{3.8em}}  %12.1.1
\fi
}
%
\newcommand*\l@paragraph{\@dottedtocline{4}{8.7em}{5em}}%10em
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand*\l@appsection{\@dottedtocline{1}{\z@}{6.5em}}
\newcommand*\l@appsubsection{\@dottedtocline{2}{6.5em}{3.4em}}
%
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\listfigurename}{\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \cleardoublepage
    }
\newcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{\listtablename}{\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \cleardoublepage
    }
\let\l@table\l@figure
%
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{13}  %Main Text is 10/13pt
   \abovedisplayskip6\p@\@plus4\p@\@minus6\p@
   \abovedisplayshortskip \abovedisplayskip
   \belowdisplayshortskip \abovedisplayskip
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
%
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 9.5\p@ \@plus3\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 5\p@ \@plus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 5\p@ \@plus3\p@
               \parsep 2\p@ \@plus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
%
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{10}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FONTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\rhfont{\footnotesize}
\def\PNfont{\large\bfseries\boldmath{}}  %rvs
\def\PTfont{\Large\bfseries\boldmath{}}  %rvs
\def\CNfont{\fontsize{11}{14}\bfseries\boldmath\selectfont{}}  %rvs
\def\CTfont{\fontsize{11}{14}\bfseries\boldmath\selectfont{}}  %rvs
%
\def\sectionfont{\fontsize{10}{13}\bfseries\boldmath\selectfont\rightskip2pc}
\def\subsectionfont{\fontsize{10}{13}\bfseries\boldmath\itshape\selectfont\rightskip2pc}
\def\subsubsectionfont{\fontsize{10}{13}\itshape\selectfont\rightskip3pc}%
\def\paragraphfont{\fontsize{10}{13}\bfseries\boldmath\selectfont\rightskip3pc}
%
\def\figurecaptionfont{\footnotesize}
\def\tablefont{\footnotesize}
\def\tablecaptionfont{\footnotesize}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FONTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}%12/14
\newcommand\Large{\@setfontsize\Large\@xviipt{21}}%17/21
\newcommand\LARGE{\@setfontsize\LARGE\@xxvpt{25}}%25/25
%
\typeheight7.35truein
%
\setlength\parindent{15pt}
\setlength\headheight{5\p@}  %8
\setlength\headsep   {22pt}  
\setlength\topskip  {7\p@}
\setlength\footskip{0.35in}
\setlength\maxdepth{4\p@}
\setlength\@maxdepth\maxdepth
\setlength\textwidth{4.5truein}
\normaltextwidth\textwidth
\setlength\textheight\typeheight
\advance\textheight-\headheight
\advance\textheight-\headsep
\advance\textheight-2pt
\setlength\normaltextheight{\textheight}
\setlength\oddsidemargin{.73in}
\setlength\evensidemargin{.73in}
\setlength\marginparwidth{.5in}
\setlength\marginparsep{7\p@}
\setlength\marginparpush{5\p@}
\setlength\topmargin{0.5in}
\setlength\footnotesep{6\p@}
\setlength{\skip\footins}{6\p@ \@plus 4\p@}
\setlength\floatsep    {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{15.1\p@ \@plus 6\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
%
\setcounter{secnumdepth}{3}
\newcounter{part}
\newcounter{chapter}
\newcounter{schapter} %added for hyperref
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
%
\renewcommand\thepart{\arabic{part}}
\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\theschapter{\arabic{schapter}} %added for hyperref
\if@addchapnum
    \renewcommand\thesection{\thechapter.\arabic{section}}
\else
    \renewcommand\thesection{\arabic{section}}
\fi
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph{\relax}
%
% standard book style section spacing
\newcommand\section{\@startsection{section}{1}{\z@}%
                                  {-3.5ex \@plus -1ex \@minus -.2ex}%
                                  {2.3ex \@plus.2ex}%
                                  {\sectionfont}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\subsectionfont}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\subsubsectionfont}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                  {3.25ex \@plus1ex \@minus.2ex}%
                                  {-1em}%
                                  {\paragraphfont}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                  {3.25ex \@plus1ex \@minus .2ex}%
                                  {-1em}%
                                  {\paragraphfont}}
% if equal spacing option loaded
\if@eqsecspace % to override the default section header spacing
\renewcommand\section{\@startsection{section}{1}{\z@}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\sectionfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\subsectionfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\subsubsectionfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\paragraphfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                  {-3.25ex\@plus -1ex \@minus -.2ex}%
                                  {1.5ex \@plus .2ex}%
                                  {\paragraphfont}}
\fi
%
\def\@seccntformat#1{{\upshape\csname the#1\endcsname.}\hskip .6em}
%
\newcommand\part{\cleardoublepage
                 \renewcommand\thepage{\arabic{page}}
                 \thispagestyle{pblind}%
                 \global\@topnum\z@
                 \@afterindentfalse
                 \secdef\@part\@spart}
%
\def\@part[#1]#2#3{%
 {\vspace*{3pc}
  \vbox{\parindent\z@ \reset@font
         \refstepcounter{part}
    \addcontentsline{toc}{part}{#2}
         \vskip 1.4in
         {\centering{\PNfont \partname\nobreakspace\thepart}
         \par
         \vskip 12\p@
    \vbox{\PTfont #1}\par}
    \vskip .7truein
    \vbox{\noindent#3}\par
    \nobreak}}
  \@endpart}
%
\def\@spart#1{%
    {\PTfont #1\par}%
    \@endpart}
%
\def\@endpart{\vfil%\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{pblind}%
                \blankpage
              \fi}
%
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
%
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
            \renewcommand\thepage{\arabic{page}}
            \refstepcounter{chapter}%
                        \else \fi
                    \chaptermark{#1}%
            \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
            \def\@makefnmark{{\@textsuperscript{\normalfont\@thefnmark}}}%
            \long\def\@makefntext##1{\noindent
            \@textsuperscript{\normalfont\@thefnmark}{##1}}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                       \addcontentsline{toc}{chapter}{\outchapter#1}
                      \@afterheading
                    \fi}
%
\def\@makechapterhead#1{%
    {\vbox to 110pt{%        %rvs
    \def\thefootnote{\@fnsymbol\c@footnote}%
    \vspace*{33pt}      %VSPACE FROM TRIM SIZE
        \parindent\z@\raggedright\reset@font
        {\centering{{\CNfont Chapter~\thechapter\par}%
         \vskip 0.25in
    \vbox{
    \CTfont #1\par
    }\par}\par}\nobreak\vfill}}}%  %rvs
%
\def\@schapter#1{
    \markboth{#1}{#1}
        \@makeschapterhead{#1}%
         \addcontentsline{toc}{schapter}{#1}
        \@afterheading}
%
\def\@makeschapterhead#1{%
    \refstepcounter{schapter} %added for hyperref
    {\vbox to 110pt{%      %rvs
    \vspace*{33pt}  %change pt here
    \parindent\z@\raggedright\reset@font
        {\centering{{\CNfont \phantom{Chapter \thechapter}\par}
        \vskip 0.25in 
        \vbox{\CTfont #1}\par}\par}\nobreak\vfill}}}  %rvs
%
\def\authorfont{\fontsize{10}{12}\selectfont}

\def\author{\@ifnextchar[{\@bauthor}{\@nauthor}}

\def\@nauthor#1{\authormark{#1}\par
    {\centering{\authorfont#1}\par\vspace*{0.05in}}
    \addcontentsline{toc}{author}{#1}}

\def\@bauthor[#1]#2{\authormark{#1}\par
    {\centering{\authorfont#2}\par\vspace*{0.05in}}
    \ifx#1\empty\else
    \addcontentsline{toc}{author}{#1}\fi}
%
\def\addressfont{\fontsize{10}{12}\selectfont}      
\def\address#1{\par
    {\centering\it{\addressfont#1}\par\vspace*{11pt}}
     %\addcontentsline{toc}{author}{#1}
}
%
\setcounter{topnumber}{4}
\renewcommand\topfraction{.9}
\setcounter{bottomnumber}{4}
\renewcommand\bottomfraction{.9}
\setcounter{totalnumber}{8}
\renewcommand\textfraction{.1}
\renewcommand\floatpagefraction{.9991}
\setcounter{dbltopnumber}{5}
\renewcommand\dbltopfraction{.9}
\renewcommand\dblfloatpagefraction{.9}
%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{8\p@ plus3pt minus3pt}
\setlength\belowcaptionskip{-1\p@}
%
\newbox\wscaptionbox
%
\def\FigName{figure}%
%
\long\def\@makecaption#1#2{%
  \ifx\FigName\@captype
        \vskip\abovecaptionskip
    \setbox\wscaptionbox\hbox{%
    {\figurecaptionfont#1\unskip\ignorespaces\hskip1em#2\par}}
    \ifdim\wd\wscaptionbox>\hsize
    {\figurecaptionfont#1\unskip\ignorespaces\hskip1em#2\par}\par
    \else
    \centerline{\figurecaptionfont#1\unskip\ignorespaces\hskip1em#2}\par
    \fi\else\global\setbox\wscaptionbox\hbox{%
    {\tablecaptionfont#1\ignorespaces\hskip1em#2\par}}
    \fi
}
%
\def\figsubcap#1{\par\noindent\centering\footnotesize(#1)}
\def\figurename{Fig.}
\newcounter{figure}[chapter]
\if@addchapnum
    \renewcommand\thefigure{\thechapter.\@arabic\c@figure}
\else
    \renewcommand\thefigure{\@arabic\c@figure}
\fi
\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure.\nobreak}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%
\newcounter{minifig}[figure]
\def\minifigure[#1]#2{% requires subfigure package
    \refstepcounter{minifig}
    \renewcommand\p@subfigure{}
    \renewcommand*{\thesubfigure}{\thefigure}
    \renewcommand*{\@thesubfigure}{\figurename~\thesubfigure.\hskip\subfiglabelskip}
    \subfigure[#1]{#2}%
    \renewcommand\p@subfigure{}
    \renewcommand*{\thesubfigure}{(\alph{subfigure})}
    \renewcommand*{\@thesubfigure}{\thesubfigure.\hskip\subfiglabelskip}
    \setcounter{subfigure}{0}\addtocounter{figure}{1}
}
%
\newenvironment{tablehere}
  {\parskip0pt\topskip 13pt plus 2pt minus 1pt\def\@captype{table}\begin{small}\begin{center}}
  {\end{center}\end{small}\vskip 13pt plus 2pt minus 1pt}
  
\newenvironment{figurehere}
  {\parskip0pt\topskip 13pt plus 2pt minus 1pt\def\@captype{figure}}
  {\vskip 13pt plus 2pt minus 1pt}
%
\newenvironment{boxedtxt}
               {\par\vskip 6pt plus2pt minus1pt
        \parindent0pt\leftskip0pt
        \itemindent0pt\leftmargin0pt
        \fboxsep=8pt
        \normalfont
        \begin{boxedminipage}[0.5pt]{\hsize}}
               {\par\end{boxedminipage}
        \vskip 6pt plus2pt minus1pt}
%
\def\ArtDir{\jobname/}
\def\figurebox#1#2#3{%
        \def\arg{#3}%
        \ifx\arg\empty
        {\hfill\vbox{\hsize#2\hrule\hbox to #2{%
                \vrule\hfill\vbox to #1{\hsize#2\vfill}\vrule}\hrule}\hfill}%
        \else
        \hbox to \hsize{\hfill\includegraphics{\ArtDir#3}\hfill}
        \fi}
%
\def\ArtWork#1{\noindent\hfill\includegraphics{#1}\hfill}%
%
\newcounter{table}[chapter]
\if@addchapnum
    \renewcommand\thetable{\thechapter.\@arabic\c@table}
\else
    \renewcommand\thetable{\@arabic\c@table}
\fi
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table~\thetable.\nobreak}
\newenvironment{table}
               {\@float{table}}
               {\vskip5pt\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
%
\newdimen\tabledim
%
\long\def\tbl#1#2{%
    \parindent\z@\ignorespaces\noindent\tablecaptionfont
    \caption{#1}%
    \par\setbox\tempbox\hbox{\tablefont #2}%
    \tablewd\hsize\advance\tablewd-\wd\tempbox\global\divide\tablewd\tw@
    \ifdim\wd\wscaptionbox<\wd\tempbox\centerline{\unhbox\wscaptionbox}
    \else\leftskip\tablewd\rightskip\leftskip{\unhbox\wscaptionbox}\par
    \fi\centerline{\box\tempbox}
}%
%
\def\Hline{\noalign{\ifnum0=`}\fi\hrule \@height .5pt
        \futurelet\@tempa\@xhline}%
\def\toprule{\\[-6pt]\hline\\[-5.5pt]}
\def\colrule{\\[-7.5pt]\hline\\[-5.5pt]}
\def\botrule{\\[-7pt]\hline\\[-8.5pt]}
\newcommand{\centre}[2]{\multicolumn{#1}{c}{#2}}
%
\newenvironment{tabnote}{%
    \par\vskip5pt\footnotesize%
    \@ifnextchar[{\@tabnote}{\@tabnote[]}}{%
    \par\vskip-5pt}
\def\@tabnote[#1]{%
    \leftskip\tablewd\rightskip\leftskip {\it #1} \ignorespaces}
%
\long\def\ttbl#1#2#3{%
    \parindent\z@
    \noindent
    \tablecaptionfont
    \caption{#2}%
    \tablewd\hsize
    \advance\tablewd-#1
    \global\divide\tablewd\tw@
    \ifdim \wd\wscaptionbox<#1
    \centerline{\unhbox\wscaptionbox}
    \else
    {\leftskip\tablewd% plus1fill{}
    \rightskip\tablewd% plus1fill{}
    \unhbox\wscaptionbox\par}
    \fi
    \vskip-8pt
    \centerline{#3}
}%
%
\newenvironment{InTextTable}{%
    \par\addvspace{16pt plus6pt minus6pt}%
    \begin{center}\tablecaptionfont\noindent\ignorespaces
}{%
    \end{center}\par\addvspace{17pt plus6pt minus6pt}}
%
%%%%%%%%%%%%%%%%%%%%%% Flush Left Lists %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@listI{\leftmargin\leftmargini
            \listparindent\itemindent
            \parsep \z@\labelsep.5em
            \topsep 6.5\p@ \@plus3\p@% \@minus2\p@
            \itemsep0\p@}
%
\let\@listi\@listI
\@listi
%
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    3.5\p@ \@plus2\p@ \@minus\p@
              \parsep    \z@
              \itemsep\z@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep 3.5\p@ \@plus\p@\@minus\p@
              \parsep \z@
             % \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep0\p@}%
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%
\setlength\leftmargini{3pc}
\setlength\leftmarginii{2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv{1.7em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\setlength\leftmargin{\leftmargini}
\setlength\listparindent{\parindent}
\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\renewcommand\theenumi{\arabic{enumi}}
\renewcommand\theenumii{\alph{enumii}}
\renewcommand\theenumiii{\roman{enumiii}}
\renewcommand\theenumiv{\Alph{enumiv}}
\newcommand\labelenumi{(\theenumi)}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{$\m@th\bullet$}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\ast$}
\newcommand\labelitemiv{$\m@th\cdot$}
%
\def\enummax#1{\setbox\tempbox=\hbox{#1\hskip\labelsep}%
  \expandafter\global\csname leftmargin\romannumeral\the\@enumdepth\endcsname\wd\tempbox}
%
\def\enumerate{\@ifnextchar[{\@enumerate}{\@enumerate[\csname label\@enumctr\endcsname]}}
%
\def\@enumerate[#1]{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne\edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \enummax{#1}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{\hss\llap{##1}}}\fi}
%
\let\Item\item
\newenvironment{enumeroman}{%
  \def\theenumi{\roman{enumi}}\def\theenumii{\roman{enumii}}%
  \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
        \let\item\Item
  \begin{enumerate}%
}{%
  \end{enumerate}}
%
\newenvironment{alphlist}{%
  \def\theenumi{\alph{enumi}}\def\theenumii{\alph{enumii}}%
  \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
        \let\item\Item
  \begin{enumerate}%
}{%
  \end{enumerate}}
%
\newenvironment{Alphlist}{%
  \def\theenumi{\Alph{enumi}}\def\theenumii{\Alph{enumii}}%
  \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
        \let\item\Item
  \begin{enumerate}%
}{%
  \end{enumerate}}
%
\newenvironment{arabiclist}{%
    \def\theenumi{\arabic{enumi}}\def\theenumii{\arabic{enumii}}
   \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}% %(2)
%  \def\labelenumi{\theenumi.}\def\labelenumii{(\theenumii)}%  %2. 
    \let\item\Item
    \begin{enumerate}
    }{%
    \end{enumerate}}
%
\newenvironment{romanlist}{%
    \def\theenumi{\roman{enumi}}\def\theenumii{\roman{enumii}}
    \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
    \let\item\Item
    \begin{enumerate}
    }{%
    \end{enumerate}}
%
\newenvironment{Romanlist}{%
    \def\theenumi{\Roman{enumi}}\def\theenumii{\Romanlist{enumii}}
    \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
    \let\item\Item
    \begin{enumerate}
    }{%
    \end{enumerate}}
%
\newenvironment{itemlist}{%
    \def\labelenumi{\labelitemi}
    \let\item\Item
    \begin{enumerate}
    }{%
    \end{enumerate}}
%
\newenvironment{unnumlist}{%
    \let\item\Item
    \leftmargini2pc
    \ifnum \@enumdepth >3 \@toodeep\else
        \advance\@enumdepth \@ne
        \list{}{\itemindent-2pc\topsep6pt
              \def\makelabel##1{\hss\llap{##1}}}%
   \fi
}{%
  \endlist}
%
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\small\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
%
%%%%%%%%%%%%%%%%%%%%%%%% End Flush Left Lists %%%%%%%%%%%%%%%%%%%%%%%%%
%
\setlength\arraycolsep{1.5pt}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
%
\@addtoreset{equation}{chapter}
\if@addchapnum
    \renewcommand\theequation{\thechapter.\@arabic\c@equation} %(1.1)
\else
    \renewcommand\theequation{\@arabic\c@equation} %(1)
\fi
%
%rvs %
\@addtoreset{footnote}{chapter}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent\@makefnmark{\rm#1}}
%
\def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
    \mathchar "278\or \mathchar "27B\or \|\or **\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}}
%
\def\body{
\setcounter{footnote}{0}
\def\thefootnote{\alph{footnote}}
\def\@makefnmark{{$^{\rm \@thefnmark}$}}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\RightMark{}
\def\authormark#1{\relax}
\mark{{}{}}
%
\def\ps@plain{%
     \let\@mkboth\@gobbletwo
     \let\@oddhead\@empty
     \def\@oddfoot{\hfill\rhfont\thepage\hfill}%
     \let\@evenhead\@empty
     \let\@evenfoot\@oddfoot}
%
\def\ps@csrhead{%
   \let\@oddfoot\@empty\let\@evenfoot\@empty
   \def\@evenhead{\hbox to 4.5in{\rhfont\thepage\hfil{\it\leftmark}}}%
   \def\@oddhead{\hbox to 4.5in{\rhfont{\it\rightmark}\hfil\thepage}}%
   \let\@mkboth\markboth
   \def\chaptermark##1{\markboth{##1}{}}%
   \def\sectionmark##1{\markright{\thesection.\enskip##1}}}
%
\def\ps@bcrhead{%
   \let\@oddfoot\@empty\let\@evenfoot\@empty
   \def\@evenhead{{\rhfont\thepage}\hfill{\rhfont\it\booktitle}\hfill}%
   \def\@oddhead{\hfill{\rhfont\it\rightmark}\hfill{\rhfont\thepage}}%
   \let\@mkboth\@gobbletwo
   \def\chaptermark##1{\markboth{}{##1}}%
   \let\sectionmark\@gobble}
%
\def\ps@acrhead{%
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    \def\@evenhead{{\rhfont\thepage}\hfill{\rhfont\it\leftmark}\hfill}%
    \def\@oddhead{\hfill{\rhfont\it\rightmark}\hfill{\rhfont\thepage}}%
    \let\@mkboth\markboth
    \def\authormark##1{\markboth{##1}{\RightMark}}%
    \def\chaptermark##1{\gdef\RightMark{##1}\markright{##1}}}%
%
\def\foliofont{\fontsize{8}{8}\selectfont}
%      
\def\ps@pblind{%    
    \let\@mkboth\@gobbletwo
    \def\@evenhead{}%
    \def\@oddhead{}
    \def\@oddfoot{\hfill\mbox{\lower7.5pc\hbox{\rhfont\thepage}}\hfill}
   \let\@evenfoot\@oddfoot}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Appendix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand\l@appendix[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{3pt \@plus\p@}%
    \setlength\@tempdima{6em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil\leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%
\newcommand\l@subappendix[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{3pt \@plus\p@}%
    \setlength\@tempdima{3.7em}%
    \begingroup
      \parindent 1.4em \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil\leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%
\newcounter{appendix}[chapter]  %rvs
\renewcommand\theappendix{\Alph{appendix}}
\setcounter{appendix}{0}
\def\@makeappendixhead#1{%
    \vbox to 110pt{%
    \refstepcounter{appendix}
    \vspace*{33pt}
    \parindent\z@\raggedright\reset@font
    {\centering{{\CNfont\appendixname\  \theappendix}\par
    \vskip 0.25in
    \vbox{\CTfont #1}\par}\par}\nobreak
    \vfill\@afterheading\@afterindentfalse}}
%
\def\appendix{\@ifnextchar[{\@bappendix}{\@nappendix}}

\def\@bappendix[#1]{\par%
    \refstepcounter{appendix}
    \ifx#1\empty
    \section*{Appendix~\theappendix}
    \addcontentsline{toc}{section}{Appendix~\theappendix}
    \else
    \section*{Appendix~\theappendix.~~#1}
    \addcontentsline{toc}{section}{Appendix~\theappendix.~#1}
    \fi
    \setcounter{section}{0}
    \setcounter{equation}{0}    
    \setcounter{table}{0}
    \setcounter{figure}{0}
    \renewcommand\thesection{\theappendix.\arabic{section}}%
    \renewcommand\theequation{\theappendix.\arabic{equation}}%
    \renewcommand\thetable{\theappendix.\arabic{table}}%
    \renewcommand\thefigure{\theappendix.\arabic{figure}}%
}
\def\@nappendix{\par%
    \refstepcounter{appendix}
    \setcounter{section}{0}
    \setcounter{equation}{0}    
    \setcounter{table}{0}
    \setcounter{figure}{0}
    \renewcommand\thesection{\theappendix.\arabic{section}}%
    \renewcommand\theequation{\theappendix.\arabic{equation}}%
    \renewcommand\thetable{\theappendix.\arabic{table}}%
    \renewcommand\thefigure{\theappendix.\arabic{figure}}%
}
\def\endappendix{\vspace*{-12pt}}%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Appendix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Index Shortcuts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcounter{ptitl}
\def\aindx#1{\index[aindx]{#1}}    %For Author index
\def\sindx#1{\index[sindx]{#1}}    %For Subject index
\def\gindx#1{\index[general]{#1}}  %For General index
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Index %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{theindex} % 20-04-2015
 {\cleardoublepage
  \raggedright\small
  \setlength{\columnseprule}{0\p@}
  \setlength{\columnsep}{18\p@}
  \markboth{\booktitle}{Index}
  \if@csrhead
     \markboth{Index}{Index}
  \fi
  \if@acrhead
     \markboth{Index}{Index}
  \fi
  \begin{multicols}{2}[\chapter*{\indexname}]
  \thispagestyle{plain}\parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \let\item\@idxitem}
 {\end{multicols}}
\newcommand\@idxitem  {\par\hangindent 1em}
\newcommand\subitem   {\par\hangindent 40\p@ \hspace*{10\p@}}
\newcommand\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}
\newcommand\indexspace{\par\vskip\baselineskip}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Index %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\sitem}{\hspace*{20pt}}
\newcommand{\ssitem}{\hspace*{30pt}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CITATIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@up#1{\raise.2ex\hbox{#1}}
%
\let\@internalcite\cite
\def\cite{\def\@citeseppen{-1000}%
\def\@cite##1##2{\@up[\nobreak\hskip 0in{##1\if@tempswa , ##2\fi}\@up]}%
    \def\citeauthoryear##1##2{##1, ##2}\@internalcite}
\def\shortcite{\def\@citeseppen{1000}%
    \def\@cite##1##2{\@up[{##1\if@tempswa , ##2\fi}\@up]}%
\def\citeauthoryear##1##2{##2}\@internalcite}
%
\def\citeauthor#1{\def\@citeseppen{1000}%
    \def\@cite##1##2{{##1\if@tempswa , ##2\fi}}%
\def\citeauthoryear##1##2{##1}\@citedata{#1}}
    \def\citeyear#1{\def\@citeseppen{1000}%
\def\@cite##1##2{{##1\if@tempswa , ##2\fi}}%
\def\citeauthoryear##1##2{##2}\@citedata{#1}}
%
\def\@citedata#1{\@tempswafalse%
    \if@filesw\immediate\write\@auxout{\string\citation{#1}}\fi
  \def\@citea{}\@cite{\@for\@citeb:=#1\do
    {\@citea\def\@citea{,\penalty\@citeseppen\ }\@ifundefined
       {b@\@citeb}{{\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{}}
\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
 \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{;\penalty\@citeseppen\ }%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \@ifundefined{b@\@citeb}{{\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
     {\csname b@\@citeb\endcsname}}}{#1}}
\def\@biblabel#1{\def\citeauthoryear##1##2{##1, ##2}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CITATIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\eref}[1]{Eq.~(\ref{#1})}
\newcommand{\sref}[1]{Sec.~\ref{#1}}
\newcommand{\cref}[1]{Chap.~\ref{#1}}
\newcommand{\fref}[1]{Fig.~\ref{#1}}
\newcommand{\tref}[1]{Table~\ref{#1}}
\newcommand{\Eref}[1]{Equation (\ref{#1})}
\newcommand{\Sref}[1]{Section~\ref{#1}}
\newcommand{\Cref}[1]{Chapter~\ref{#1}}
\newcommand{\Fref}[1]{Figure~\ref{#1}}
\newcommand{\Tref}[1]{Table~\ref{#1}}
%
%%%%%%%%%%%%%%% BIBLIOGRAPHY TEXT WITHOUT NOS. AT END OF CHAPTER %%%%%%%%%%%%%%
%%
\def\bibfont{\fontsize{9}{11}\selectfont}
%
\def\@biblabel#1{#1.}
\newenvironment{thebibliography}[1]
     {\section*{References}\bibfont%
     \addcontentsline{toc}{section}{References}
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
        \labelsep6pt%.33em
            \advance\leftmargin\labelsep
        \itemsep0pt\parsep0pt
            \usecounter{enumiv}%
            \renewcommand\theenumiv{\arabic{enumiv}}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.=\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\newcommand\newblock{}
%
\def\bib{{B\kern-.05em{I}\kern-.025em{B}\kern-.08em}}
\def\btex{{B\kern-.05em{I}\kern-.025em{B}\kern-.08em\TeX}}
%
%%%%%%%%%%%%%%% BIBLIOGRAPHY TEXT WITHOUT NOS. AT END OF BOOK %%%%%%%%%%%%%%
%
\newenvironment{titlepages}{%
    \thispagestyle{pblind}
    \renewcommand\thepage{\roman{page}}
    \par\ \par
    \vfill
    Half-title page, prepared by publisher\par
    \vfill
    \pagebreak\par
    \thispagestyle{pblind}
    \ \par
    \vfill
    Publishers' page\par
    \vfill
    \pagebreak\par
    \thispagestyle{pblind}
    \ \par
    \vfill
    Full title page, prepared by publisher\par
    \vfill
    \pagebreak\par
    \thispagestyle{pblind}
    \ \par
    \vfill
    Copyright page, prepared by publisher\par
    \vfill
    \pagebreak\par}{}%
%
\newcommand\preface{%
\IfFileExists{preface.tex}
{  \cleardoublepage
   \chapter*{\prefacename}\normalsize
   \markboth{\booktitle}{Preface}
    \if@csrhead
    \markboth{Preface}{Preface}
    \fi
    \if@acrhead
    \markboth{Preface}{Preface}
    \fi
   \input preface.tex
   \par\vfill\pagebreak\par
\typeout{^^Jpreface.tex loaded successfully...}}
{\typeout{^^JWarning: preface.tex could not be found, skipping...^^J}}}
%
\newenvironment{foreword}{%
    \cleardoublepage
    \chapter*{\forewordname}\normalsize
\markboth{\booktitle}{Foreword}
\if@csrhead
\markboth{Foreword}{Foreword}
\fi
\if@acrhead
\markboth{Foreword}{Foreword}
\fi
}{\par\vfill\pagebreak\par}%
%
\newenvironment{acknowledgments}{%
    \cleardoublepage
    \chapter*{\acknowledgmentsname}\normalsize
\markboth{\booktitle}{Acknowledgments}
\if@csrhead
\markboth{Acknowledgments}{Acknowledgments}
\fi
\if@acrhead
\markboth{Acknowledgments}{Acknowledgments}
\fi
}{\par\vfill\pagebreak\par}%
%
\newenvironment{acknowledgment}{%
    \cleardoublepage
    \chapter*{\acknowledgmentname}\normalsize
\markboth{\booktitle}{Acknowledgment}
\if@csrhead
\markboth{Acknowledgment}{Acknowledgment}
\fi
\if@acrhead
\markboth{Acknowledgment}{Acknowledgment}
\fi
}{\par\vfill\pagebreak\par}%
%
\newenvironment{tblofcontents}{%
    \markboth{\booktitle}{Contents}
    \if@csrhead
    \markboth{Contents}{Contents}
    \fi
    \if@acrhead
    \markboth{Contents}{Contents}
    \fi
    \renewcommand\thepage{\roman{page}}
    \tableofcontents}{\par\vfill\pagebreak\par}%
%
\newenvironment{dedication}{%
    \normalsize
    \thispagestyle{pblind}
    \renewcommand\thepage{\roman{page}}
    \ \par
    \vspace*{10pc}\begin{center}}{\end{center}\par\vfill\par}%
%   
% Review Volume Special commands
%
\newcommand\abstractname{Abstract}
\def\abstractfont{\small}
\newenvironment{abstract}{\par%
    \abstractfont
    \noindent\leftskip18pt\rightskip18pt
}{\par}
%
\if@wsmaster
\def\wstoc#1#2{
    \addcontentsline{toc}{chapter}{#1}
    \ifx#2\@empty\else
    \addcontentsline{toc}{author}{\noindent#2}\fi
    }
\else
\def\wstoc#1#2{\relax}
\fi
%
\def\makerobust#1{%
  \@ifundefined{fr@gile\expandafter\@gobble\string#1}%
  {\expandafter
    \let\csname fr@gile\expandafter\@gobble\string#1\endcsname#1%
   \edef#1{\noexpand\protect\expandafter\noexpand
               \csname fr@gile\expandafter\@gobble\string#1\endcsname}}%
  {\@warning{\string#1 is already robust (command ignored)}}}
\makerobust{\footnote}
\makerobust{\footnotemark}
\makerobust{\cite}
\makerobust{\refcite}
\if@wsmaster
    \RequirePackage{chapterbib}
    \RequirePackage{ws-minitoc}
    \dominitoc
    \nomtcrule
    \renewcommand\citepunct{,}
    \let\refcite\citen
\fi
\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
%
\def\tableofcontents{\section*{\contentsname}{\footnotesize\@starttoc{toc}}\vspace*{-1ex}}

\if@wsmaster\def\tableofcontents{\minitoc}\fi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RUNNING HEAD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Even Pg: Book Title, Odd Pg: Chapter Title, *default style*
\if@bcrhead\pagestyle{bcrhead}\fi
%
% Even Pg: Chapter Title, Odd Pg: Section Title
\if@csrhead\pagestyle{csrhead}\fi
%
% Even Pg: Author Name, Odd Pg: Chapter Title
\if@acrhead\pagestyle{acrhead}\fi
%
\newcommand{\blankpage}{
\newpage
\thispagestyle{empty}
\mbox{}
\newpage
}
%
\let\cleardouble@page\cleardoublepage
\AtBeginDocument{%
  \ifx\cleardouble@page\cleardoublepage
    \def\cleardoublepage{\clearpage{\pagestyle{empty}\cleardouble@page}}
  \fi

  \newtoks\projecttitle\projecttitle{\the\title}
  \def\project@title{\the\projecttitle}
}
%
\pagenumbering{arabic}
\def\sloppy{\tolerance=100000\hfuzz=\maxdimen\vfuzz=\maxdimen}
\vbadness=12000
\hbadness=12000
\sloppy
% to draw visible frames for the text
\if@wsdraft
    \RequirePackage{showframe}
    \providecommand{\ShowFrameLinethickness}{0.01pt}
    \renewcommand{\ShowFrameLinethickness}{0.01pt}    
\fi
\RequirePackage[figuresright]{rotating}
\RequirePackage{graphicx}
\RequirePackage{amsfonts,amssymb,amsmath}
\RequirePackage{boxedminipage}
\RequirePackage{makeidx}
\RequirePackage{multicol}
\RequirePackage{ws-crop9x6}
\RequirePackage{url}
\AtBeginDocument{\@ifpackageloaded{hyperref}
{\hypersetup{pdfpagelabels=false,breaklinks,linktocpage}
\RequirePackage{breakurl}
\begingroup
  \@makeother\`%
  \@makeother\=%
  \edef\x{%
    \edef\noexpand\x{%
      \endgroup
      \noexpand\toks@{%
        \catcode 96=\noexpand\the\catcode`\noexpand\`\relax
        \catcode 61=\noexpand\the\catcode`\noexpand\=\relax
      }%
    }%
    \noexpand\x
  }%
\x
\@makeother\`
\@makeother\=
}{}}
\flushbottom
\onecolumn
\endinput
%
%% End of File
%%
%% For Support:  ykoh@wspc.com.sg
%%               rajesh@wspc.com.sg
%%
%% ws-rv9x6.cls, World Scientific Publishing Co.
