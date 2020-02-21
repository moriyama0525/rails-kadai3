class User < ApplicationRecord
    def self.import(path)
        list = []
        CSV.foreach(path, headers: true) do |row|
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }
        end
        
        begin
            User.create!(list)
        rescue ActiveModel::UnknownAttributeError =>invalid
            puts "インポートに失敗しました:#{invalid}"
        end
    end
end
