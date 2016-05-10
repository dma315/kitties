module CatsHelper

  def get_random_cats(number)
    return if Cat.count == 0
    @all_cats = Cat.limit(number).order("RANDOM()") # Make this the query below
    even_number_of_cats
  end

  def even_number_of_cats
    if @all_cats.length % 2 != 0
      @all_cats = @all_cats + @all_cats
    end
  end

end