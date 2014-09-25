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

The next page is the most recent upload page. This is were the last file uploaded will show. To upload a new file simply click the "Import Sales Data" button.

<a href='http://postimg.org/image/kv0ds28q3/' target='_blank'><img src='http://s25.postimg.org/kv0ds28q3/code_challenge_index_before.jpg' border='0' alt="code challenge index before" /></a>

The Sales Data Import page will now be displayed. This page describes the types of files that can be uploaded and what fields  and field types are expected. To upload a new file click the "Choose File" button and select a file. Two sample files have been included in the `/app` directory: `example_data.csv` and `example_data.tab`.

<a href='http://postimg.org/image/5dhh23rmz/' target='_blank'><img src='http://s25.postimg.org/5dhh23rmz/code_challenge_upload.jpg' border='0' alt="code challenge upload" /></a>



<a href='http://postimg.org/image/8dtq4wdkb/' target='_blank'><img src='http://s25.postimg.org/8dtq4wdkb/code_challenge_index_after.jpg' border='0' alt="code challenge index after" /></a>

Requires Ruby 1.9.2 or later to run.
