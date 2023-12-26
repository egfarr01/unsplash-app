class PhotosController < ApplicationController
  def index
    spooky_terms = ["terror", "nightmare", "dread", "panic", "haunt", "petrify", "apparition", "specter", "poltergeist", "ghoul", "demon", "devil", "grim", "darkness", "shadow", "eerie", "sinister", "mysterious", "macabre", "gruesome", "morbid", "ghastly", "ominous", "creepy", "spine-chilling", "bloodcurdling", "haunting", "menacing", "threatening", "chilling", "horrifying", "disturbing", "frightening", "terrifying", "spooky"]
    random_spooky_term = spooky_terms.sample

    @photos = Unsplash::Photo.search(random_spooky_term, 1, 12).map do |photo|
      {
        url: photo.urls.small,
        credit: photo.user.name,
        credit_url: photo.user.links.html
      }
    end
  end
end
