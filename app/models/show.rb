class Show < ActiveRecord::Base

    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        self.actors.map { |a| a.full_name }
    end

    def build_network(call_letters)
        self.network = Network.find_by(call_letters) ? Network.find_by(call_letters) : Network.create(call_letters)
    end

end