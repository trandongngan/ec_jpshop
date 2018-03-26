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
    spreadsheets = readExcel(File.join(Rails.root.join "db", "data", "products1.xlsx"))

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

      next if Category.find_by(id: row['category_id1']).blank?

      Product.transaction do
        data = {
          id: product_id,
          name: row['product_name'].blank? ? "" : row['product_name'],
          description: row['description'].blank? ? "" : row['description'],
          about: row['about'].blank? ? "" : row['about'],
          category_id: row['category_id1']
        }

        product = Product.find_by_id(product_id)
        unless product.blank?
          product.update_attributes(data)
        else
          Product.create!(data)
        end

        image_path = row['image'].gsub("\\", "/")
        Dir.glob("#{Rails.root}/app/assets/#{image_path}/*").each do |path|
          image = Image.find_or_create_by(path: path.gsub("#{Rails.root}/app/assets/images/", "/assets/"))
          ProductImage.find_or_create_by(product_id: product_id, image_id: image.id)
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

            property = Property.find_or_create_by(name: tmp.shift, value: tmp.join(''))
            ProductProperty.create({product_id: product_id, property_id: property.id})
          end
        end
      end
    end
  end
  desc "Import seller"
  task import_sellers_test: :environment do
    User.where(role: :seller).destroy_all
    [*1..20].each do |i|
      User.create(
        {
          username: "Seller #{i}",
          email: "seller#{i}@jpshop.com",
          password: "1qazxsw2",
          password_confirmation: "1qazxsw2",
          role: :seller
        }
      )
    end

    sellers = User.where(role: :seller)
    Product.all.each do |pro|
      SellerOrders.where(product_id: pro.id).destroy_all
      SellerProduct.where(product_id: pro.id).destroy_all

      sellers.each do |sel|
        SellerOrders.create!(
          seller_id: sel.id,
          product_id: pro.id,
          number: (sel.id * 1000).to_s,
          amount: 100
        )

        SellerProduct.create!(
          {
            seller_id: sel.id,
            product_id: pro.id,
            price: rand(50000..100000),
            status: SellerProduct::DEFAULT_SELL_STATUS
          }
        )
      end
    end
  end
  desc "prepare data test"
  task prepare_data_test: :environment do
    system("cd #{Rails.root}")
    system("bundle exec rake db:drop")
    system("bundle exec rake db:create")
    system("bundle exec rake db:migrate")
    system("bundle exec rake jpshop:import_products")
    system("bundle exec rake jpshop:import_sellers_test")
  end
end
