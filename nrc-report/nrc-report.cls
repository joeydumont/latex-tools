% --------------------------------------------------------------------------- %
% Author:          Joey Dumont         <joey.dumont@gmail.com>                %
% Date created:    Nov. 05th, 2018                                            %
% Description:     Custom class for long reports.                             %
% License:         Creative Commons CC0                                       %
% --------------------------------------------------------------------------- %

% ----------------------------------------------------------------- %
% --                    Class Identification                     -- %
% ----------------------------------------------------------------- %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nrc-report}[2018/11/05 v0.1 NRC Report class]
\RequirePackage{ifthen}

% ----------------------------------------------------------------- %
% --                   Primary Specifications                    -- %
% ----------------------------------------------------------------- %
% -- Default language is English, but this can be
% -- changed with the francais class option.

\newboolean{NRC@francais}
\setboolean{NRC@francais}{false}
\DeclareOption{francais}
{%
    \setboolean{NRC@francais}{true}
}

\newboolean{NRC@draft}
\setboolean{NRC@draft}{false}
\DeclareOption{draft}
{
  \setboolean{NRC@draft}{true}
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\newboolean{NRC@oneside}
\setboolean{NRC@oneside}{false}
\DeclareOption{oneside}
{%
  \setboolean{NRC@oneside}{true}
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOption{twoside}
{%
  \setboolean{NRC@oneside}{false}
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
\ifthenelse{\boolean{NRC@francais}}
{%
    \RequirePackage[english,francais]{babel}
}%
{%
    \RequirePackage[english]{babel}
}%
\RequirePackage{csquotes}

\RequirePackage{amsthm,amsmath,amssymb}   % Defines mathematics-related environements, symbols and others.
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
%\RequirePackage[bottom]{footmisc}         % Forces footnotes to hug the footer of the page.
\RequirePackage{units}                    % Typesets units in equations.
\RequirePackage{tikz}
\usetikzlibrary{calc}

% ----------------------------------------------------------------- %
% --                       Class Variables                       -- %
% ----------------------------------------------------------------- %
% -- We define multiple variables that are used to generate
% -- title page and such.
\newcommand{\NRC@title}{[Title]}
\newboolean{NRC@hastitle}
\renewcommand*{\title}[1]
{%
      \setboolean{NRC@hastitle}{true}
      \renewcommand*{\NRC@title}{#1}
}%

\newcommand{\NRC@subtitle}{[Subtitle]}
\newboolean{NRC@hassubtitle}
\newcommand*{\subtitle}[1]
{%
      \setboolean{NRC@hassubtitle}{true}
      \renewcommand*{\NRC@subtitle}{#1}
}%

\newcommand{\NRC@author}{[Author]}
\newboolean{NRC@hasauthor}
\renewcommand*{\author}[1]
{%
      \setboolean{NRC@hasauthor}{true}
      \renewcommand*{\NRC@author}{#1}
}%

\newcommand{\NRC@department}{[department]}
\newboolean{NRC@hasdepartment}
\newcommand{\department}[1]
{%
      \setboolean{NRC@hasdepartment}{true}
      \renewcommand*{\NRC@department}{#1}
}%

\newcommand{\NRC@affiliation}{[Affiliation]}
\newboolean{NRC@hasaffiliation}
\newcommand*{\affiliation}[1]
{%
      \setboolean{NRC@hasaffiliation}{true}
      \renewcommand*{\NRC@affiliation}{#1}
}%

\newcommand{\NRC@supervisor}{[Supervisor]}
\newboolean{NRC@hassupervisor}
\newcommand*{\supervisor}[1]
{%
      \setboolean{NRC@hassupervisor}{true}
      \renewcommand*{\NRC@supervisor}{#1}
}%

\newcommand{\NRC@date}{\today}
\newboolean{NRC@hasdate}
\renewcommand{\date}[1]
{%
      \setboolean{NRC@hasdate}{true}
      \renewcommand*{\NRC@date}{#1}
}%

\newcommand{\NRC@logo}{}
\newboolean{NRC@haslogo}
\newcommand*{\logo}[1]
{
      \setboolean{NRC@haslogo}{true}
      \renewcommand*{\NRC@logo}{#1}
}
\newcommand{\NRC@blank}{This page has been intentionally left blank.}
\newboolean{NRC@hasblank}
\newcommand{\blank}[1]
{
  \setboolean{NRC@hasblank}{true}
  \renewcommand{\NRC@blank}{#1}
}

\newcommand{\NRC@version}{}
\newboolean{NRC@hasversion}
\newcommand*{\version}[1]
{
      \setboolean{NRC@hasversion}{true}
      \renewcommand*{\NRC@version}{#1}
}

\newcommand{\NRC@revision}{}
\newboolean{NRC@hasrevision}
\newcommand*{\revision}[1]
{
      \setboolean{NRC@hasrevision}{true}
      \renewcommand*{\NRC@revision}{#1}
}

\newcommand{\NRC@reportversion}{}
\newboolean{NRC@hasreportversion}
\newcommand*{\reportversion}[1]
{
  \setboolean{NRC@hasreportversion}{true}
  \renewcommand*{\NRC@reportversion}{#1}
}

% ----------------------------------------------------------------- %
% --                     Layout Customization                    -- %
% ----------------------------------------------------------------- %
% -- Headers/footers customization
\copypagestyle{nrc_headings}{plain}
\nouppercaseheads
\makeevenhead{nrc_headings}{\textbf{\thepage}\hspace{1cm}{\sffamily\leftmark}}{}{}
\makeoddhead{nrc_headings}{}{}{{\sffamily\rightmark}\hspace{1cm}\textbf{\thepage}}
\makeheadrule{nrc_headings}{\textwidth}{\normalrulethickness}
\makeevenfoot{nrc_headings}{}{}{}
\makeoddfoot{nrc_headings}{}{}{}

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
          {\Huge \NRC@title}\\[0.5\baselineskip]
          \vspace{-1cm}
          \hspace*{-0.1\textwidth}\rule{\textwidth}{2pt}\\[0.1\baselineskip]
          \hspace*{-0.1\textwidth}\rule{\textwidth}{2pt}\\[0.5cm]

          \hspace{0.07\textwidth}
          {\Large \textit{\NRC@subtitle}}\\

          \vfill
          \begin{center}

           \NRC@author

           \vfill

           \ifthenelse{\boolean{NRC@hasdepartment}}
           {\NRC@department}
           {}

           \vfill

           \ifthenelse{\boolean{NRC@haslogo}}
           {\NRC@logo}
           {}

           \vfill

           \ifthenelse{\boolean{NRC@hasaffiliation}}
           {\NRC@affiliation}
           {}



           \vfill

           \ifthenelse{\boolean{NRC@hassupervisor}}{\emph{Supervisor:}\\\NRC@supervisor}{}

           \vfill

           \ifthenelse{\boolean{NRC@hasdate}}{\NRC@date}{}
            \ifthenelse{\boolean{NRC@hasrevision}}{
              \\
              \ifthenelse{\boolean{NRC@francais}}{Derni\`{e}re r\'evision: \NRC@revision}{Last revised: \NRC@revision}
      }


          \end{center}
        }
      \ifthenelse{\boolean{NRC@hasversion}}
      {
        \begin{tikzpicture}[remember picture,overlay]
          \node[anchor=east,xshift=-\oddsidemargin,yshift=\footskip] at (current page.south east) {\NRC@version};
        \end{tikzpicture}
      }
      {}
      }
      \end{OnehalfSpace}
      \end{titlingpage}

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
\NRC@blank
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
