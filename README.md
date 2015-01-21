<h2>The STS9 equivalent of <a href="http://allthings.umphreys.com" target="_blank">All Things Umphreys</a></h2>
<p>Current plan is a Rails backend API with a Javascript frontend, unless someone has a good reason to do something different.</p>
<p>Data modeling is done for the most part, but the migration hasn't been run yet so there may be errors.  1320 Records site has been scraped and dumped to a CSV file (public/1320dump.csv).  The setlists in the CSV need to parsed to break down songs, but we shouldn't need to scrape the site again.</p>
<h3>Setup</h3>
```bundle install```<br />
```rake db:create```<br />
```rake db:migrate```<br />
```rake import1320```<br />

<h3>TODO</h3>
<ul>
  <li><strike>Data Modeling/Schemas (Shows, Venues, Songs, etc)</strike></li>
  <li><strike>Initial Schema Migration</strike></li>
  <li>Initial CSV Import</li>  
  <li>Unit Testing</li>
  <li>Controllers</li>
  <li>Integration Testing</li>
  <li>Functional JSON API</li>
  <li>Scrapers for additional sites</li>  
</ul>

