Log Monitor
----

Whatches the Snort IDS log files and pops up GTK alerts is something is fishy.  

Usage
---

Install the requirements: Snort IDS, Ruby, RubyGems, rubyGTK and libnotify:
```sh
$ apt-get install snort
$ apt-get install ruby rubygems
$ apt-get install libinotify-ruby libgtk2-ruby libnotify-dev
$ gem install libnotify
```

Run the unittests:
```sh
$ ruby unittest/ts_allTheTests.rb
```

And run the program:
```sh
$ ruby main.rb
```

Notes
---

This code has not been updates since May 2011 and it is less likely that it will ever be. 

A python port exists on the *porting-python* branch.

Tested under Debian 6.0 clean install with latest updates.

License
---
Copyright Stefan Fodor @ 2011

This program is free under the terms of GNU GPL licence.

Feel free to copy, modify and redistribute.
