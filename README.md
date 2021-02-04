# Build a Rails App

## Overview

- [What to Expect from the Project Review](#expectations)
- [Project Requirements](#requirements)
- [Instructions](#instructions)
- [Support](#support)
- [Practicing for Success](#success)
- [Resources](#resources)

In this lesson you're going to build a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System, whether the content being managed is Blog Posts, Recipes, a Library of Resources, or any domain model that lends itself to these requirements (the majority of ideas you could come up with would probably meet the requirements).

## <a>Demo</a>


## <a id="requirements">Requirements</a>

1. Use the Ruby on Rails framework.

2. Your models must:  
  > • Include at least one `has_many`, at least one `belongs_to`, and at least two `has_many :through` relationships 
  >   
  > • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

3. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

4. You must include at least one class level ActiveRecord [scope method](https://guides.rubyonrails.org/active_record_querying.html#scopes).
  a. Your scope method must be chainable, meaning that you must use [ActiveRecord Query methods](https://guides.rubyonrails.org/active_record_querying.html) within it (such as `.where` and `.order`) rather than native ruby methods (such as `#find_all` or `#sort`).

5. Your application must provide standard user authentication, including signup, login, logout, and passwords.

6. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

7. You must include and make use of a nested resource with the appropriate RESTful URLs.
  > • You must include a nested `new` route with form that relates to the parent resource  
  >  
  > • You must include a nested `index` or `show` route

8. Your forms should correctly display validation errors.
  > a. Your fields should be enclosed within a fields_with_errors class
  >
  > b. Error messages describing the validation failures must be present within the view.

9. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. 
  > • Logic present in your controllers should be encapsulated as methods in your models.  
  >  
  > • Your views should use helper methods and partials when appropriate. 
  >    
  > • Follow patterns in the [Rails Style Guide](https://github.com/bbatsov/rails-style-guide) and the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).



## <a id="resources">Resources</a>
- [Rails Routing From the Outside In](https://guides.rubyonrails.org/routing.html)
- [ActiveRecord Associations](https://guides.rubyonrails.org/association_basics.html)
- [ActiveRecord Validations](https://guides.rubyonrails.org/active_record_validations.html)
- [ActiveRecord Query Interface](https://guides.rubyonrails.org/active_record_querying.html)


<p class='util--hide'>View <a href='https://learn.co/lessons/rails-assessment'>Rails Portfolio Project</a> on Learn.co and start learning to code for free.</p>

