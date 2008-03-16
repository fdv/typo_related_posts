# Copyright 2008 Frédéric de Villamil
module Typorelatedposts
  def display_related_posts
    if !@article.tags.empty?
    	mylist = Array.new
    	@article.tags.each { |tag| 
    		mylist += Tag.find_by_name(tag.name).articles
    	}
    mylist.uniq
    tablo = mylist.sort_by {rand}[0,5]

    html = '<div id="related">'
    html += '<h3>À lire également</h3>'
    html += '<p>Si cet article vous a intéressé, vous pouvez poursuivre votre lecture avec ces billets similaires :</p>'	
    html += '<ul>'
    tablo.each { |article|

    html += "<li><a href='#{this_blog.base_url}#{article.permalink}'>#{article.title}</a></li>"
    }
    html += '</ul>'
    html += '</div>'
    end
  end
end

module Typorelatedpostshelper

  def render_related_posts
    @controller.display_related_posts
  end
end
