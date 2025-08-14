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
  base_path = Rails.root.join("app","assets", "images",folder)
  images=Dir.glob("#{base_path}/*")
  images.push(Dir.glob("#{base_path}/**/*")) if Dir.exist?("#{base_path}/**")
  images.sort.each do |file_path|
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

# Project.find_each do |proj|
#   attach_media(proj, proj.customer.name)
# end

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
  io:           File.open(Rails.root.join("app", "assets", "images", "Parole_Citoyenne","Logo Parole Citoyenne.png")),
  filename:     "Logo Parole Citoyenne.png",
  content_type: "image/png"
)
attach_media(p1, "Parole_Citoyenne")

p2 = Project.create!(
  customer:   customers["Ni Sawa"],
  description: <<~HTML
  <strong>Lancement d'un Hôtel Bar et Restaurant - Congo Brazzaville</strong><br><br>
  ​Les clients souhaitent mettre en place un Hôtel Bar Restaurant Ni Sawa qui signifie "Ca va aller" en Swahili.
  Création de logo
  Création d'affiches
  Création de panneau
  Création de 2 visuels à imprimer sur tee-shirt, l'un pour la promotion commerciale de l'événement et l'autre pour les tenues des employé.e.s.<br><br>
  Contraintes:
  Créer un visuel voyant avec des couleurs vives
  Mettre en avant les valeurs de la marque - Espoir, Loyauté, Courage -  et leurs symboles <br><br>
  Mise en œuvre:
  J'ai recréé les symboles pour pouvoir les moduler à souhait.
  J'ai créé 2 motifs de papier peint afin de mettre en avant les symboles significatifs de la marque.
  HTML
)
p2.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","Ni Sawa","Ni Sawa-v10.png")),
  filename:     "Ni Sawa-v10.png",
  content_type: "image/png"
)
attach_media(p2, "Ni Sawa")


p3 = Project.create!(
  customer:   customers["Braids_Maria"],
  description: <<~HTML
  Refonte du logo et Création d'une vidéo avec un montage des différents posts Instagram. <br>
  La vidéo devait tourner en boucle pour un stand lors d'un événement.
   HTML
)
p3.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","Braids_Maria","Braids_Maria.png")),
  filename:     "Braids_Maria.png",
  content_type: "image/png"
)
attach_media(p3, "Braids_Maria")


p4 = Project.create!(
  customer:   customers["Sookee"],
  description: <<~HTML
  ​Le client a pour projet de mettre en place un service de mise en relation entre les coiffeurs (sookistes) et les coiffés (sookés).<br>
  Sa clientèle est accès sur de la coiffure à domicile pour cheveux texturés.
  Il lui fallait des visuels impactant.
  "Sookee" signifie "Cheveux" en Lingala.<br><br>
  Contraintes:
  Créer une vidéo et des posts instagram qui se démarqueront.<br><br>
  Mise en œuvre:
  J'ai créé une vidéo pour le futur lancement du site internet qui servira également de plateforme de mise en relation.
  J'ai créé 2 posts instagram pour redynamisé le réseau social.
  HTML
)
p4.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","Sookee","Logo Sookee SF.png")),
  filename:     "Logo Sookee SF.png",
  content_type: "image/png"
)
attach_media(p4, "Sookee")

p5 = Project.create!(
  customer:   customers["Maison ADGÉ"],
  description: <<~HTML
  Refonte du site internet, SEO, UX et UI<br><br>
  ​La cliente est une créatrice de mode qui fabrique des pyjamas et des kimonos en wax.<br>
  Elle avait créé un site sur WIX il y 2 ans mais ce dernier n'était pas visible sur Google. Ni même sa marque.<br>
  J'ai été contactée pour retravailler sur l'image de marque, effectuer une refonte de site, développer le SEO et conseiller la cliente.<br><br>
  Contraintes: <br>
  Retravailler un site qui avait déjà été créé pour l'optimiser.<br>
  Rendre le site ergonomique.<br>
  Rendre le site visible sur Google par recherche de mots-clés tel que "pyjama en wax.<br>
  Mettre la marque en valeur avec le contenu envoyée par la cliente.<br><br>
  Mise en œuvre:<br>
  Création d'une Charte Graphique<br>
  Refonte de site avec avec optimisation du référencement.<br>
  Mise en place d'outils de gestions<br>
  Accompagnement client<br>
  Création de chaque icône<br>
  HTML
  )
