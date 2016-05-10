module CatsHelper

  def get_random_cats(number)
    return if Cat.count == 0
    @all_cats = Cat.limit(number).order("RANDOM()") # Make this the query below
    @all_cats = @all_cats + @all_cats if @all_cats.length < number # This is a dumb fix for when there are an odd number of cats < 10 total
  end

end