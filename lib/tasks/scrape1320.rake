require 'open-uri'

task :scrape1320 do
  # hardcoded to the most recent show release ID on 1320 records (Fillmore 2015-01-03)
  max_release = 1376
  page_string = "http://digital.1320records.com/search/release.php?RELEASE_ID="

  for i in 1370..max_release
    current_show_uri = page_string + i.to_s
    page = Nokogiri::HTML(open(current_show_uri)) 
    band = ""
    show = ""
    setlist = ""
    
    if has_valid_title?(page)
      band = page.css(".release_attr_title")[1].text
      show = page.css(".release_attr_title")[0].text
    end
    if has_valid_setlist?(page)
      setlist = page.css(".article_text")[0].text
    end
    if band === "STS9" && is_valid_show?(show)
      puts band + " - " + show
      puts setlist + "\n"
    end
    sleep(5)
  end
end


def has_valid_title? page
  page.css(".release_attr_title") && page.css(".release_attr_title").length > 1
end

def has_valid_setlist? page
  page.css(".article_text") && page.css(".article_text").length > 0
end

def is_valid_show? show
  # checks the first 4 chars in the album title and return true if they are numeric
  show[0..3] =~ /\A\d+\z/ ? true : false
end