p5.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","Maison_ADGE","Logo Maison ADGE.png")),
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
  io:           File.open(Rails.root.join("app", "assets", "images","Al_ine","Al_ine Logo.png")),
  filename:     "Al_ine Logo.png",
  content_type: "image/png"
)
attach_media(p6, "Al_ine")

p7 = Project.create!(
  customer:   customers["Mais oui, Bien sûr !"],
  description: <<~HTML
    Jeu interactif entièrement créé sur Figma. Le projet est né d'une volonté de développer mes connaissances sur Figma.<br>
    Et pourquoi pas un jeu ? Grâce à des flows optimisés, j'ai pu créer un jeu qui donne l'illusion d'une vraie application alors qu'il ne s'agit que d'une maquette.<br><br>
    <a href="https://www.figma.com/proto/…"
       class="discover-button-clair" target="_blank">Jouer</a>
  HTML
)
p7.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","MOBS","MOBS!.png")),
  filename:     "MOBS!.png",
  content_type: "image/png"
)
attach_media(p7, "MOBS")

p8 = Project.create!(
  customer:   customers["olome"],
  description: <<~HTML
    J’ai mené la refonte complète du site olome, une solution SaaS au service des entreprises industrielles,<br>
    conçue pour garantir la continuité numérique et assurer la traçabilité des données.<br><br>
    J’ai commencé par un audit technique et éditorial qui a mis en lumière la coexistence de plusieurs versions du site, générant un grand nombre de pages orphelines.
    J’ai ensuite reconstruit entièrement le site sur Hubspot, tout en intégrant du HTML, du CSS et du JavaScript pour dépasser les limites de la plateforme.<br><br>
    J’ai rédigé l’intégralité des contenus, en étroite collaboration avec les équipes Sales et CSM, afin d’assurer
    un discours clair, précis et fidèle aux enjeux métier.<br><br>
    J’ai commencé à structurer les bases du référencement naturel<br>
    (balises, arborescence, cohérence éditoriale) pour améliorer la visibilité du site. Une version anglaise était en cours de finalisation au moment de la fin de mission.<br><br>
    <a href="https://www.olome.io/fr-fr" class="discover-button-clair" target="_blank">Voir le site</a>
  HTML
)
p8.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","olome","Logo olome.png")),
  filename:     "Logo olome.png",
  content_type: "image/png"
)
attach_media(p8, "olome")

p9 = Project.create!(
  customer:   customers["Buzz It"],
  description: <<~HTML
    Dans le cadre d'une soirée blind test, j'ai eu l'idée de créer une application de buzzers<br>
    pour rendre le jeu plus interactif et dynamique. Pour cela, j’ai conçu une maquette complète sur Figma,
    en combinant des éléments créés sur Canva. L’objectif : proposer une interface simple, accessible sur mobile, permettant aux participants de « buzzer » en temps réel.<br><br>
    J’ai travaillé sur l’ergonomie de l’interface pour assurer une utilisation intuitive, avec un design coloré et ludique, adapté à un usage en groupe.<br>
    Cette maquette sert de base à un développement de l’application qui est en cours.<br><br>
     Ce projet reste une démonstration de ma capacité à transformer un besoin concret en prototype fonctionnel,
     avec une attention portée à l'expérience utilisateur et à la cohérence visuelle.<br><br>
    <a href="https://alinegl218.wixsite.com/portfolial"
       class="discover-button-clair" target="_blank">Voir la maquette</a>
  HTML
)
p9.logo.attach(
  io:           File.open(Rails.root.join("app", "assets", "images","Buzz_it","Buzz it.png")),
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
