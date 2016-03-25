\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seneca_final}[2016/03/20 Provides a class for a Seneca Final template]

\LoadClass[letterpaper,12pt]{article}
\RequirePackage{fancyhdr}
\textwidth=502pt \oddsidemargin=-16pt \textheight=661pt \topmargin = -38pt
\RequirePackage{calc}

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


\RequirePackage{lastpage}
%this command allow us to get the number of pages minus 1
\RequirePackage{refcount}
\newcommand*{\thesecondlastpage}{%
  \the\numexpr(\getrefbykeydefault{LastPage}{page}{0})-1\relax
}
\AtBeginDocument{\refused{LastPage}}


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


%these commands will make section, subsection, and subsubsections to have the desired format
\usepackage{titlesec}
\titleformat{\section}{\normalfont}{\thesection}{0.5em}{}
\renewcommand{\thesection}{\textbf{PART \Alph{section}}}

\titleformat{\subsection}{\normalfont}{\thesubsection}{0.5em}{}
\renewcommand{\thesubsection}{\arabic{subsection}.}

\titleformat{\subsubsection}{\normalfont \leftskip 14pt}{\thesubsubsection}{1em}{}
\renewcommand{\thesubsubsection}{\alph{subsubsection})}

\newcommand{\Part}[1] {
   \section{\MakeUppercase{\textbf{#1}}}
}

\newcommand{\Question}[1] {
   \subsection{#1}
}

\newcommand{\Subquestion}[1] {
   \subsubsection{#1}
}

\usepackage{enumitem}% http://ctan.org/pkg/titlesec
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
\newenvironment{match_a}
{
   \begin{enumerate}[label=\alph*)]
}
{
   \end{enumerate}
}
\newenvironment{match_b}
{
   \begin{itemize}[leftmargin=1.7cm]
   \renewcommand\labelitemi{\underline{\hspace{1cm}}}
}
{
   \end{itemize}
}

\usepackage{forloop}
\newcounter{loop}
\newcommand{\Lines}[2] {
   \vspace{0.5cm}
   \forloop{loop}{0}{\value{loop}<#1}{\hrule \vspace{#2}}
}
