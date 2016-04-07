\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seneca_final}[2016/04/05 Provides a class for a Seneca Final template]

\LoadClass[letterpaper,12pt]{article}
\RequirePackage{fancyhdr}%allows us to create fancy headers, footers, and resize pages
\textwidth=502pt \oddsidemargin=-16pt \textheight=661pt \topmargin = -38pt
\RequirePackage{calc} %this package allow us to use newcounter and setcounter
\RequirePackage{mathptmx} %switch font-family to Times New Roman

%these commands will create the proper header and footers
\pagestyle{fancy}
\fancyhf{}
\newcommand{\CourseTerm}[2]
{
   \lhead{{#1}, {#2}}
}
\rhead{Page \thepage\ of \pageref{LastPage}}
\newcommand{\CollegeDept}[2]
{
   \lfoot{{#1}}
   \rfoot{{#2}}
}
\renewcommand{\footrulewidth}{0.4pt}
%-----------------------------------------------------


%this code excerpt allows us to get the number of pages minus 1
\RequirePackage{lastpage}
\RequirePackage{refcount}
\newcommand*{\thesecondlastpage}{%
  \the\numexpr(\getrefbykeydefault{LastPage}{page}{0})-1\relax
}
\AtBeginDocument{\refused{LastPage}}



%these commands are used to create the title page -------------------------

%adds top items in the title page, takes as an optional argument the version
%of the exam (Version  A, Version B, etc.)
\RequirePackage{xparse}
\DeclareDocumentCommand{\AddTitle}{g} {
   \thispagestyle{empty}
   \begin{center}
   \noindent
   \MakeUppercase{\textbf{Seneca College of Arts and Technology}}
   \vspace{0.5cm}

   \noindent
   \MakeUppercase{\textbf{School of Information and Communication Technology - SY}}
   \vspace{0.5cm}

   \noindent
   \IfNoValueTF {#1}{\MakeUppercase{\textbf{Final Examination}}} {\MakeUppercase{\textbf{Final Examination - #1}}}
   \vspace{0.5cm}
   \end{center}
}

%adds information about the exam
\usepackage{array}
\newcolumntype{R}{>{\raggedleft\arraybackslash}b{4.5cm}}
\newcommand{\AddCourseInfo}[3] {
   \begin{tabular}{ p{4.0cm} p{7.9cm} R }
    \MakeUppercase{SEMESTER} & \MakeUppercase{SUBJECT NAME}  & \MakeUppercase{SUBJECT CODE} \\ \hline
     & & \\
     {#1} & {#2} & {#3} \\ \hline
   \end{tabular}
   \vspace{0.5cm}
}

%adds information fields to be filled by students
\newcommand{\AddStudentInfo} {
   \begin{center}
   \MakeUppercase{name:}\underline{\hspace{8.5cm}} \\
   \vspace{0.25cm}
   \MakeUppercase{student number:}\underline{\hspace{6cm}}\\
   \vspace{0.25cm}
   \MakeUppercase{section:}\underline{\hspace{8.0cm}}
   \vspace{0.5cm}
   \end{center}
}

%adds info about number of parts, weight of each part, allowed time
%all info is passed as a sequence of arguments and the command takes up to
%three parts. It adds blank lines in case less than three parts are present
\DeclareDocumentCommand{\AddTestInfo}{g g g g g g g g} {
   \newcounter{total}
   \newcounter{parta}
   \newcounter{partb}
   \newcounter{partc}
   \newcounter{partd}
   \begin{tabular}{ p{3.5cm} p{7.0cm} p{0.5cm} p{1.5cm}}
   \MakeUppercase{date:} & {#1}  & & \\
     & & & \\
   \MakeUppercase{time allowed:} & 2 hours& & \\
     & & & \\
   \MakeUppercase{questions:} & & & \\
   \IfNoValueTF {#3} {\setcounter{parta}{0}}{ \setcounter{parta}{#4} \MakeUppercase{Part A} & \MakeUppercase{#3} & \MakeUppercase{#4} & \MakeUppercase{marks} \\}
   \IfNoValueTF {#5} {\setcounter{partb}{0}} {\setcounter{partb}{#6} \MakeUppercase{Part B} & \MakeUppercase{#5} & \MakeUppercase{#6} & \MakeUppercase{marks} \\}
   \IfNoValueTF {#7} {\setcounter{partc}{0}} {\setcounter{partc}{#8} \MakeUppercase{Part C} & \MakeUppercase{#7} & \MakeUppercase{#8} & \MakeUppercase{marks} \\}
   \MakeUppercase{} & & & \\
   & \MakeUppercase{total marks:} & \setcounter{total}{\theparta+\thepartb+\thepartc+\thepartd} \thetotal &\\
   \MakeUppercase{} & & & \\
   \MakeUppercase{Professor(s):} & #2 & & \\
   \IfNoValueT {#3} {\\}
   \IfNoValueT {#5} {\\}
   \IfNoValueT {#7} {\\}
   & & & \\
   \end{tabular}
   \newline
}

%adds special instructions to the title page
\newenvironment{SpecialInstructions}
{
   \noindent
   \textbf{\underline{\MakeUppercase{special instructions:}}}
   \begin{enumerate}[leftmargin=*]
}
{
   \end{enumerate}
   \noindent
   This exam includes a cover page, plus \thesecondlastpage  \phantom{ } pages of questions.
   \vspace{0.15cm}
   \hrule

   \vspace{0.5cm}
   \noindent
   \MakeUppercase{Seneca's academic honesty policy:}

   \noindent
   As a Seneca student, you must conduct yourself in an honest and trustworthy manner in all aspects of your academic career. A dishonest attempt to obtain an academic advantage is considered an offense, and will not be tolerated by the College.

   \vspace{0.5cm}
   \noindent
   \MakeUppercase{Approved by:}

   \noindent
   Mary Lynn Manton, Chair, School of ICT

   \newpage
}
% end of title page commands ------------------------------------------------



%these commands will make section, subsection, and subsubsections to have the desired format

\usepackage{titlesec}
\titleformat{\section}{\normalfont}{\thesection}{0.5em}{}
\renewcommand{\thesection}{\textbf{PART \Alph{section}}}
\newcommand{\Part}[1] {\section{\MakeUppercase{\textbf{#1}}}}

\titleformat{\subsection}{\normalfont}{\thesubsection}{0.5em}{}
\renewcommand{\thesubsection}{\arabic{subsection}.}

\usepackage{xifthen} % allows use of \ifthenelse for optional arguments
\newcommand{\Question}[2][]{
   \ifthenelse{\equal{#1}{}}{\subsection{#2}}{\subsection{#2 \textbf{[#1 marks]}}}
}
\titleformat{\subsubsection}{\normalfont \leftskip 14pt}{\thesubsubsection}{1em}{}
\renewcommand{\thesubsubsection}{\alph{subsubsection})}
\newcommand{\Subquestion}[2][]{
   \ifthenelse{\equal{#1}{}}{\subsubsection{#2}}{\subsubsection{#2 \textbf{[#1~marks]}}}
}
% end of section, subsection, and subsubsection commands ----------------------


%these commands create different question types ------------------------------

\usepackage{enumitem}%adds more flexibility to enumeration environments
\newenvironment{multiple_choice}
{
   \begin{enumerate}[label=\alph*)]
   \setlength\itemsep{0.1em}
}
{
   \end{enumerate}
}

\newenvironment{true_false}
{
   \begin{itemize}[leftmargin=2.05cm]
   \setlength\itemsep{0.1em}
   \renewcommand\labelitemi{\textbf{T} \phantom{...} \textbf{F} \phantom{..}}
}
{
   \end{itemize}
}

\usepackage{array,etoolbox}
\preto\tabular{\setcounter{magicrownumbers}{0}}
\newcounter{magicrownumbers}
\newenvironment{match_columns}
{
   \newcommand\rownumber{\stepcounter{magicrownumbers}\alph{magicrownumbers}}
   \def\arraystretch{1.5}
   \begin{tabular}{@{\makebox[1.7em][r]{\rownumber})\space\space\space\space}  p{0.4\textwidth} @{\underline{\hspace{1cm}}\space\space\space\space} p{0.4\textwidth}}
}
{
   \end{tabular}
}
% end of question types commands --------------------------------------------


%command to add lines so that students can write on the exam
\usepackage{forloop}
\newcounter{loop}
\newcommand{\Lines}[2] {
   \vspace{0.5cm}
   \forloop{loop}{0}{\value{loop}<#1}{\hrule \vspace{#2}}
}

%these commands control how source code listings look like
\RequirePackage{listings}
\usepackage{color}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{mystyle}{
   backgroundcolor=\color{backcolour},
   %commentstyle=\color{codegreen},
   %keywordstyle=\color{magenta},
   %stringstyle=\color{codepurple},
   numberstyle=\footnotesize\color{codegray},
   basicstyle=\footnotesize,
   breakatwhitespace=false,
   breaklines=true,
   captionpos=b,
   keepspaces=true,
   numbers=left,
   numbersep=5pt,
   showspaces=false,
   showstringspaces=false,
   showtabs=false,
   tabsize=2
}

\lstnewenvironment{source_code}[1][C++]
{\hfill\lstset{style=mystyle, language=#1}\minipage{0.9\textwidth}}
{\endminipage\hfill\null}
