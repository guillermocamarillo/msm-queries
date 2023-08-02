Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors", {:controller => "directors", :action => "index"})

  get("/directors/youngest", { :controller => "directors", :action => "junior" })

  get("/directors/eldest", { :controller => "directors", :action => "senior" })

  get("/directors/:the_id", {:controller => "directors", :action => "show"})

  post("/insert_director", { :controller => "directors", :action => "create" })

  post("/modify_director_record/:the_id", { :controller => "directors", :action => "update" })

  get("/delete_director/:the_id", { :controller => "directors", :action => "destroy" })

  get("/movies", { :controller => "movies", :action => "index" })

  get("/movies/:the_id", { :controller => "movies", :action => "show" })

  post("/insert_movie_record", { :controller => "movies", :action => "create" })

  get("/delete_movie/:an_id", { :controller => "movies", :action => "destroy" })
  
  post("/modify_movie_record/:the_id", { :controller => "movies", :action => "update" })

  get("/actors", { :controller => "actors", :action => "index" })

  get("/actors/:the_id", { :controller => "actors", :action => "show" })

  post("/insert_actor", { :controller => "actors", :action => "create" })

  get("/delete_actor/:the_id", { :controller => "actors", :action => "destroy" })

  get("/modify_actor_record/:the_id", { :controller => "actors", :action => "update" })

end
