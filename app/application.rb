require_relative '../config/environment.rb'

class Application 


    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

       
 
        if req.path.match(/items/) #returns item price if it is item else returns 400
            @@items.each do |item|
                resp.write "#{item.name}\n"
            end


            item_name = req.path.split("/items/").last
            if item = @@items.find { |item| item.name == item_name }
                resp.write item.price 
                resp.status = 200
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else #returns 404 for bad route
            resp.write  "Route not found"
            resp.status = 404
        end
        
    resp.finish
    end

end