Seed
====

Another seeding library for Ruby

Rails 3 and Ruby 1.9
--------------------

Seed is Rails 3 and Ruby 1.9 compatible

Usage
-----

Planting a seed
---------------

Seed supports two syntaxes:

    User.seed(:bob) do |user|
      user.name = 'Bob'
    end

or:

    User.seed(:bob, :name => 'Bob')

Attempting to overwrite an existing seed will result in an error.

Seeding associations
--------------------

Associations can be handled by first creating a seed:

    Role.seed(:admin, :role => 'admin')
    
And then using that seed when generating the associated object:

    User.seed(:bob, :name => 'Bob', :role => Role.seed(:admin))

Retrieving a seed
-----------------

    User.seed(:bob)

Attempting to retrieve a non-existent seed will result in an error.

Rake Task
---------

**NOTE**: This step is only needed for Rails 2.x

Seed comes with a rake task to make creating multiple "seeds" easier. In your Rakefile, add the following:

    require 'seed/task'

Create a db/seeds directory and add a named seed, such as development.rb.

Running rake db:seed:development will then load your seeds from db/seeds/development.rb.
