% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Author:			Joey Dumont			%%%
% -- Date created:		May 24th, 2012			%%%
% -- Description:		LaTeX class that loads my most	%%%
% -- 				used packages and defines the	%%%
% -- 				document style and a title page.%%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Class identification		%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classJD}[2012/05/24 Customized report class]

% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Primary class specification	%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[twoside,openright,titlepage]{report}

% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Packages to be used.		%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}			% Permet de taper les accents sans avoir à les échapper
\RequirePackage{geometry}			% Facilite la manipulation de la géoméetrie
\geometry{	verbose,
			tmargin=1in,
			bmargin=1in,
			lmargin=1.25in,
			rmargin=1.75in,
			headsep=0.25in}

\RequirePackage{graphicx}			% Pour les images (assez standard)
\RequirePackage{fancyhdr} 			% Permet de modifier l'entête

\RequirePackage{amsthm,amsmath,amssymb} 	% Symboles mathématiques et autre
	\theoremstyle{remark}
	\newtheorem{nt}{Note}
\RequirePackage{setspace}			% Modifie l'espacement entre les lignes
	\onehalfspacing

\RequirePackage[bitstream-charter]{mathdesign}	% Police utilisée dans le document
\RequirePackage[T1]{fontenc}			% Police vectorielle

\RequirePackage[unicode=true,
			pdfusetitle,
 			bookmarks=true,
 			bookmarksnumbered=true,
 			bookmarksopen=true,
 			bookmarksopenlevel=3,
 			breaklinks=false,
 			pdfborder={0 0 0},
 			backref=false,
 			colorlinks=true,
 			linkcolor=black,
 			citecolor=black,
 			urlcolor=blue]
 {hyperref}					% Définit la mise en page du document PDF

\RequirePackage{multicol}			% Utilisaiton de plusieurs colonnes dans le docuemnt
\RequirePackage{minitoc}			% Permet d'afficher une mini table des matières au début des chapitres
\RequirePackage[bottom]{footmisc}		% Force les notes de bas de page à être en bas de la page
\RequirePackage{units}				% Typographie des unités dans les équations
\RequirePackage{subfig}				% Permet d'utiliser des sous-figures (1.a, 1.b...) 
\RequirePackage[table]{xcolor}

% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Command definitions		%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -- New custom commands
\newcommand{\see}{\emph {q.v.}\,}		% Abbréviation de "quod videre", qui réfère à une autre paragraphe.
\newcommand{\bang}{\begin{flushright}\textsc{Q.E.D}\end{flushright}}

% -- Commands for titlepage
\newcommand\subtitle[1]{\renewcommand\@subtitle{#1}}
\newcommand\@subtitle{\ClassError{No \noexpand\subtitle given}\@ehc}

\newcommand\course[1]{\renewcommand\@course{#1}}
\newcommand\@course{\ClassError{No \noexpand\course given}\@ehc}

\newcommand\coursenumber[1]{\renewcommand\@coursenumber{#1}}
\newcommand\@coursenumber{\ClassError{No \noexpand\coursenumber given}\@ehc}

\newcommand\professor[1]{\renewcommand\@professor{#1}}
\newcommand\@professor{\ClassError{No \noexpand\professor given}\@ehc}

\newcommand\affiliation[1]{\renewcommand\@affiliation{#1}}
\newcommand\@affiliation{\ClassError{No \noexpand\affiliationgiven}\@ehc}

\newcommand\dueDate[1]{\renewcommand\@dueDate{#1}}
\newcommand\@dueDate{\ClassError{No \noexpand\dueDate given}\@ehc}

\newcommand\blank[1]{\renewcommand\@blank{#1}}
\newcommand\@blank{\ClassError{No \noexpand\blank given}\@ehc}


% -- Commands for styles used in document
\newcommand{\frontmatter}%
{%
	% Numérotation des pages subséquentes (résumé, tables,...)
	\pagenumbering{roman}				% Chiffres romains minuscules
	\setcounter{page}{1}				% Page 1
	\fancyfoot[CO,CE]{\thepage}			% Mets le numéro de page au centre du bas de page
	\pagestyle{fancy}				% Plus de configuration possible avec fancy
	\fancyhead{}					% Rien dans l'entête (pour l'instant)
	\renewcommand{\headrulewidth}{0pt}		% Enlève la ligne sous l'entête
}%

\newcommand{\mainmatter}%
{%
	\clearpage
	\newpage
	
	% Style pour le reste du document (le corps du texte, essentiellement)
	\pagestyle{fancy} 				% Pour la configuration
	\fancyhf{} 					% Enlève les configurations précédentes

	% Permet d'afficher la section dans l'entête
	%\renewcommand{\sectionmark}[1]{\markright{\emph{#1}}{}}

	\renewcommand{\footrulewidth}{0.5pt} 		% Ligne au-dessus du bas de page
	\renewcommand{\headrulewidth}{0.5pt} 		% Ligne au-dessous de l'en-tête

	% Affiche le titre et nos noms dans l'en-tête
	\fancyhead[LE]{\emph{\@title}} 

	% Imprime le numéro de page (X de Y) dans le centre du bas de page
	\fancyfoot[CE,CO]{\thepage\space\space de \space \pageref{LastPage}}

	% Ces commandes modifient le style des équations, des figures,... etc.
	\pagenumbering{arabic}
	\setcounter{page}{0}
	\renewcommand{\chaptername}{Section}	
	\setcounter{chapter}{0}
}%

\newcommand{\backmatter}%
{%
	\clearpage
	\newpage
	
}%

% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Layout customization 		%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -- We define a command that displays a title page with the
% -- user provided information.

\renewcommand{\maketitle}
{%
	\begin{titlepage}
	\begin{onehalfspacing}
	\begin{center}

	% Définit le titre et le sous-titre, avec une barre au-dessous
	\textsc{\Large \@title}\\
	\textsc{\large \@subtitle}\\[0.25cm]
	\hrule
	\mbox{}\vfill

	% The following was useful for team work. Gives student names along side ID.
	\@author

	\vfill

	% Informations sur le cours
	\@course\\
	\@coursenumber\vfill
	\@professor\vfill

	% Département et citation
	\@affiliation
	
	\vfill
	\emph{Ipsa scientia potestas est}\\

	\begin{flushright}
	\textsc{ --- Sir Francis Bacon}
	\end{flushright}

	\vfill

	% Date
	\@dueDate

	% Conclue la page titre 
	\end{center}
	\end{onehalfspacing}
	\end{titlepage}

	% Ajoute une page blanche (pour l'impression recto-verso).
	\if@twocolumn
		\twocolumn
		[
		\begin{titlepage}
		\mbox{}\vfill
		\begin{center}
		\@blank
		\end{center}
		\mbox{}\vfill
		\end{titlepage}
		]
	\else
		\begin{titlepage}
		\mbox{}\vfill
		\begin{center}
		\@blank
		\end{center}
		\mbox{}\vfill
		\end{titlepage}
	\fi

	\global\let\subtitle\relax
	\global\let\@subtitle\@empty
}%

\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\begin{center}
\@blank
\end{center}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother
\allowdisplaybreaks					% Allows equations to span multiple lines


% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Random other stuff			%%
% -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -- Mathematical operators
\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\Tr}{Tr}