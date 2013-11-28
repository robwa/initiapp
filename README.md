Initiapp
========

[![Code Climate](https://codeclimate.com/github/robwa/initiapp.png)](https://codeclimate.com/github/robwa/initiapp)
[![Dependency Status](https://gemnasium.com/robwa/initiapp.png)](https://gemnasium.com/robwa/initiapp)
[![Build Status](https://travis-ci.org/robwa/initiapp.png?branch=master)](https://travis-ci.org/robwa/initiapp)

Web-based organization for initiatives.


## Concept

Most community driven initiatives share the same needs for software:
* They organize themselves as members of an initiative, sometimes within groups.
* Members send messages to other members or groups or all members of the initiative.
* The initiative collects knowledge in some form of editable pages (wiki), possibly sharing some pages with members, groups, other initiatives or the world (kind of a homepage).
* Tasks, todos, events or however you might call them are often a central part of organization as well.

All these parts can be put together with one simple approach: Just append text nodes to the triangle Members/ Groups/ Initiatives. This is the core idea of this project, together with the intent not to reinvent everything from scratch but instead using existing modules as far as possible.


## Development

```Shell
git clone https://github.com/robwa/initiapp.git
cd initiapp
bundle install
rake db:test:prepare
cucumber
```

The output of the last command should give you a good impression of what the current state of development is.

```shell
rake db:setup
rails server
```

Should give you a running application.

See [the development page in the Github wiki](http://github.com/robwa/initiapp/wiki/Development) for further information.
