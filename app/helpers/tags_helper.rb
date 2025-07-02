module TagsHelper
  def category_tags_map
    {
      "figma" => [
        "Figma", "Canva", "Mockup", "UX/UI", "Charte graphique",
        "Maquette", "Identité de marque"
      ],

      "adobe" => [
        "Photoshop", "Illustrator", "After Effect", "Premier Pro",
        "Firefly", "Media.io", "Voice maker.in", "Musicscreen"
      ],

      "cms" => [
        "WordPress", "Wix", "Webflow"
      ],

      "site" => [
        "HTML", "CSS", "JavaScript", "Ruby on Rails", "Site internet",
        "Refonte", "Google search console", "Screaming Frog",
        "1.fr", "Ubersuggest", "AnswerThePublic", "Contenu éditorial"
      ],

      "maquette" => [
        "Affiche", "Bannière", "Panneau", "Flocage", "Logo",
        "IA", "Automatisation", "Collaboration Sales", "CSM"
      ],

      "réseaux sociaux" => [
        "Réseaux sociaux", "Communication", "Vidéo", "SEO",
        "Référencement", "Accompagnement"
      ]
    }
  end

  def format_tag_name(name)
    name.split(/[\s\/]/).map(&:capitalize).join(" ")
  end
end
