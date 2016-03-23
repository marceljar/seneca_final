\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seneca_final}[2016/03/20 Provides a class for a Seneca Final template]

\LoadClass[letterpaper,12pt]{article}
\RequirePackage{fancyhdr}
\textwidth=480pt \oddsidemargin=-13pt \textheight=632pt \topmargin = -20pt

\RequirePackage{lastpage} %allows use of \pageref{LastPage}
\RequirePackage{mathptmx} %switch font-family to Times New Roman

%these commands will
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

\usepackage{titlesec}% http://ctan.org/pkg/titlesec
% \titleformat{\section}%
%   [hang]% <shape>
%   {\normalfont\bfseries\Large}% <format>
%   {}% <label>
%   {0pt}% <sep>
%   {}% <before code>
\titleformat{\section}
  {\normalfont}{\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}
  {\normalfont \leftskip 14pt}{\thesubsubsection}{1em}{}
\renewcommand{\thesection}{PART \Alph{section}}% Remove section references...
\renewcommand{\thesubsection}{\arabic{subsection}.}%... from subsections
\renewcommand{\thesubsubsection}{\alph{subsubsection})}%... from subsubsections

\newcommand{\Part}[1] {
   \section{#1}
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
   }
   {
      \end{enumerate}
   }

\newenvironment{true_false}
   {
      \begin{itemize}[leftmargin=2.0cm]
      \renewcommand\labelitemi{T \phantom{...} F \phantom{..}}
   }
   {
      \end{itemize}
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
\newcommand{\Lines}[2] {
   \newcounter{loop}
   \forloop{loop}{0}{\value{loop}<#1}{\hrule \vspace{#2}}
}
