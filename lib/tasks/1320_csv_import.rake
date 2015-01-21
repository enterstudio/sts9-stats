require 'csv'

task :import1320 => :environment do
  csv_text = File.read("public/1320dump.csv")
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    row_object = row.to_hash.deep_symbolize_keys
    venue = get_venue(row_object)    
    Show.create(
      date: row_object[:date].gsub(/\s+/, ""),
      venue_id: venue.id
    )
  end
end

def get_venue row
  venue = Venue.where(name: row[:venue]).where(city: row[:city]).where(state: row[:state])

  if venue.count == 0
    venue = Venue.create!(
      name: row[:venue],
      country: row[:country],
      city: row[:city],
      state: row[:state]
    )
  else
    venue = venue.first
  end
  venue
end