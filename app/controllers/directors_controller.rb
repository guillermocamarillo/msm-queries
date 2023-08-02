class DirectorsController < ApplicationController

  def create
    # params hash looks like this:
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}

    d = Director.new
    d.name = params.fetch("dir_name")
    d.dob = params.fetch("dir_dob")
    d.bio = params.fetch("dir_bio")
    d.image = params.fetch("dir_image")

    d.save

    redirect_to("/directors")

    # Retrieve the user's inputs from params
    # Create a record in the movie table
    # Populate each column with the user input
    # Save

    # Redirect the user back to the /movies URL
  end

  def destroy
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    the_director = matching_records.at(0)

    the_director.destroy

    redirect_to("/directors")
  end


  def update
    # Get the ID out of params
    d_id = params.fetch("the_id")

    # Look up the existing record
    matching_records = Director.where({ :id => d_id })
    the_director = matching_records.at(0)

    # Overwrite each column with the values from user inputs
    the_director.name = params.fetch("dir_name")
    the_director.dob = params.fetch("dir_dob")
    the_director.bio = params.fetch("dir_bio")
    the_director.image = params.fetch("dir_image")

    # Save

    the_director.save

    # Redirect to the movie details page
    redirect_to("/directors/#{the_director.id}")
  end  

  def index
    render({ :template  => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)
    render({ :template  => "director_templates/details"})
  end

  def junior
    render({ :template  => "director_templates/junior"})
  end

  def senior
    render({ :template  => "director_templates/senior"})
  end

end
