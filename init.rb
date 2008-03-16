# Copyright 2008 Frédéric de Villamil

require 'typo_related_posts'

ActionController::Base.send :include, Typorelatedposts
ActionController::Base.send :helper, Typorelatedpostshelper
