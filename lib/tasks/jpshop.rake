# -*- coding: utf-8 -*-
require 'roo'
require 'roo-xls'

def readExcel(file, encoding: Encoding::ASCII_8BIT)
  Roo::Spreadsheet.open(
    file,
    csv_options: {encoding: encoding}
  )
end

namespace :jpshop do
  desc "Import (create or update) product"
  task import_products: :environment do
    spreadsheets = readExcel(File.join(Rails.root.join "db", "data", "products.xlsx"))

    ## import categories
    spreadsheet = spreadsheets.sheet('Category')
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      Category.find_or_create_by(name: row['category_name'])
    end

    ## import products
    spreadsheet = spreadsheets.sheet('Product')
    header = spreadsheet.row(1)
    (3..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      product_id = row['product_id']
      product = Product.find_by_id(product_id)

      next if Category.find_by_id(row['category_id']).blank?

      Product.transaction do
        data = {
          id: product_id,
          name: row['product_name'].blank? ? "" : row['product_name'],
          description: row['description'].blank? ? "" : row['description'],
          about: row['about'].blank? ? "" : row['about'],
          category_id: row['category_id1']
        }

        unless product.blank?
          product.update_attributes(data)
        else
          Product.create!(data)
        end

        ProductProperty.where(product_id: product_id).destroy_all

        unless row['manufacturer'].blank?
          property = Property.find_or_create_by(name: 'manufacturer', value: row['manufacturer'])
          ProductProperty.create({product_id: product_id, property_id: property.id})
        end

        unless row['detail'].blank?
          details = row['detail'].split('*')

          details.each do |detail|
            tmp = detail.split(':')

            next if tmp[0].blank? || tmp[1].blank?

            property = Property.find_or_create_by(name: tmp[0], value: tmp[1])
            ProductProperty.create({product_id: product_id, property_id: property.id})
          end
        end
      end
    end
  end
end
