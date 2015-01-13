require 'open-uri'

namespace :scrape do

  task :sts9 => :environment do
    # hardcoded to the most recent show release ID on 1320 records (Fillmore 2015-01-03)
    max_release = 1376
    page_string = "http://digital.1320records.com/search/release.php?RELEASE_ID="

    for i in 0..max_release
      current_show_uri = page_string + i.to_s
      page = Nokogiri::HTML(open(current_show_uri)) 
      
      if page.css(".release_attr_title") && page.css(".release_attr_title").length > 1
        band = page.css(".release_attr_title")[1].text
        show = page.css(".release_attr_title")[0].text
        if band === "STS9"
          puts band + " - " + show
        end
      end
      sleep(5)
    end
  end
end