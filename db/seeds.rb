require "csv"

CSV.foreach('db/land_id.csv', headers: true) do |row|
  Land.create(
    land: row['land'],
    deutsch_name: row['deutsch_name'],
    richtung: row['richtung'],
  )
end

CSV.foreach('db/region_id.csv', headers: true) do |row|
  Region.create(
    name: row['name'],
    deutsch_name: row['deutsch_name'],
    region: row['region'],
  )
end

CSV.foreach('db/bier_id.csv', headers: true) do |row|
  Bier.create(
    deutsch_name: row['deutsch_name'],
    name: row['name'],
    prozent: row['prozent'],
    area: row['area'],
    style: row['style'],
    explanation: row['explanation'],
    image: File.open("app/assets/images/Bierimages/#{row['image']}")
  )
end