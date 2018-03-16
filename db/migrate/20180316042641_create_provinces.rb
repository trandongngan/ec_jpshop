#require 'fastercsv'
require 'roo'
require 'roo-xls'

class CreateProvinces < ActiveRecord::Migration[5.1]
  def self.up
    create_table :provinces do |t|
      t.string  :code
      t.string  :province
      t.string  :district
      t.string  :ward

      t.timestamps
    end

    spreadsheet = Roo::Spreadsheet.open(
      File.join(Rails.root.join "db", "data", "provinces.xls"),
      csv_options: {encoding: Encoding::ASCII_8BIT}
    )

    province = ""
    district = ""
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      if (row['province'] != province)
        Province.create!({
          province: row['province'],
          code: row['city_code']
        })
        province = row['province']
      end

      if (row['district'] != district)
        Province.create!({
          province: row['province'],
          district: row['district'],
          code: row['district_code']
        })
        district = row['district']
      end

      Province.create!(
        {
          province: row['province'],
          district: row['district'],
          ward: row['ward'],
          code: row['ward_code']
        }
      )
    end
  end

  def self.down
    drop_table :provinces
  end
end
