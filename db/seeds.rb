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
User.destroy_all
User.create!(email: "aline@test.com", password: "password")




# require "marcel"

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


#  customers["Parole Citoyenne"],
Project.create!(
  customer: customers["Parole Citoyenne"],
  title: "Conférence Débat Vladimir FEDEROVSKI",
  description: "Avec des partenaires de la scène Lilloise, Parole Citoyenne organise une conférence
    qui accueille un ancien diplomate russo-ukrainien, Vladimir FEDEROVSKI.",
  constraint: "temps limité (moins de 2 semaines).",
  implementation: "Refonte du logo de Parole Citoyenne
    Création d'un mini site pour présenter l'invité
    Création de visuels
    Mise en place de la communication de l'événement"
)

Project.create!(
  customer: customers["Parole Citoyenne"],
  title: "Refonte de site internet",
  description: "Mise au goût du jour d’un site inactif depuis 2016.",
  url: "https://parolecitoyenne.eu/"
)

Project.create!(
  customer: customers["Parole Citoyenne"],
  title: "Conférence Débat Olivier LLUANSI,",
  description: "Communication visuelle pour un débat sur la réindustrialisation avec Olivier Lluansi, expert en politique industrielle."
)

# Ni Sawa
Project.create!(
  customer: customers["Ni Sawa"],
  title: "Lancement Hôtel Bar Restaurant",
  description: "Création de l’identité visuelle pour l’ouverture de l’Hôtel Bar Restaurant Ni Sawa, signifiant 'Ça va aller' en swahili.",
  constraint: "Créer un visuel voyant avec des couleurs vives et mettre en avant les valeurs de la marque : Espoir, Loyauté, Courage.",
  implementation: "Création de logo
    Création d'affiches
    Création de panneaux
    Création de 2 visuels à imprimer sur tee-shirts (promotion commerciale et tenues des employés)
    Recréation des symboles pour les moduler
    Conception de 2 motifs papier peint mettant en avant les symboles de la marque"
)

# Braids_Maria
Project.create!(
  customer: customers["Braids_Maria"],
  title: "Logo et Vidéo Événementielle",
  description: "Refonte du logo et création d’une vidéo à partir des posts Instagram pour diffusion sur un stand événementiel."
)

# Sookee
Project.create!(
  customer: customers["Sookee"],
  title: "Stratégie de lancement et communication - plateforme de mis en relation",
  description: "Service de mise en relation entre coiffeurs (sookistes) et coiffés (sookés), spécialisé dans la coiffure à domicile pour cheveux texturés.",
  constraint: "Créer une vidéo et des posts Instagram impactants.",
  implementation: "Création d’une vidéo de lancement pour le futur site internet
    Conception de 2 posts Instagram pour redynamiser la communication"
)

# Maison ADGÉ
Project.create!(
  customer: customers["Maison ADGÉ"],
  title: "Refonte de site e-commerce",
  description: "Projet de refonte pour une créatrice de mode spécialisée dans les pyjamas et kimonos en wax. Le site, créé sur Wix il y a 2 ans, n’était pas visible sur Google.",
  constraint: "Optimiser un site déjà existant, le rendre ergonomique et améliorer sa visibilité sur Google.",
  implementation: "Création d’une charte graphique
    Refonte complète du site avec optimisation SEO
    Mise en place d’outils de gestion
    Accompagnement client
    Création d’icônes personnalisées"
)

# Al_ine
Project.create!(
  customer: customers["Al_ine"],
  title: "Refonte du PortfoliAl",
  description: "Refonte du PortfoliAl initialement créé sur Wix dans un souci de temps.
    Création d’une charte graphique et d’un personal branding.
    Refonte entièrement codée sur Ruby on Rails.
    Site entièrement personnalisé à l’image du client."
)

# Mais oui, Bien sûr !
Project.create!(
  customer: customers["Mais oui, Bien sûr !"],
  title: "Jeu interactif sur Figma",
  description: "Jeu interactif entièrement créé sur Figma.
    Le projet est né d’une volonté de développer mes connaissances sur Figma.
    Grâce à des flows optimisés, j’ai pu créer un jeu qui donne l’illusion d’une véritable application alors qu’il ne s’agit que d’une maquette."
)

# OLOME
Project.create!(
  customer: customers["olome"],
  title: "Refonte complète du site olome",
  description: "Refonte complète du site olome, une solution SaaS au service des entreprises industrielles, conçue pour garantir la continuité numérique et la traçabilité des données.
    L’audit technique et éditorial a mis en lumière la coexistence de plusieurs versions du site générant de nombreuses pages orphelines.
    J’ai reconstruit le site sur Hubspot avec du HTML, CSS et JavaScript pour dépasser les limites de la plateforme.
    J’ai rédigé l’ensemble des contenus en collaboration avec les équipes Sales et CSM.
    J’ai posé les bases du référencement naturel (balises, arborescence, cohérence éditoriale) pour améliorer la visibilité du site.
    Une version anglaise était en cours de finalisation à la clôture du projet."
)

