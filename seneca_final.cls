\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seneca_final}[2016/03/20 Provides a class for a Seneca Final template]

\LoadClass[12pt]{article}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage} %allows use of \pageref{LastPage}

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
