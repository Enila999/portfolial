# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

require "marcel"

ProjectTag.destroy_all
Tag.destroy_all
Project.destroy_all
Customer.destroy_all

customer_names = [
  "Parole Citoyenne",
  "Ni Sawa",
  "Braids_Maria",
  "Sookee",
  "Maison ADGÉ",
  "Al_ine",
  "Mais oui, Bien sûr !",
  "olome",
  "Buzz It"
]

customers = customer_names.map { |name| [name, Customer.create!(name: name)] }.to_h

# ─── Helper attach_media ───────────────────────────────────────────────────
def attach_media(project, folder)
  base_path = Rails.root.join("db/seeds/assets", folder)
  Dir.glob("#{base_path}/**/*").sort.each do |file_path|
    next unless File.file?(file_path)

    # Extrait le sous-dossier relatif
    rel_dir = Pathname(file_path)
                .dirname
                .relative_path_from(base_path)
                .to_s
    metadata = {}
    metadata[:subfolder] = rel_dir if rel_dir.present? && rel_dir != "."

    project.media.attach(
      io:           File.open(file_path),
      filename:     File.basename(file_path),
      content_type: Marcel::MimeType.for(Pathname.new(file_path)),
      metadata:     metadata
    )
  end
end

Project.find_each do |proj|
  attach_media(proj, proj.customer.name)
end

p1 = Project.create!(
  customer:   customers["Parole Citoyenne"],
  description: <<~HTML
    Projet 1 Conférence Débat<br>
    Avec des partenaires de la scène Lilloise, Parole Citoyenne organise une conférence
    qui accueille un ancien diplomate russo-ukrainien, Vladimir FEDEROVSKI.
    Refonte du logo de Parole Citoyenne
    Création d'un mini site pour présenter l'invité
    Création de visuels
    Mise en place de la communication de l'événement
    Contrainte : temps limité (moins de 2 semaines).<br><br>
    Projet 2 Refonte de site internet : mise au goût du jour d’un site inactif depuis 2016.<br><br>
    Projet 3 Conférence Débat : communication visuelle pour un débat sur la réindustrialisation
    avec Olivier Lluansi, expert en politique industrielle.<br>
    <a href="https://parolecitoyenne.eu/" class="discover-button-clair" target="_blank">Voir le site</a>
  HTML
)
p1.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Parole_Citoyenne", "Logo Parole Citoyenne.png")),
  filename:     "Logo Parole Citoyenne.png",
  content_type: "image/png"
)
attach_media(p1, "Parole_Citoyenne")

p2 = Project.create!(
  customer:   customers["Ni Sawa"],
  description: <<~HTML
    Création d'identité visuelle complète pour le lancement d’un Hôtel Bar Restaurant à Brazzaville.
    Logos, affiches, panneaux, tee-shirts et motifs culturels.
  HTML
)
p2.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Ni Sawa", "Ni Sawa-v10.png")),
  filename:     "Ni Sawa-v10.png",
  content_type: "image/png"
)
attach_media(p2, "Ni Sawa")


p3 = Project.create!(
  customer:   customers["Braids_Maria"],
  description: "Refonte du logo et création d’une vidéo événementielle à partir de posts Instagram."
)
p3.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Braids_Maria", "Braids_Maria.png")),
  filename:     "Braids_Maria.png",
  content_type: "image/png"
)
attach_media(p3, "Braids_Maria")


p4 = Project.create!(
  customer:   customers["Sookee"],
  description: <<~HTML
    Création de visuels et vidéo pour le lancement d’un service de mise en relation
    autour de la coiffure texturée à domicile.<br>
    Vidéo de présentation, plaquette, posts Instagram, stratégie de lancement.
  HTML
)
p4.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Sookee", "Logo Sookee SF.png")),
  filename:     "Logo Sookee SF.png",
  content_type: "image/png"
)
attach_media(p4, "Sookee")

p5 = Project.create!(
  customer:   customers["Maison ADGÉ"],
  description: "Refonte du site e-commerce, optimisation SEO, conseil client et création d’une charte graphique."
)
p5.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Maison_ADGE", "Logo Maison ADGE.png")),
  filename:     "Logo Maison ADGE.png",
  content_type: "image/png"
)
attach_media(p5, "Maison_ADGE")

p6 = Project.create!(
  customer:   customers["Al_ine"],
  description: <<~HTML
    Refonte du PortfoliAl créé initialement sur Wix dans un souci de temps.<br>
    Création de charte graphique et personal branding.<br>
    Refonte entièrement codée sur Ruby on Rails.<br>
    Site entièrement personnalisé à l'image du client.
  HTML
)
p6.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Al_ine", "Al_ine Logo.png")),
  filename:     "Al_ine Logo.png",
  content_type: "image/png"
)
attach_media(p6, "Al_ine")

