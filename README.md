<h2>The STS9 equivalent of <a href="http://allthings.umphreys.com" target="_blank">All Things Umphreys</a></h2>
<p>Current plan is a Rails backend API with a Javascript frontend, unless someone has a good reason to do something different.</p>
<p>Data modeling is done for the most part, but the migration hasn't been run yet so there may be errors.  1320 Records site has been scraped and dumped to a CSV file (public/1320dump.csv).  The setlists in the CSV need to parsed to break down songs, but we shouldn't need to scrape the site again.  It's possible that the scrape may have messed up a handful of setlists - it was looking for instances of the word "SET" but some were missing that so I had to use "Murph", and then a couple shows started with actual song names.  There's a chance some of the setlists could have chopped off the songs before occurences of "Murph", "Instantly", or "This Us".</p>
<h3>Instructions</h3>
<p><strong>WARNING: </strong>Current models are just a general schema idea.  Completely untested, rake script doesnt populate yet.</p>
Clone repo<br />
```bundle install```<br />
```rake db:create```<br />
```rake db:migrate```<br />
```rake scrape1320```
</ul>
<h3>TODO</h3>
<ul>
  <li>~~Data Modeling/Schemas (Shows, Venues, Songs, etc)~~</li>
  <li>Scrapers for additional sites</li>
  <li>Strategies for conflict resolution when different site setlists don't match</li>
  <li>Testing</li>
  <li>Pick a frontend framework (probably AngularJS)</li>
</ul>

