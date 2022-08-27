# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Added admin user
User.create!(first_name: 'admin', last_name: 'admin', email: 'admin@yopmail.com', password: 'admin@123', role: 0)
