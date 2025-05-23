# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def attach_media(project, base_name, limit: 3, max_files: nil)
  dir = Rails.root.join("db/seeds/assets")
  files = Dir.glob("#{dir}/#{base_name}_*").first(max_files || limit)

  files = files.sample(limit) if max_files && files.size > limit

  project.media_files.attach(
    files.map do |path|
      { io: File.open(path), filename: File.basename(path) }
    end
  )
end

Project.destroy_all

p1 = Project.create!(
  customer: "Parole Citoyenne",
  description: "Organisation d’une conférence avec Vladimir Fedorovski, création de mini-site, supports de communication, refonte de site.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  icons: "event, branding, website, communication",
  logo: "Logo Parole Citoyenne.png"
)
attach_media(p1, "parole_citoyenne")

p2 = Project.create!(
  customer: "Ni Sawa",
  description: "Création d'identité visuelle complète pour le lancement d’un Hôtel Bar Restaurant à Brazzaville. Logos, affiches, panneaux, tee-shirts et motifs culturels.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  icons: "branding, hospitality, print design",
  logo: "Ni Sawa-v10.png"
)
attach_media(p2, "ni_sawa", limit: 4, max_files: 6)

p3 = Project.create!(
  customer: "Braids_Maria",
  description: "Refonte du logo et création d’une vidéo événementielle à partir de posts Instagram.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  icons: "logo, video, event",
  logo: "Braids_Maria.png"
)
attach_media(p3, "braids_maria")

p4 = Project.create!(
  customer: "Sookee",
  description: "Création de visuels et vidéo pour le lancement d’un service de mise en relation autour de la coiffure texturée à domicile.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  icons: "social media, video, haircare",
  logo: "Logo Sookee SF.png"
)
attach_media(p4, "sookee")

p5 = Project.create!(
  customer: "Maison ADGÉ",
  description: "Refonte du site e-commerce, optimisation SEO, conseil client, et création d’une charte graphique pour une marque de kimonos et pyjamas en wax.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  icons: "ecommerce, fashion, SEO, UX/UI",
  logo: "Logo Maison ADGE.png"
)
attach_media(p5, "maison_adge")

puts "Je me suis enrichie en contribuant à ces #{Project.count} projets."
