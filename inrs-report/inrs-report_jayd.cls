% --------------------------------------------------------------------------- %
% Author:          Joey Dumont         <joey.dumont@gmail.com>                %
% Date created:    Feb 4th, 2015                                              %
% Date modified:   Mar 30th, 2015                                             %
% Description:     Custom class for long reports.                             %
% License:         Creative Commons CC0                                       %
% --------------------------------------------------------------------------- %

% ----------------------------------------------------------------- %
% --                    Class Identification                     -- %
% ----------------------------------------------------------------- %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{inrs-report_jayd}[2015/02/04 v0.1 INRS Report class]
\RequirePackage{ifthen}

% ----------------------------------------------------------------- %
% --                   Primary Specifications                    -- %
% ----------------------------------------------------------------- %
% -- Default language is English, but this can be
% -- changed with the francais class option.

\newboolean{INRS@francais}
\setboolean{INRS@francais}{false}
\DeclareOption{francais}
{%
    \setboolean{INRS@francais}{true}
}

\newcommand*{\INRS@titlepage}{}
\DeclareOption{DocExam}
{%
    \renewcommand*{\INRS@titlepage}{1}
    \ifthenelse{\boolean{INRS@francais}}
    {
        \newcommand*{\typeofdoc}{Examen de doctorat}
    }
    {
        \newcommand*{\typeofdoc}{Doctoral Exam}
    }
    \PassOptionsToClass{10pt}{memoir}

    %\setlrmarginsandblock{1.25in}{1.25in}{*}
    %\setulmarginsandblock{1in}{1in}{*}
    %\checkandfixthelayout
}

