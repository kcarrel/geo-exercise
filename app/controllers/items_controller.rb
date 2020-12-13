class ItemsController < ApplicationController

    def create 
        item_params = params.require(:item).permit(:name, :geocache_object_id, :active_at, :inactive_at)
        Item.create(item_params)
    end

    def update 
        item_params = params.require(:item).permit(:geocache_object_id)
        geocache_object = GeocacheObject.find(item_params[:geocache_object_id])
        if geocache_object.items.count >= 3 
            flash.now[:messages] = "A Geocache Object cannot contain 3 or more items."
        else 
            Item.update(item_params)
        end
    end
end
