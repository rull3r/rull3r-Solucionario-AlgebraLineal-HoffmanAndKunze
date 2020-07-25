%=====================================================================
% jhwhw.cls
% Provide jhwhw.cls class
%=====================================================================

%=====================================================================
% Identification
%=====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jhwhw}[2009/02/11 Justin Wilson's Homework Class]

\LoadClass[letterpaper, 11pt]{report}
%\RequirePackage{jhwmath} Personal style file I use.

\RequirePackage{fancyhdr}
\RequirePackage[top=1in,bottom=1in,left=0.4in,right=0.4in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{empheq}
\RequirePackage{ifthen}
%\RequirePackage{jhwgraphics} Another personal style file I use.


%=====================================================================
% Commands
%=====================================================================

\setlength{\headheight}{30pt}
\lhead{\@author}\chead{\@title}\rhead{\@date}
\lfoot{}\cfoot{\thepage}\rfoot{}
\pagestyle{fancy}

\ifx\pdfoutput\undefined                         %LaTeX
\RequirePackage[ps2pdf,bookmarks=true]{hyperref}
\hypersetup{ %
	pdfauthor   = {\@author},
	pdftitle    = {\@title},
	pdfcreator  = {LaTeX with hyperref package},
	pdfproducer = {dvips + ps2pdf},
	pdfborder={0 0 0}
}
\else                                            %PDFLaTeX
\RequirePackage[pdftex,bookmarks=true]{hyperref}
\hypersetup{ %
	pdfauthor   = {\@author},
	pdftitle    = {\@title},
	pdfcreator  = {LaTeX with hyperref package},
	pdfproducer = {dvips + ps2pdf},
	pdfborder={0 0 0}
}
\pdfadjustspacing=1
\fi
\newcommand*{\QEPD}{\hfill\ensuremath{\blacksquare}}%

% Set up counters for problems and subsections

\newcounter{ProblemaNum}
\newcounter{SubProblemaNum}[ProblemaNum]

\renewcommand{\theProblemaNum}{\arabic{ProblemaNum}}
\renewcommand{\theSubProblemaNum}{\alph{SubProblemaNum}}


\newcommand*{\anyproblema}[1]{\newpage\subsection*{#1}}
\newcommand*{\problema}[1]{\stepcounter{ProblemaNum} %
	\anyproblema{Problema \theProblemaNum. \; #1}}
\newcommand*{\soln}[1]{\subsubsection*{#1}}
\newcommand*{\solution}{\soln{Solucion}}
\renewcommand*{\part}{\stepcounter{SubProblemaNum} %
	\soln{Parte (\theSubProblemaNum)}}

\renewcommand{\theenumi}{(\alph{enumi})}
\renewcommand{\labelenumi}{\theenumi}
\renewcommand{\theenumii}{\roman{enumii}}

% \def\problemmark{}

% % Typesetting problems

% % \newcommand*{\prob}[1]{\newpage \noindent \textbf{\Large #1}}
% % \newcommand*{\problem}[1]{\stepcounter{ProblemNum} \prob{Problem %
% % \theProblemNum.}}
% % \newcommand*{\soln}[1]{\\ \noindent \textbf{\Large #1}}
% % \newcommand*{\solution}{\soln{Solution}}
% % \renewcommand*{\part}{\\ \noindent \stepcounter{SubProblemNum} %
% % \textbf{\Large Part (\theSubProblemNum)}}

% \newcommand\problem{\@startsection{problem}{1}{\z@}%
%                      {-3.25ex \@plus -1ex \@minus -.2ex}%
%                      {1.5ex \@plus .2ex}%
%                      {\normalfont\large\bfseries}}