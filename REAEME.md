<!-- -*- mode: markdown -*- coding: utf-8 -*- -->
# README

## Overview

* With site-generator "lektor" generate output into "build" directory
* Assing "buta7.github.io" repository to "build"
* "build" works as submodule of "blog-lekter"
* No use deploy method of lekter provided, use github commit/push only
* If you want master/docs branch, use "docs" directory instead of "build"
    - In this case, you need just one repository

## Set Up

create a project

    $ lecktor quickstart

* Project Name: buta7.github.io
* Author Name: higebobo
* Project Path: [...]/buta7-blog (default)

## Github

create two repository

* buta7-blog
* buta7.github.io
    
## Deploy

initialize buta7-blog repository

    $ cd buta7-blog
    $ echo "*~" >> .gitignore
    $ echo "*.bak" >> .gitignore
    $ echo "*.pyc" >> .gitignore
    $ mv buta7-blog website.lektorproject
    $ rm -fr build
    $ git init
    $ git add .
    $ git commit -m 'First commit'
    $ git remote add origin git@github-buta7:buta7/blog-buta7.git
    $ git remote -v
    $ git push -u origin master

initialize buta7.github.io repository

    $ git submodule add git@github-buta7:buta7/buta7.github.io.git build
    $ lektor build --output-path=build
    $ 

deploy[^1]

	$ make deploy

[^1]: see deploy.sh
