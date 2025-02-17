NillyVanilly
============

This Rails gem/plugin stores NULL in your database when you try to store an empty string.

It only works for columns you explicitly mention inside your model. It comes
with a rake task which prints out all the columns eligible for nillification.

Since HTTP parameters are always strings, an empty string is sent by form
values for which you did not mean to enter any value. This plugin makes sure
to save NULL in database varchar columns that are defined with DEFAULT NULL.


Example
=======

    class Comment < ActiveRecord::Base
      nillify :author_url
    end

    comment = Comment.create :author_url => ""
    comment.author_url        # -> nil
  

Installation
============

The preferred method of installation is now as a gem.

    config.gem 'nilly_vanilly'

or, for Rails 3 with Bundler in your Gemfile:

    gem 'nilly_vanilly'

Previous versions of Nilly Vanilly were distributed as a Rails plugin. For Rails
2 apps this might still work, but is not supported. If you absolutely need the
Rake task in your Rails 2 app, you can:

    ./script/plugin install git://github.com/tilsammans/nilly_vanilly.git

Installation as a plugin in Rails 2 adds a rake task you can run to find suitable
columns for nillification. For Rails 3, I will add this task in a future version.
Until then you can find the same information by running:

    ./script/runner "NillyVanilly::Inspect.print"


Inspection
==========

To see what columns are eligible for nillification, run the following:

    rake nilly:vanilly:inspect

This will print a list of all tables in your database, cross-referenced with
the models in your application. All text columns which may be NULL and are
nil by default are shown, i.e. all these columns should be safe to nillify.
This does not take into account any validations you might have.

When a column has already been nillified, it will be indicated with [OK].


But WHY?!!
==========

You: who cares that empty strings are stored in the database?
Me: if you don't care, just move along. And would I recommend you nillify
every attribute in your application? No. But beside from the fact that NULL
is the "correct" value for something you don't know, enforcing this is
required if you have a unique index on that column. Unique indexes are the
fastest you can have, and they deal great with NULL values. Empty strings?
Not so much so.


Contributing
============

Fork and clone the repo and hack away.

It is very important you *must* run the specs before sending a pull request.


Author
======

Joost Baaij
<joost@spacebabies.nl>
[www.spacebabies.nl](http://www.spacebabies.nl/)