class PagesController < ApplicationController
  def home
    @current_time = Time.current
    @greeting = "Welcome to my Rails Journey!"
    @visitor_count = rand(100..500)
  end

  def about
     @skills =Skill.all.order(:name)
     @experience_years = 2
     @favorite_quote = "Code is peotry in motion"
  end

  def contact
    @email = "boakyeyiadomnana99@gmail.com"
    @social_links = {
      github: "Boakye2-Yiadom-Nana",
      linkedin: "Boakye Yiadom"
    }
    @response_time = "Usually within 24 hours"
  end
end
