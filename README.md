Seed
====

Another seeding library for Ruby

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

Retrieving a seed
-----------------

    User.seed(:bob)

Attempting to retrieve a non-existent seed will result in an error.

Rake Task
---------

Seed comes with a rake task to make creating multiple "seeds" easier. In your Rakefile, add the following:

    require 'seed/task'

Create a db/seeds directory and add a named seed, such as development.rb.

Running rake db:seed:development will then load your seeds from db/seeds/development.rb.