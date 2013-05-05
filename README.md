MVCnoOOP
========
Contents:
=====
  - Topic
  
  - Description and realization
  
  - How to use

1. Topic
========

Code organization in the spirit of MVC model, implemented without using object oriented php.
Done for educational purposes ( it is easiest to understand MVC model,
when student didn't need to think about in OO way )

2. Description and realization
===

Using a set of functions I simulate MVC model and successfully separated the logic of the site layout.

Structure in folders
(site is divided into three logical sections):

- Controller - which accepts data relating to navigation, sessions and engage model

- Model - in addition to the initial model, which collects all the general information, Each page has its own model that prepares data relevant to the page - all information is packed into an associative global array $model

- View - that we also show that the initial loading elements that are fixed for each page (header and footer) and the data obtained from the model forwarded to a page that is in the template folder

3. How to use
===

