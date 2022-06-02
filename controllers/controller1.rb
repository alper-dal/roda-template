# frozen_string_literal: true

class App
  hash_branch('items') do |r|
    r.get do
      { data: Model1.all }
    end

    r.post do
      Model1.insert
      response.status = 201
      { message: 'Item is created.' }
    end
  end
end
