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

ProjectTag.destroy_all
Tag.destroy_all
Project.destroy_all
Customer.destroy_all

customers = {
  "Parole Citoyenne" => Customer.create!(name: "Parole Citoyenne"),
  "Ni Sawa" => Customer.create!(name: "Ni Sawa"),
  "Braids_Maria" => Customer.create!(name: "Braids_Maria"),
  "Sookee" => Customer.create!(name: "Sookee"),
  "Maison ADGÉ" => Customer.create!(name: "Maison ADGÉ"),
  "Al_ine" => Customer.create!(name: "Al_ine"),
  "Mais oui, Bien sûr !" => Customer.create!(name: "Mais oui, Bien sûr !"),
  "olome" => Customer.create!(name: "olome"),
  "Buzz It" => Customer.create!(name: "Buzz It")
}


p1 = Project.create!(
  customer: Customer.find_by!(name:"Parole Citoyenne"),
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
  logo: "Parole_Citoyenne/Logo Parole Citoyenne.png"
)
attach_media(p1, "parole_citoyenne")

p2 = Project.create!(
  customer: Customer.find_by!(name: "Ni Sawa"),
  description: "Création d'identité visuelle complète pour le lancement d’un Hôtel Bar Restaurant à Brazzaville. Logos, affiches, panneaux, tee-shirts et motifs culturels.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "Ni Sawa/Ni Sawa-v10.png"
)
attach_media(p2, "ni_sawa", limit: 4, max_files: 6)

p3 = Project.create!(
  customer: Customer.find_by!(name: "Braids_Maria"),
  description: "Refonte du logo et création d’une vidéo événementielle à partir de posts Instagram.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "Braids_Maria/Braids_Maria.png"
)
attach_media(p3, "braids_maria")


p4 = Project.create!(
  customer: Customer.find_by!(name: "Sookee"),
  description: "Création de visuels et vidéo pour le lancement d’un service de mise en relation autour de la coiffure texturée à domicile. Création de vidéo de présentation, de plaquette, de posts instagram. Stratégie de lancement.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "Sookee/Logo Sookee SF.png"
)
attach_media(p4, "sookee")

p5 = Project.create!(
  customer: Customer.find_by!(name: "Maison ADGÉ"),
  description: "Refonte du site e-commerce, optimisation SEO, conseil client, et création d’une charte graphique pour une marque de kimonos et pyjamas en wax.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "Maison_ADGE/Logo Maison ADGE.png"
)
attach_media(p5, "maison_adge")

p6 = Project.create!(
  customer: Customer.find_by!(name: "Al_ine"),
  description: "Refonte du PortfoliAl créé initialement sur Wix dans un soucis de temps. Création de Charte graphique avec un personnal branding. Refonte entièrement codée sur Ruby on Rails. Site entièrement personnalisé à l'image du client.",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "Al_ine/Al_ine Logo.png"
)
attach_media(p6, "Al_ine")

p7 = Project.create!(
  customer: Customer.find_by!(name: "Mais oui, Bien sûr !"),
  description: "Jeu interactif entièrement créé sur Figma. Le projet est né d'une volonté de développer mes connaissances sur Figma. Et pourquoi pas un Jeu ? Grâce à des flow optimisé, j'ai pu créer un jeu qui donne l'illusion d'avoir créer d'une application alors qu'ile ne s'agit que d'une maquette.
  <a href='https://www.figma.com/proto/98HOISywEbnlnRSgMdENlf/Mais-oui--Bien-s%C3%BBr--?node-id=365-4257&p=f&t=kLMYlKVXDNbiNaNG-1&scaling=scale-down&content-scaling=fixed&page-id=121%3A10662&starting-point-node-id=365%3A4257' class='discover-button-clair' target='_blank'>Jouer</a>",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "MOBS/MOBS!.png"
)
attach_media(p7, "MOBS")

p8 = Project.create!(
  customer: Customer.find_by!(name: "olome"),
  description: "J’ai mené la refonte complète du site olome, une solution SaaS au service des entreprises industrielles, conçue pour garantir la continuité numérique et assurer la traçabilité des données.<br><br>
  J’ai commencé par un audit technique et éditorial qui a mis en lumière la coexistence de plusieurs versions du site, générant un grand nombre de pages orphelines. J’ai ensuite reconstruit entièrement le site sur Hubspot, tout en intégrant du HTML, du CSS et du JavaScript pour dépasser les limites de la plateforme.<br><br>
  J’ai rédigé l’intégralité des contenus, en étroite collaboration avec les équipes Sales et CSM, afin d’assurer un discours clair, précis et fidèle aux enjeux métier. J’ai commencé à structurer les bases du référencement naturel (balises, arborescence, cohérence éditoriale) pour améliorer la visibilité du site. Une version anglaise était en cours de finalisation au moment de la fin de mission.<br><br>
  <a href='https://www.olome.io/fr-fr' class='discover-button-clair' target='_blank'>Voir le site</a>",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "olome/Logo olome.png"
)

attach_media(p8, "olome")

p9 = Project.create!(
  customer: Customer.find_by!(name: "Buzz It"),
  description: "Dans le cadre d'une soirée blind test, j'ai eu l'idée de créer une application de buzzers pour rendre le jeu plus interactif et dynamique. Pour cela, j’ai conçu une maquette complète sur Figma, en combinant des éléments créés sur Canva. L’objectif : proposer une interface simple, accessible sur mobile, permettant aux participants de « buzzer » en temps réel.<br><br>
  J’ai travaillé sur l’ergonomie de l’interface pour assurer une utilisation intuitive, avec un design coloré et ludique adapté à un usage en groupe. Cette maquette devait servir de base à un développement ultérieur de l’application, mais elle n’a finalement pas été codée.<br><br>
  Ce projet reste une belle démonstration de ma capacité à transformer un besoin concret en prototype fonctionnel, avec une attention portée à l'expérience utilisateur et à la cohérence visuelle.<br><br>
  <a href='https://alinegl218.wixsite.com/portfolial' class='discover-button-clair' target='_blank'>Voir la maquette</a>",
  url_media: "https://alinegl218.wixsite.com/portfolial",
  logo: "Buzz_it/Buzz it.png"
)

attach_media(p9, "buzit")

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
  "Braids_Maria" => ["Logo", "Vidéo", "Premier Pro", "Canva"],
  "Ni Sawa" => ["Logo", "Vidéo", "Mockup", "Bannière", "Flocage", "Photoshop", "Panneau", "Premier Pro", "Formation", "Accompagnement", "Affiche"],
  "Parole Citoyenne" => ["Site internet", "Logo", "Canva", "WordPress", "Figma", "Communication", "Événementiel", "Formation", "Accompagnement", "Référencement", "SEO", "UI/UX"],
  "Mais oui, Bien sûr !" => ["Maquette", "Figma", "Logo", "Charte graphique", "Canva", "Illustrator", "Media.io", "Voice maker.in", "Musicscreen", "Firefly" ],
  "olome" => ["Refonte", "Hubspot", "Site internet", "JavaScript", "HTML", "CSS", "SEO", "Contenu éditorial", "Canva", "1.fr", "Ubersuggest", "AnswerThePublic", "Google search console", "Screaming Frog", "Collaboration Sales", "CSM", "UI/UX"],
  "Buzz It" => ["Maquette", "Figma", "Canva", "UX", "UI", "Design UX"]
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
