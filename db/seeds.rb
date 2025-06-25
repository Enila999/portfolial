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
  description: "
Projet 1 Conférence Débat

Avec des partenaires de la scène Lilloise, Parole Citoyenne organise une conférence qui accueille un imminent ancien diplomate russo-ukrainien, Vladimir FEDEROVSKI.

   Refonte du Logo de Parole Citoyenne

   Création d'un mini site pour présenter l'invité ​

   Création de visuels

   Mise en place de la communication de l'événement

​​

Contrainte

Temps limité avec moins de 2 semaines pour communiquer efficacement sur l'événement.​



Projet 2 Refonte de site internet

Mettre au goût du jour un site internet qui ne l'avait pas été depuis 2016.



Projet 3 Conférence Débat

Dans le cadre d’un événement organisé par Parole Citoyenne sur la réindustrialisation en France, j’ai été en charge de la communication visuelle. J’ai réalisé l’affiche de promotion et contribué à valoriser cet échange avec Olivier Lluansi, expert en politique industrielle.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  tags: ["Site internet", "Logo", "Canva", "WordPress", "Figma", "Communication", "Événementiel", "Formation", "Accompagnement", "Référencement", "SEO", "UI/UX"],
  logo: "Parole_Citoyenne/Logo Parole Citoyenne.png"
)
attach_media(p1, "parole_citoyenne")

p2 = Project.create!(
  customer: "Ni Sawa",
  description: "Création d'identité visuelle complète pour le lancement d’un Hôtel Bar Restaurant à Brazzaville. Logos, affiches, panneaux, tee-shirts et motifs culturels.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  tags: ["Logo", "Vidéo", "Mockup", "Bannière", "Flocage", "Photoshop", "Panneau", "Premier Pro", "Formation", "Accompagnement", "Affiche"],
  logo: "Ni Sawa/Ni Sawa-v10.png"
)
attach_media(p2, "ni_sawa", limit: 4, max_files: 6)

p3 = Project.create!(
  customer: "Braids_Maria",
  description: "Refonte du logo et création d’une vidéo événementielle à partir de posts Instagram.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  tags: ["Logo", "Vidéo", "Premier Pro", "Canva"],
  logo: "Braids_Maria/Braids_Maria.png"
)
attach_media(p3, "braids_maria")


p4 = Project.create!(
  customer: "Sookee",
  description: "Création de visuels et vidéo pour le lancement d’un service de mise en relation autour de la coiffure texturée à domicile. Création de vidéo de présentation, de plaquette, de posts instagram. Stratégie de lancement.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  tags: ["Réseaux sociaux", "Vidéo", "Premier Pro", "Illustrator", "After Effect", "Canva", "Webflow", "Site internet"],
  logo: "Sookee/Logo Sookee SF.png"
)
attach_media(p4, "sookee")

p5 = Project.create!(
  customer: "Maison ADGÉ",
  description: "Refonte du site e-commerce, optimisation SEO, conseil client, et création d’une charte graphique pour une marque de kimonos et pyjamas en wax.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  tags: ["Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator", "Premier Pro", "Canva", "Figma", "Identité de marque"] ,
  logo: "Maison_ADGE/Logo Maison ADGE.png"
)
attach_media(p5, "maison_adge")

p6 = Project.create!(
  customer: "Al_ine",
  description: "Refonte du PortfoliAl créé initialement sur Wix dans un soucis de temps. Création de Charte graphique avec un personnal branding. Refonte entièrement codée sur Ruby on Rails. Site entièrement personnalisé à l'image du client.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  tags: ["Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator", "Premier Pro", "Canva", "Figma", "Identité de marque", "HTML", "CSS", "JavaScript", "Ruby on Rails"],
  logo: "Al_ine/Al_ine Logo.png"
)
attach_media(p6, "Al_ine")

puts "Je me suis enrichie en contribuant à ces #{Project.count} projets."

# ** icons **
Icon.destroy_all

icons = [
  "AfterEffect", "Asana", "Canva", "CSS", "Figma", "html",
  "Hubspot", "Illustrator", "JavaScript", "Jira", "PhotoShop",
  "PremierPro", "Trello", "Webflow", "Wix", "WordPress"
]

icons.each do |icon_name|
  Icon.create!(
    name: icon_name,
    image: "#{icon_name}.png"
  )
end

puts "j'ai créé #{Icon.count} icônes."

# ** Banner **

Banner.destroy_all

all_texts = ["Figma", "Adobe", "CMS", "Site", "Maquette", "Réseaux Sociaux"].shuffle
image_file = "Pattern.png"

items = []

# Texte pour ligne 1 (col: 1, 3, 5)
line1_texts = all_texts.first(3)
# Texte pour ligne 2 (col: 2, 4, 6)
line2_texts = all_texts.last(3)

(1..6).each do |col|
  if col.odd?
    items << { row: 1, col: col, content_type: "text", value: line1_texts.shift }
  else
    items << { row: 1, col: col, content_type: "image", value: image_file }
  end
end

(1..6).each do |col|
  if col.odd?
    items << { row: 2, col: col, content_type: "image", value: image_file }
  else
    items << { row: 2, col: col, content_type: "text", value: line2_texts.shift }
  end
end

# Enregistrement en base
items.each_with_index do |item, index|
  Banner.create!(
    content_type: item[:content_type],
    value: item[:value],
    position: index,
    row: item[:row],
    col: item[:col]
  )
end


puts "J'ai créé ma banner."
