require 'open-uri'

task :scrape_soundtribe_org_dump do

  agent = Mechanize.new
  page = agent.get("http://www.shortlittlebreak.com/ld/")

  # Select the first form
  form = agent.page.forms.first
  form.user = 'moskeyombus'
  form.passwrd = '5w0mpuS!'

  # Submit the form
  page = form.submit form.buttons.first
  page_string = "http://www.shortlittlebreak.com/ld/index.php?topic=8.0"
  page = Nokogiri::HTML(open(page_string))
  puts page
end


def has_valid_title? page
  # make sure 2 title fields exist for band name and show date/venue
  page.css(".release_attr_title") && page.css(".release_attr_title").length > 1
end

def has_valid_setlist? page
  page.css(".article_text") && page.css(".article_text").length > 0
end

def is_valid_show? show
  # checks the first 4 chars in the album title and return true if they are numeric
  show[0..3] =~ /\A\d+\z/ ? true : false
end