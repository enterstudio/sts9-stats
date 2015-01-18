require 'open-uri'
require 'csv'

task :scrape1320 do
  # hardcoded to the most recent show release ID on 1320 records (Fillmore 2015-01-03)
  max_release = 1376
  page_string = "http://digital.1320records.com/search/release.php?RELEASE_ID="

  CSV.open("1320dump.csv", "wb") do |csv|
    csv << ["date", "venue", "city", "state", "country","setlist", "link"]
    

    for i in 1171..max_release
      puts i
      current_show_uri = page_string + i.to_s
      page = Nokogiri::HTML(open(current_show_uri)) 
      band = ""
      show = ""
      setlist = ""

      if has_valid_title?(page)
        band = page.css(".release_attr_title")[1].text
        show = page.css(".release_attr_title")[0].text
        valid_show = is_valid_show?(show)
      end
      if band === "STS9" && has_valid_setlist?(page) && valid_show
        puts setlist
        setlist = page.css(".article_text")[0].text
        start = setlist.index("SET") || setlist.index("Set") || setlist.index("Murph") || setlist.index("This Us") #|| setlist.index("Instantly")
        setlist = setlist[start..setlist.length-1]
        puts show
        seperators = (0 ... show.length).find_all { |i| show[i,2] == '::' }
        puts seperators
        date = show[0..seperators[0]-2]
        puts date + "\n"

        if seperators.length > 1
          venue = show[seperators[0]+3..seperators[1]-2]
          puts venue + "\n"
          location = show[seperators[1]+3..show.length-1]
        else
          venue = show[seperators[0]+2..show.length-1]
          puts venue + "\n"
        end
        if(location && location.index(","))
          city = location[0..location.index(',')-1]
          puts city + "\n"
          state = location[location.index(',')+2..location.length-1]
          puts state + "\n"
          country = "USA"
        elsif location
          city = ""
          state = ""
          country = location
        else
          city = ""
          state = ""
          country = ""          
        end
        puts setlist + "\n"
        csv << [date, venue, city, state, country, setlist, current_show_uri]
      end
      # sleep(5)
    end    
  end
end


def has_valid_title? page
  # make sure 2 title fields exist for band name and show date/venue
  page.css(".release_attr_title") && page.css(".release_attr_title").length > 1
end

def has_valid_setlist? page
  page.css(".article_text") && page.css(".article_text").length > 0
end

def is_valid_show? show
  puts show
  # checks the first 4 chars in the album title and return true if they are numeric
  show[0..3] =~ /\A\d+\z/ ? true : false
end