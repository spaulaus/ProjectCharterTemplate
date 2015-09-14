\def\filename{charter.cls}
\def\fileversion{v. 0.1.0}
\def\filedate{September 14, 2015}
\def\contributors{S. V. Paulauskas}

\typeout{\filename}
\typeout{\fileversion}
\typeout{Created by S. V. Paulauskas}
\typeout{\filedate}
\typeout{A class to handle formatting and definition of a project charter.}

\ProvidesClass{charter}
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{color}}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ExecuteOptions{12pt}% execute default options
\ProcessOptions%
\LoadClass{article}

\def\@title{My Title}

%---------- LOAD PACKAGES ----------
\usepackage{amsmath,amsthm,amssymb}
\usepackage{color}
\usepackage[top=1in,bottom=1in,left=1in,right=1in,vcentering]{geometry}
\usepackage{float}
\usepackage{relsize} 
\usepackage{url}
\usepackage[plainpages=false,breaklinks=true,pdfpagelabels=true,pagebackref]{hyperref}

\hypersetup{
  bookmarksnumbered = true, 
  pdftitle={\@title}, 
  pdfauthor={\@author},
  pdfpagelayout=OneColumn,
  bookmarksopen=False,
  pdfborder=0 0 0,        % make all links invisible, so the pdf looks good when printed
  pdffitwindow=true,      % window fit to page when opened
  pdfcreator={\@author},  % creator of the document
  pdfnewwindow=true,      % links in new window
  colorlinks=true,        % false: boxed links; true: colored links
  linkcolor=blue,         % color of internal links
  citecolor=blue,         % color of links to bibliography
  filecolor=magenta,      % color of file links
  urlcolor=magenta,       % color of external links
  unicode = true
}

%---------- SET HYPHENATION ---------
\hyphenpenalty=5000	% reduce hyphenation as much as possible
\tolerance=1000     % goes with the previous command

%---------- Widow/orphan protection ----------
\clubpenalty=10000    % Minimize orphans orphans(eliminate 10000)
\widowpenalty=10000   % Minimize widows
\brokenpenalty=10000  % Do not allow hyphen across pages
% Use cool footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\raggedbottom

%---------- MACRO FOR SETTING UP THE TITLE PAGE ----------
\newcommand {\settitle}[2] {
  \title{
    \centering
    \rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt} 
    \rule{\textwidth}{0.4pt}\\[0.5\baselineskip] 
    \Huge \bfseries {#1} \\[0.5\baselineskip] \huge {#2}
    \rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}
    \rule{\textwidth}{0.4pt}
  }
}

%---------- MACRO TO SET THE Company ---------
\newcommand {\setauthor}[2] {
  \author{\Large Prepared by : {#1} \\[0.5\baselineskip] \Large {#2} \\[1.5\baselineskip]}
}

%---------- MACRO TO SET THE STARTING DATE ---------
\newcommand {\setstartdate} {
  \date{\today}
}

%---------- MACRO TO INSERT SIGNATURE AREA ---------
\newcommand {\approvalsignature}[2] {
	\section*{Authorization}
	\label{sec:authorization}
	\noindent
	Approved By 
	
	\vspace{0.75cm}
	\noindent
	\begin{tabular}[l]{lcl}
    \rule{7cm}{1pt} & & Date:\rule{3cm}{1pt}\\
	#1 & &\\
	#2 & & 
	\end{tabular}
	\vspace{1cm}
}

%---------- MACRO FOR ADDING TO THE TOC ----------
\newcommand {\addToTOC}[1] {
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{part}{#1}
}
%---------- MACRO FOR ADDING TO PDF BOOKMARKS ---------
\newcommand {\addToPDFBookmarks}[3] {
  \cleardoublepage
  \phantomsection
  \pdfbookmark[#1]{#2}{#3}
}
