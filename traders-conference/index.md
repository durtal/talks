---
title       : Introduction to R
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


<h3 class="name">Tom Heslop</h3>
<h3 class="name"><a href="https://twitter.com/UTVilla">@UTVilla</a></h3>

<br>
<hr>
<br>

<ul class="slide-list">
    <li>slides <a href="http://bit.ly/1UNtCQ3">http://bit.ly/1UNtCQ3</a></li>
    <li>source <a href="http://bit.ly/1O9fAE2">http://bit.ly/1O9fAE2</a></li>
</ul>

---

## Subjects To Cover

<br>

<h3 class="fragment name">Introduce <a href="https://cran.r-project.org/">R</a></h3>

<h3 class="fragment name">Introduce <a href="https://git-scm.com/">Git</a></h3>

<h3 class="fragment name">Using R and Git to manage projects</h3>

<div class="fragment">
    <h3 class="name">Build your own packages</h3>
    <ul>
        <li>RcappeR</li>
        <li>servevolleyR</li>
    </ul>
</div>

--- &vertical

## Background

<div class="fragment">
    <h3 style="text-align: left">Jan 2013</h3>
</div>
<div class="fragment">
    <h3>An Excel user</h3>

    <img src="assets/img/chain-smoking.jpg" style="width:80%">
</div>

***

<div class="fragment">
    <h3 style="text-align: left">May 2013</h3>
</div>
<div class="fragment">
    <h3>What is R?</h3>

    <img src="assets/img/bert-ernie-r.jpg" style="width:50%">
</div>

***

<div class="fragment">
    <h3 style="text-align: left">Jun 2013</h3>
</div>
<div class="fragment">
    <h3>Type first R command</h3>

    <img src="assets/img/cookie-monster.gif" style="width:80%">
</div>

***

<div class="fragment">
    <h3 style="text-align: left">Jun 2014</h3>
</div>
<div class="fragment">
    <h3>I got this</h3>

    <img src="assets/img/dog-fail.gif" style="width: 80%">

    <h3>No I don't</h3>
</div>

***

<div class="fragment">
    <h3 style="text-align: left">Dec 2014</h3>
</div>
<div class="fragment">
    <h3>Release my second R package</h3>

    <img src="assets/img/i-am-invincible.gif" style="width: 80%">
</div>

***

<h3>Constantly learning</h3>

<img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/dog-fail.gif" style="width: 100px; height: 75px"><img src="assets/img/bert-ernie-r.jpg" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/dog-fail.gif" style="width: 100px; height: 75px"><img src="assets/img/i-am-invincible.gif" style="width: 100px; height: 75px"><img src="assets/img/dog-fail.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/bert-ernie-r.jpg" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/i-am-invincible.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/dog-fail.gif" style="width: 100px; height: 75px"><img src="assets/img/dog-fail.gif" style="width: 100px; height: 75px"><img src="assets/img/dog-fail.gif" style="width: 100px; height: 75px"><img src="assets/img/bert-ernie-r.jpg" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width: 100px; height: 75px"><img src="assets/img/i-am-invincible.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/cookie-monster.gif" style="width: 100px; height: 75px"><img src="assets/img/i-am-invincible.gif" style="width: 100px; height: 75px"><img src="assets/img/bert-ernie-r.jpg" style="width:100px; height:75px"><img src="assets/img/dog-fail.gif" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px"><img src="assets/img/dog-fail.gif" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px"><img src="assets/img/cookie-monster.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px"><img src="assets/img/i-am-invincible.gif" style="width:100px; height:75px">

--- &vertical

## What is R?

<h3 class="fragment"><a href="https://www.r-project.org/">R is a free software environment for statistical computing and graphics</a></h3>

<hr>
<br>

<h3 class="fragment">R is <span class="fragment">data analysis software</span></h3>
<h3 class="fragment">R is <span class="fragment">a programming language</span></h3>
<h3 class="fragment">R is <span class="fragment">open source</span></h3>
<h3 class="fragment">R is <span class="fragment">a community</span></h3>

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

<h3 class="fragment"><a href="https://git-scm.com">Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency</a></h3>

***

Git allows programmers to track changes they make to their code, these changes could include

* bug fixes
* additional features
* or small improvements (as shown below)

![](assets/img/git-diff-example.jpg)

---
