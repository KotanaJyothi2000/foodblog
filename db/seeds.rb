# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.create ([
  { tittle: "5 Healthy Eating Tips",
   content: "Learn how to balance your diet with these simple tips",
   category: "Food"
  },
  { tittle: "Top 10 Recipes for Quick Dinners",
    content: "Save time in the kitchen with these delicious recipes",
  category: "Food"
  },
  { tittle: "Emerging technologies",
    content: "AI""Cloud Computing""Data Science",
    category: "Technology"

  }

])
