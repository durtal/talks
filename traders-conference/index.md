---
title       : Intro to R
subtitle    : Programming for Punters
author      : Tom Heslop
job         : Data Analyst, Timeform
framework   : revealjs
revealjs    : {theme: night, transition: concave, center: "false"}
highlighter : highlight.js
hitheme     : tomorrow
widgets     : [bootstrap]
mode        : selfcontained
knit        : slidify::knit2slides
---

# Introduction to R
## Programming for Punters

<br>
<hr>
<br>


<h4 class="name">Tom Heslop</h4>
<h4 class="name"><a href="https://twitter.com/UTVilla">@UTVilla</a></h4>

<br>
<hr>
<br>

<ul class="slide-list">
    <li>slides <a href="http://bit.ly/1Jqzl3E">http://bit.ly/1Jqzl3E</a></li>
    <li>src <a href="http://bit.ly/1NQF8ET">http://bit.ly/1NQF8ET</a></li>
</ul>

---

## Subjects To Cover

<br>

<h4 class="fragment name">Introduce <a href="https://cran.r-project.org/">R</a></h4>

<h4 class="fragment name">Introduce <a href="https://git-scm.com/">Git</a></h4>

<h4 class="fragment name">Using R and Git to manage projects</h4>

<h4 class="fragment name">Existing R packages for exploring data</h4>

<h4 class="fragment name">Build your own packages</h4>

<ul class="fragment">
    <li>test</li>
    <li>test 2</li>
</ul>

---

## Background

Jan 2013, an Excel user*

<img src="assets/img/chain-smoking.jpg">

<small class="footnote">*abuser</small>

--- &vertical

# What is R?

<h3 class="fragment"><a href="https://www.r-project.org/">R is a free software environment for statistical computing and graphics</a></h3>

***

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">The only way to write good code is to write tons of shitty code first. Feeling shame about bad code stops you from getting to good code</p>&mdash; Hadley Wickham (@hadleywickham) <a href="https://twitter.com/hadleywickham/status/589068687669243905">April 17, 2015</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

***

## Learn R

* [Coursera courses run by Johns Hopkins](https://www.coursera.org/specialization/jhudatascience/1?utm_medium=courseDescripTop)
    - [R Programming](https://www.coursera.org/course/rprog)
    - [Data Science Toolbox](https://www.coursera.org/course/datascitoolbox)
    - includes introduction to git/github
* [Statistical Learning by Stanford](https://class.stanford.edu/courses/HumanitiesScience/StatLearning/Winter2014/about)
    - accompanied by free book ([Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/))
* [Stat545 by University of British Columbia](http://stat545-ubc.github.io/index.html)
    - course notes for Data Wrangling, Exploration and Analysis with R
    - includes introduction to git/github
* start writing code
* write more code

--- &vertical

# What is Git?

.fragment [_Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency_](https://git-scm.com/)

.fragment

***

Git allows programmers to track changes they make to their code, these changes could include

* bug fixes
* additional features
* or small improvements (as shown below)

![](assets/img/git-diff-example.jpg)

---
