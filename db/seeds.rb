# db/seeds.rb
# This file contains seed data for development

puts "Cleaning up database..."
Blog.destroy_all
Project.destroy_all
Event.destroy_all
LeadershipProfile.destroy_all
HomepageContent.destroy_all
AboutPage.destroy_all
ContactInfo.destroy_all
Admin.destroy_all

puts "Creating admins..."
admin1 = Admin.create!(
  name: "Mbabani Allan",
  email: "admin@olemwachessclub.com",
  password: "password123",
  password_confirmation: "password123",
  role: :admin
)

editor1 = Admin.create!(
  name: "Olewa Chess Club Editor",
  email: "editor@olemwachessclub.com",
  password: "password123",
  password_confirmation: "password123",
  role: :editor
)

puts "Creating about page..."
AboutPage.create!(
  mission: "To promote excellence in chess and foster a vibrant community of chess enthusiasts.",
  vision: "To be the leading chess club inspiring strategic thinking and sportsmanship.",
  main_content: "Welcome to our Chess Club! Founded in 2020, we have become a cornerstone of the chess community...",
  history: "Our journey began with a small group of passionate chess players..."
)

puts "Creating homepage content..."
HomepageContent.create!(
  hero_title: "Welcome to Chess Club",
  hero_subtitle: "Join us in the pursuit of chess excellence",
  about_snippet: "We are a community of chess enthusiasts dedicated to promoting the game and developing players of all levels."
)

puts "Creating contact info..."
ContactInfo.create!(
  phone: "+256 722 222 222",
  email: "info@olemwa.com",
  location: "123 Chess Avenue, Board City, BC 12345",
  facebook_url: "https://facebook.com/olemwa",
  twitter_url: "https://twitter.com/olemwa",
  instagram_url: "https://instagram.com/olemwa"
)

puts "Creating leadership profiles..."
LeadershipProfile.create!([
  {
    name: "John Doe",
    role: "President",
    bio: "International Master with 15 years of competitive experience.",
    position_order: 1
  },
  {
    name: "Jane Smith",
    role: "Vice President",
    bio: "FIDE Master and chess educator passionate about youth development.",
    position_order: 2
  },
  {
    name: "Robert Johnson",
    role: "Tournament Director",
    bio: "Certified tournament arbiter with experience organizing major events.",
    position_order: 3
  }
])

puts "Creating projects..."
Project.create!([
  {
    title: "Youth Chess Program",
    description: "A comprehensive program designed to introduce chess to young players aged 6-14.",
    status: :ongoing,
    published: true
  },
  {
    title: "Annual Championship Tournament",
    description: "Our flagship tournament attracting players from across the region.",
    status: :ongoing,
    published: true
  },
  {
    title: "Chess in Schools Initiative",
    description: "Successfully implemented chess programs in 10 local schools.",
    status: :completed,
    published: true
  }
])

puts "Creating blog posts..."
Blog.create!([
  {
    title: "The Importance of Opening Theory",
    slug: "importance-of-opening-theory",
    content: "Understanding opening theory is crucial for any chess player looking to improve their game...",
    status: :published,
    published_at: 2.weeks.ago,
    admin: admin1
  },
  {
    title: "Upcoming Tournament Schedule",
    slug: "upcoming-tournament-schedule",
    content: "We're excited to announce our tournament schedule for the upcoming season...",
    status: :published,
    published_at: 1.week.ago,
    admin: admin1
  },
  {
    title: "Chess Tactics Workshop Review",
    slug: "chess-tactics-workshop-review",
    content: "Last weekend's tactics workshop was a tremendous success...",
    status: :draft,
    admin: editor1
  }
])

puts "Creating events..."
Event.create!([
  {
    title: "Weekly Club Meeting",
    description: "Join us for our regular club meeting with casual games and analysis.",
    event_date: 1.week.from_now,
    location: "Chess Club Hall",
    status: :upcoming
  },
  {
    title: "Blitz Tournament",
    description: "Fast-paced blitz tournament open to all skill levels.",
    event_date: 2.weeks.from_now,
    location: "Chess Club Hall",
    registration_url: "https://example.com/register",
    status: :upcoming
  },
  {
    title: "Grandmaster Simultaneous Exhibition",
    description: "A visiting Grandmaster will play against multiple club members simultaneously.",
    event_date: 1.month.from_now,
    location: "Main Hall",
    registration_url: "https://example.com/register-simul",
    status: :upcoming
  }
])

puts "✅ Seed data created successfully!"
puts ""
puts "Login credentials:"
puts "  Admin: admin@chessclub.com / password123"
puts "  Editor: editor@chessclub.com / password123"