p7 = Project.create!(
  customer:   customers["Mais oui, Bien sûr !"],
  description: <<~HTML
    Jeu interactif sur Figma, mimant une appli complète.<br>
    <a href="https://www.figma.com/proto/…"
       class="discover-button-clair" target="_blank">Jouer</a>
  HTML
)
p7.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "MOBS", "MOBS!.png")),
  filename:     "MOBS!.png",
  content_type: "image/png"
)
attach_media(p7, "MOBS")

p8 = Project.create!(
  customer:   customers["olome"],
  description: <<~HTML
    Refonte complète du site SaaS Olome, audit, rédaction, intégration Hubspot,
    SEO de base, version anglaise en cours.<br>
    <a href="https://www.olome.io/fr-fr" class="discover-button-clair" target="_blank">Voir le site</a>
  HTML
)
p8.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "olome", "Logo olome.png")),
  filename:     "Logo olome.png",
  content_type: "image/png"
)
attach_media(p8, "olome")

p9 = Project.create!(
  customer:   customers["Buzz It"],
  description: <<~HTML
    Maquette d’une appli de buzzer en live pour blind-test, conçue sur Figma/Canva.<br>
    <a href="https://alinegl218.wixsite.com/portfolial"
       class="discover-button-clair" target="_blank">Voir la maquette</a>
  HTML
)
p9.logo.attach(
  io:           File.open(Rails.root.join("db", "seeds", "assets", "Buzz_it", "Buzz it.png")),
  filename:     "Buzz it.png",
  content_type: "image/png"
)
attach_media(p9, "Buzz_it")

tag_names = [
  "Accompagnement", "Affiche", "After Effect", "Bannière", "Canva",
  "Charte graphique", "Communication", "CSS", "Figma", "Flocage",
  "HTML", "Identité de marque", "Illustrator", "JavaScript", "Logo",
  "Mockup", "Panneau", "Photoshop", "Premier Pro", "Référencement",
  "Réseaux sociaux", "Ruby on Rails", "SEO", "Site internet", "UX/UI",
  "Vidéo", "Webflow", "Wix", "WordPress", "IA", "Automatisation", "Firefly",
  "Media.io", "Voice maker.in", "Musicscreen", "Firefly", "Refonte",
  "Contenu éditorial", "1.fr", "Ubersuggest", "AnswerThePublic",
  "Google search console", "Screaming Frog", "Collaboration Sales", "CSM"
]

project_tags_map = {
  "Al_ine" => ["Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator", "Premier Pro", "Canva", "Figma", "Identité de marque", "HTML", "CSS", "JavaScript", "Ruby on Rails"],
  "Maison ADGÉ" => ["Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator", "Premier Pro", "Canva", "Figma", "Identité de marque"],
  "Sookee" => ["Réseaux sociaux", "Vidéo", "Premier Pro", "Illustrator", "After Effect", "Canva", "Webflow", "Site internet"],
  "Braids_Maria" => ["Communication", "Vidéo", "Premier Pro", "Illustrator", "Logo", "Accompagnement", "Canva"],
  "Ni Sawa" => ["Premier Pro", "Mockup", "Bannière", "Photoshop", "Flocage", "Logo", "Vidéo", "Panneau", "Formation", "Accompagnement", "Affiche"],
  "Parole Citoyenne" => ["Site internet", "Communication", "Logo", "Canva", "WordPress", "Figma", "Événementiel", "Formation", "Accompagnement", "Référencement", "SEO", "UI/UX"],
  "Mais oui, Bien sûr !" => ["Maquette", "Figma", "Logo", "Charte graphique", "Canva", "Illustrator", "Media.io", "Voice maker.in", "Musicscreen", "Firefly" ],
  "olome" => ["Refonte", "Hubspot", "Site internet", "JavaScript", "HTML", "CSS", "SEO", "Contenu éditorial", "Canva", "1.fr", "Ubersuggest", "AnswerThePublic", "Google search console", "Screaming Frog", "Collaboration Sales", "CSM", "UI/UX"],
  "Buzz It" => ["Maquette", "Figma", "Canva", "Charte graphique", "UX/UI", "Design UX"]
}

project_tags_map.each do |customer_name, tag_names|
  customer = Customer.find_by(name: customer_name)
  next unless customer

  customer.projects.each do |project|
    tag_names.each do |tag_name|
      normalized_name = tag_name.strip.downcase

      # Recherche ou création du tag en ignorant la casse
      tag = Tag.where('LOWER(name) = ?', normalized_name).first_or_initialize
      tag.name = tag_name.strip  # remet le nom d'origine (avec majuscules si besoin)
      tag.save! unless tag.persisted?

      project.tags << tag unless project.tags.include?(tag)
    end
  end
end


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
