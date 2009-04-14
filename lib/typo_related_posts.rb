# Copyright 2008 Frédéric de Villamil
module Typorelatedposts
  def get_related_posts
    if !@article.tags.empty?
    	mylist = Array.new
    	@article.tags.each do |tag| 
    		mylist += Tag.find_by_name(tag.name).articles
    	end
      mylist.uniq
      return mylist.sort_by {rand}[0,5]
    end
  end
end

module Typorelatedpostshelper

  def render_related_posts
    tablo = @controller.get_related_posts
    
    html = '<div id="related">'
    html += '<h3>À lire également</h3>'
    html += '<p>Si cet article vous a intéressé, vous pouvez poursuivre votre lecture avec ces billets similaires :</p>'	
    html += '<ul>'
    tablo.each do |article|
      html += "<li><a href='#{this_blog.base_url}#{article.permalink}'>#{article.title}</a></li>"
    end
    html += '</ul>'
    html += '</div>'
  end
  
  def rss_related_posts
    tablo = @controller.get_related_posts
    html = '<h3>À lire également</h3>'
    html += '<ul>'
    tablo.each do |article|
      html += "<li><a href='#{this_blog.base_url}#{article.permalink}'>#{article.title}</a></li>"
    end
    html += '</ul>'
  end
  
end