\newboolean{INRS@draft}
\setboolean{INRS@draft}{false}
\DeclareOption{draft}
{
  \setboolean{INRS@draft}{true}
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\newboolean{INRS@oneside}
\setboolean{INRS@oneside}{false}
\DeclareOption{oneside}
{%
  \setboolean{INRS@oneside}{true}
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOption{twoside}
{%
  \setboolean{INRS@oneside}{false}
  \PassOptionsToClass{\CurrentOption}{memoir}
}

% -- Pass other options direclty to memoir class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass{memoir}


% ----------------------------------------------------------------- %
% --                          Packages                           -- %
% ----------------------------------------------------------------- %
% -- Choice of language
\ifthenelse{\boolean{INRS@francais}}
{%
    \RequirePackage[english,francais]{babel}
}%
{%
    \RequirePackage[english]{babel}
}%

\RequirePackage{amsthm,amsmath,amssymb}   % Defines mathematics-related environements, symbols and others.
\RequirePackage{fixltx2e}                 % Fixes some minor annoyancse of LaTeX2e.
\RequirePackage{graphicx}                 % Allows the use of graphics.
\RequirePackage[                          % PDF format config.
      unicode=true,                       % Unicode encoding.
      bookmarks=true,                     % Bookmarks in PDF.
      bookmarksnumbered=true,             % Numberred bookmarks.
      bookmarksopenlevel=3,               % Shows up to subsections when opening PDF.
      pdfborder= {0 0 0},                 % Removes the border around links.
      backref=false,                      % Removes the links from bibliography to main text.
      colorlinks=true,                    % Colouring the links.
      linktoc=page,                       % In ToC, only page numbers are links, not section titles.
      linkcolor=red,                      % Colour of links (section numbers, pages, ...).
      citecolor=blue,                     % Colour of links to bibliography (citations).
      urlcolor=blue]                      % Colour of URLs.
      {hyperref}
\RequirePackage{bookmark}                 % Fixes hyperref's handling of bookmarks.
\RequirePackage[bottom]{footmisc}         % Forces footnotes to hug the footer of the page.
\RequirePackage{units}                    % Typesets units in equations.
\RequirePackage{tikz}
\usetikzlibrary{calc}

% ----------------------------------------------------------------- %
% --                       Class Variables                       -- %
% ----------------------------------------------------------------- %
% -- We define multiple variables that are used to generate
% -- title page and such.
\newcommand{\INRS@title}{[Title]}
\newboolean{INRS@hastitle}
\renewcommand*{\title}[1]
{%
      \setboolean{INRS@hastitle}{true}
      \renewcommand*{\INRS@title}{#1}
}%

\newcommand{\INRS@subtitle}{[Subtitle]}
\newboolean{INRS@hassubtitle}
\newcommand*{\subtitle}[1]
{%
      \setboolean{INRS@hassubtitle}{true}
      \renewcommand*{\INRS@subtitle}{#1}
}%

\newcommand{\INRS@author}{[Author]}
\newboolean{INRS@hasauthor}
\renewcommand*{\author}[1]
{%
      \setboolean{INRS@hasauthor}{true}
      \renewcommand*{\INRS@author}{#1}
}%

\newcommand{\INRS@program}{[Program]}
\newboolean{INRS@hasprogram}
\newcommand{\program}[1]
{%
      \setboolean{INRS@hasprogram}{true}
      \renewcommand*{\INRS@program}{#1}
}%

\newcommand{\INRS@affiliation}{[Affiliation]}
\newboolean{INRS@hasaffiliation}
\newcommand*{\affiliation}[1]
{%
      \setboolean{INRS@hasaffiliation}{true}
      \renewcommand*{\INRS@affiliation}{#1}
}%

\newcommand{\INRS@supervisor}{[Supervisor]}
\newboolean{INRS@hassupervisor}
\newcommand*{\supervisor}[1]
{%
      \setboolean{INRS@hassupervisor}{true}
      \renewcommand*{\INRS@supervisor}{#1}
}%

\newcommand{\INRS@date}{\today}
\newboolean{INRS@hasdate}
\renewcommand{\date}[1]
{%
      \setboolean{INRS@hasdate}{true}
      \renewcommand*{\INRS@date}{#1}
}%

\newcommand{\INRS@logo}{}
\newboolean{INRS@haslogo}
\newcommand*{\logo}[1]
{
      \setboolean{INRS@haslogo}{true}
      \renewcommand*{\INRS@logo}{#1}
}
\newcommand{\INRS@blank}{This page has been intentionally left blank.}
\newboolean{INRS@hasblank}
\newcommand{\blank}[1]
{
  \setboolean{INRS@hasblank}{true}
  \renewcommand{\INRS@blank}{#1}
}

\newcommand{\INRS@version}{}
\newboolean{INRS@hasversion}
\newcommand*{\version}[1]
{
      \setboolean{INRS@hasversion}{true}
      \renewcommand*{\INRS@version}{#1}
}

\newcommand{\INRS@reportversion}{}
\newboolean{INRS@hasreportversion}
\newcommand*{\reportversion}[1]
{
  \setboolean{INRS@hasreportversion}{true}
  \renewcommand*{\INRS@reportversion}{#1}
}

\newcommand{\INRS@jury}{}
\newboolean{INRS@hasjury}
\newcommand*{\jury}[1]
{
  \setboolean{INRS@hasjury}{true}
  \renewcommand*{\INRS@jury}{#1}
}


% ----------------------------------------------------------------- %
% --                     Command Definitions                     -- %
% ----------------------------------------------------------------- %

% -- Textual commands
\renewcommand{\see}{\emph{q.v.}\,}        % Abbreviation of "quod vide", roughly meaning which see. Good replacement for c.f.

% -- Mathematical operators (depends on some AMS package).
\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\Tr}{Tr}


% ----------------------------------------------------------------- %
% --                     Layout Customization                    -- %
% ----------------------------------------------------------------- %
% -- Headers/footers customization
\copypagestyle{inrs_headings}{plain}
\nouppercaseheads
\makeevenhead{inrs_headings}{\textbf{\thepage}\hspace{1cm}{\sffamily\leftmark}}{}{}
\makeoddhead{inrs_headings}{}{}{{\sffamily\rightmark}\hspace{1cm}\textbf{\thepage}}
\makeheadrule{inrs_headings}{\textwidth}{\normalrulethickness}
\makeevenfoot{inrs_headings}{}{}{}
\makeoddfoot{inrs_headings}{}{}{}

% Style for doctoral exam.
\makepagestyle{INRSDocExam}
\makeevenfoot{INRSDocExam}{}{\thepage}{}
\makeoddfoot{INRSDocExam}{}{\thepage}{}

\copypagestyle{INRSDocExamTitle}{plain}
\makerunningwidth{INRSDocExamTitle}{\paperwidth}
\makeoddfoot{INRSDocExamTitle}{}{}{}
\makeevenfoot{INRSDocExamTitle}{}{}{}
%\makeoddfoot{INRSDocExamTitle}{}{\thepage\offset}{}
%\makeevenfoot{INRSDocExamTitle}{}{\thepage\offset}{}

\newcommand{\offset}% center page number in text area
{\ifodd\value{page}\hspace{\dimexpr 2in+2\oddsidemargin+\textwidth-\paperwidth}%
\else\hspace{\dimexpr 2in+2\evensidemargin+\textwidth-\paperwidth}%
\fi}

% -- Default title page.
\newcommand*{\printtitle}
{%
  \newlength{\centeradjust}
  \calccentering{\centeradjust}                       % Calculate center length and stores in unitlength
  \begin{adjustwidth*}{\centeradjust}{-\centeradjust}   % Adjust center
  \begin{adjustwidth}{-1cm}{-1cm}                   % Extra lage front page

      \ifx\INRS@titlepage\empty
      \begin{titlingpage}
      \begin{OnehalfSpace}

      \hbox
      {
        %\hspace*{0.05\textwidth}
        \rule{2pt}{\textheight}
        \hspace*{0.01\textwidth}
        \rule{2pt}{\textheight}
        \hspace{0.01\textwidth}

        \parbox[b][0.9\textheight]{\textwidth}
        {
          {\Huge \INRS@title}\\[0.5\baselineskip]
          \vspace{-1cm}
          \hspace*{-0.1\textwidth}\rule{\textwidth}{2pt}\\[0.1\baselineskip]
          \hspace*{-0.1\textwidth}\rule{\textwidth}{2pt}\\[0.5cm]

          \hspace{0.07\textwidth}
          {\Large \textit{\INRS@subtitle}}\\

          \vfill
          \begin{center}

           \INRS@author\\
           \INRS@program

           \vfill

           \INRS@affiliation

           \vfill

           \ifthenelse{\boolean{INRS@haslogo}}
           {\INRS@logo}
           {}

           \vfill

           \ifthenelse{\boolean{INRS@hassupervisor}}{\emph{Supervisor:}\\\INRS@supervisor}{}

           \vfill

           \ifthenelse{\boolean{INRS@hasdate}}{\INRS@date}{}


          \end{center}
        }
      \ifthenelse{\boolean{INRS@hasversion}}
      {
        \begin{tikzpicture}[remember picture,overlay]
          \node[anchor=east,xshift=-\oddsidemargin,yshift=\footskip] at (current page.south east) {\INRS@version};
        \end{tikzpicture}
      }
      {}
      }
      \end{OnehalfSpace}
      \end{titlingpage}


      \else \ifnum\INRS@titlepage=1
      \ifthenelse{\boolean{INRS@hasreportversion}}
      {\vspace{-3cm}\begin{flushright}
      {\footnotesize
        \INRS@reportversion
      }
      \end{flushright}}
      {}
      {\fontspec{Source Sans Pro}\selectfont
      \thispagestyle{INRSDocExamTitle}
      \begin{center}
      \begin{OnehalfSpace}
      %\vspace*{2\baselineskip}
        {\Large \textbf{\INRS@title}}

        \vfill

        {\large Document pour l'examen doctoral de \\
        \INRS@author

        \vfill

        Membres du Jury\\[1.25\baselineskip]
        \INRS@jury

        %\vspace*{3\baselineskip}
        }
      \end{OnehalfSpace}
      \end{center}

      \ifthenelse{\boolean{INRS@hasversion}}
      {
        \begin{tikzpicture}[remember picture,overlay]
          \node[anchor=east,xshift=-0.5\oddsidemargin,yshift=\footskip] at (current page.south east) {\INRS@version};
        \end{tikzpicture}
      }
      {}
      }
      \ifthenelse{\boolean{INRS@oneside}}
      {\clearpage}
      {\cleardoublepage}
        \fi
      \fi
  \end{adjustwidth}
  \end{adjustwidth*}
}

% -- Print blank indication on blank pages.
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\calccentering{\unitlength}                       % Calculate center length and stores in unitlength
\begin{adjustwidth*}{\unitlength}{-\unitlength}   % Adjust center
\begin{adjustwidth}{-1cm}{-1cm}                   % Extra lage front page
\begin{center}
\INRS@blank
\end{center}
\end{adjustwidth}
\end{adjustwidth*}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% -- Allow equation to span multiple pages
\allowdisplaybreaks
