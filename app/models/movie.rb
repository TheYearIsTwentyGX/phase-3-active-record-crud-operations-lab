class Movie < ActiveRecord::Base
    def self.first_movie
        Movie.first
    end

    def self.last_movie
        Movie.last
    end

    def self.movie_count
        Movie.count
    end

    def self.find_movie_with_id(id)
        Movie.find(id)
    end

    def self.find_movie_with_attributes(title: nil, release_date: nil, director: nil, lead: nil, in_theaters: nil)
        Movie.find_by(title: title, release_date: release_date, director: director, lead: lead, in_theaters: in_theaters)
    end

    def self.find_movies_after_2002
        Movie.where("release_date > 2002")
    end

    def self.find_all_movies_by_year(year)
        Movie.where(year: year)
    end

    def self.create_with_title(title)
        Movie.create(title: title)
    end

    def update_with_attributes(title: nil, release_date: nil, director: nil, lead: nil, in_theaters: nil)
        if (title != nil)
            self.title = title
        end
        if (release_date != nil)
            self.release_date = release_date
        end
        if (director != nil)
            self.director = director
        end
        if (lead != nil)
            self.lead = lead
        end
        if (in_theaters != nil)
            self.in_theaters = in_theaters
        end
        self.save
    end

    def self.update_all_titles(title)
        Movie.all.each do |movie|
            movie.title = title
            movie.save
        end
    end
    
    def self.delete_by_id(id)
        Movie.find(id).destroy
    end

    def self.delete_all_movies
        Movie.all.each do |movie|
            movie.destroy
        end
    end
end