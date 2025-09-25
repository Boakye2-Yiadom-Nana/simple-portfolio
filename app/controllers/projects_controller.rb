class ProjectsController < ApplicationController
  def index
    
     @projects = [
      {
        id: 1,
        name: "Todo App",
        description: "My first Rails CRUD application",
        tech_stack: ["Rails", "SQLite", "HTML/CSS"],
        status: "Completed"
      },
      {
        id: 2,
        name: "Personal Blog",
        description: "Learning associations and comments",
        tech_stack: ["Rails 8", "Turbo", "Stimulus"],
        status: "In Progress"
      },
      {
        id: 3,
        name: "Portfolio Site",
        description: "This very site I'm building!",
        tech_stack: ["Rails 8", "VS Code", "Ubuntu"],
        status: "In Progress"
      }
    ]

  end

  def show
    @project_id = params[:id]
    @project = @projects.find { |p| p[:id] == @project_id.to_i}
  end
 def projects
    [
      {
        id: 1,
        name: "Todo App",
        description: "My first Rails CRUD application",
        tech_stack: ["Rails", "SQLite", "HTML/CSS"],
        status: "Completed"
      },
      {
        id: 2,
        name: "Personal Blog", 
        description: "Learning associations and comments",
        tech_stack: ["Rails 8", "Turbo", "Stimulus"],
        status: "In Progress"
      },
      {
        id: 3,
        name: "Portfolio Site",
        description: "This very site I'm building!",
        tech_stack: ["Rails 8", "VS Code", "Ubuntu"],
        status: "In Progress"
      }
    ]
  end 

end
