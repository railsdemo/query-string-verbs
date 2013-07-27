## URL Verbs in Query Strings

[Heroku Demo Link](hhttp://query-string-verbs.herokuapp.com/)

*"but I prefer the “?m=share” formulation..., it makes it clear that the page is meant to do something, not just convey more information."* - Aaron Swartz

A demo of URLs that use the following conventions, as propsed by Aaron Swartz in [A Programmable Web, Ch. 2 Building for Users: Designing URLs](http://www.morganclaypool.com/doi/abs/10.2200/S00481ED1V01Y201302WBE005):

1. URLs represent nouns (/locations, /location/1)
2. Verbs should be passed to the noun via query string (/locations?v=new, /location/1?v=edit)

This is a bit strange and I will present two demos objects:

-Locations (Scaffolded)
-Users (Created from Scratch)

This feels like a hack that destroys rails conventions, so I don't recommend it.  Although I share Aaron's belief that URLs should be nouns and verbs appended in query strings, I will likely stick to rails conventions.  This was meant as a demo to prove it could be done.

Rake Routes

```ruby
       Prefix Verb   URI Pattern                          Controller#Action
   users_list GET    /users/list(.:format)                users#list
   users_view GET    /users/view(.:format)                users#view
    locations GET    /locations(.:format)                 locations#index
     location GET    /locations/:id(.:format)             locations#show
 new_location GET    /locations?v=new(.:format)           locations#index
              POST   /locations(?v=create)(.:format)      locations#index
edit_location GET    /locations/:id?v=edit(.:format)      locations#show
              PUT    /locations/:id(?v=update)(.:format)  locations#show
              PATCH  /locations/:id(?v=update)(.:format)  locations#show
              DELETE /locations/:id(?v=destroy)(.:format) locations#show
```
