class ActorsController < ApplicationController

  def create
    # params hash looks like this:
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}

    a = Actor.new
    a.name = params.fetch("actor_name")
    a.dob = params.fetch("actor_dob")
    a.bio = params.fetch("actor_bio")
    a.image = params.fetch("actor_image")
    a.created_at = DateTime.current
    a.updated_at = DateTime.current

    a.save

    redirect_to("/actors")

    # Retrieve the user's inputs from params
    # Create a record in the movie table
    # Populate each column with the user input
    # Save

    # Redirect the user back to the /movies URL
  end

  def index
    render({ :template => "actor_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Actor.where({ :id => the_id })

    @the_actor = matching_records.at(0)

    render({ :template => "actor_templates/details" })
  end
end
