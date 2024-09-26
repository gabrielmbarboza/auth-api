# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  { 
    username: "john_doe", 
    email: "john@example.com", 
    password: '123', 
    password_confirmation: 
    '123', 
    avatar: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80" 
  },
  { username: "jane_smith", 
    email: "jane@example.com", 
    password: '123', 
    password_confirmation: '123', 
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80" 
  },
  { username: "mike_johnson", 
    email: "mike@example.com", 
    password: '123', 
    password_confirmation: '123', 
    avatar: "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80" 
  },
  { username: "sarah_williams", 
    email: "sarah@example.com", 
    password: '123', 
    password_confirmation: '123', 
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80" 
  }
]

users.each { |user| User.create!(user) }