## CSV and Tab Delimited File Upload and Parse

Thanks to this <a href="http://railscasts.com/episodes/396-importing-csv-and-excel">RailsCasts</a> for giving me a pretty good starting point.


###Setup Instructions:
```
clone project
bundle
rake db:setup
rails s
visit your localhost:3000 or whichever port your server is running on
```

###Usage Instructions:
The first thing you will see is the user sign in page.
<a href='http://postimg.org/image/s9ppkfuln/' target='_blank'><img src='http://s25.postimg.org/s9ppkfuln/code_challenge_sign_in.jpg' border='0' alt="code challenge sign in" /></a>
Sign in with email: `admin@example.com` and password: `password` or register a new account with the "sign up" link.

Two sample files have been included: `example_data.csv` and `example_data.tab`.

<a href='http://postimg.org/image/8dtq4wdkb/' target='_blank'><img src='http://s25.postimg.org/8dtq4wdkb/code_challenge_index_after.jpg' border='0' alt="code challenge index after" /></a>

Requires Ruby 1.9.2 or later to run.