# BuzzIt
Project.create!(
  customer: customers["Buzz It"],
  title: "Application de buzz – maquette",
  description: "Dans le cadre d’une soirée blind test, j’ai eu l’idée de créer une application de buzzers pour rendre le jeu plus interactif et dynamique.
    J’ai conçu une maquette complète sur Figma, en combinant des éléments créés sur Canva, pour proposer une interface simple et utilisable sur mobile.
    Le design est coloré, ludique et pensé pour un usage collectif.
    Cette maquette servait de base à un futur développement de l’application, qui n’a pas été codée par la suite.
    Ce projet illustre ma capacité à transformer un besoin concret en prototype fonctionnel, avec une attention particulière portée à l’UX et à la cohérence visuelle."
)

puts "Je me suis enrichie en contribuant à ces #{Project.count} projets."

tag_names = [
  "Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator",
    "Premier Pro", "Canva", "Figma", "Identité de marque", "HTML", "CSS", "JavaScript",
    "Ruby on Rails", "Réseaux sociaux", "Vidéo", "After Effect", "Webflow", "Logo", "Mockup",
    "Bannière", "Flocage", "Photoshop", "Panneau", "Formation", "Accompagnement", "Affiche",
    "WordPress", "Communication", "Événementiel", "UI/UX", "IA", "Automatisation", "Firefly",
    "Media.io", "Voice maker.in", "Musicscreen", "Firefly", "Refonte", "Contenu éditorial",
    "1.fr", "Ubersuggest", "AnswerThePublic", "Google search console", "Screaming Frog",
    "Collaboration Sales", "CSM"
]

tag_names.each { |name| Tag.find_or_create_by(name: name) }

project_tags_map = {
  "Refonte du PortfoliAl" => ["Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator", "Premier Pro", "Canva", "Figma", "Identité de marque", "HTML", "CSS", "JavaScript", "Ruby on Rails"],
  "Refonte de site e-commerce" => ["Charte graphique", "Référencement", "SEO", "UX/UI", "Site internet", "Wix", "Illustrator", "Premier Pro", "Canva", "Figma", "Identité de marque"],
  "Stratégie de lancement et communication - plateforme de mis en relation" => ["Réseaux sociaux", "Vidéo", "Premier Pro", "Illustrator", "After Effect", "Canva", "Webflow", "Site internet"],
  "Logo et Vidéo Événementielle" => ["Communication", "Vidéo", "Premier Pro", "Illustrator", "Logo", "Accompagnement", "Canva"],
  "Lancement Hôtel Bar Restaurant" => ["Premier Pro", "Mockup", "Bannière", "Photoshop", "Flocage", "Logo", "Vidéo", "Panneau", "Formation", "Accompagnement", "Affiche"],
  "Refonte de site internet" => ["Site internet", "Communication", "Logo", "Canva", "WordPress", "Figma", "Événementiel", "Formation", "Accompagnement", "Référencement", "SEO", "UI/UX"],
  "Jeu interactif sur Figma" => ["Maquette", "Figma", "Logo", "Charte graphique", "Canva", "Illustrator", "Media.io", "Voice maker.in", "Musicscreen", "Firefly" ],
  "Refonte complète du site olome" => ["Refonte", "Hubspot", "Site internet", "JavaScript", "HTML", "CSS", "SEO", "Contenu éditorial", "Canva", "1.fr", "Ubersuggest", "AnswerThePublic", "Google search console", "Screaming Frog", "Collaboration Sales", "CSM", "UI/UX"],
  "Application de buzz – maquette" => ["Maquette", "Figma", "Canva", "Charte graphique", "UX/UI", "Design UX"]
}

project_tags_map.each do |project_title, value|
  project = Project.find_by(title: project_title)

  tags = value.map { |name| Tag.find_or_create_by(name: name) }
  project.tags = tags
end

puts "J'ai'#{Tag.count} tags."

# icons
Icon.destroy_all

icons = [
  "AfterEffect", "Asana", "Canva", "CSS", "Figma", "html",
  "Hubspot", "Illustrator", "JavaScript", "Jira", "PhotoShop",
  "PremierPro", "Trello", "Webflow", "Wix", "WordPress"
]

icons.each do |icon_name|
  Icon.create!(
    name: icon_name
  )
end

puts "j'ai créé #{Icon.count} icônes."

# Banner

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
