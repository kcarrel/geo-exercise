class ItemsController < ApplicationController
    
    def index 
        itemsArr = Item.all.where(geocache_object_id: params[:geocache_object_id])
        @items = itemsArr.select { |item| item.active? == true }
        if @items.count > 0 
            render json: @items 
        else 
            render json: { error: 'The queried Geocache Object does not contain active objects.'}, status: 400
        end
    end

    def create 
        item_params = params.require(:item).permit(:name, :geocache_object_id, :active_at, :inactive_at)
        @item = Item.create(item_params)
        if @item.valid?
            render json: @item
        else 
            render json: { error: 'Failed to create item' }, status: 400
        end
    end

    def update 
        item_params = params.require(:item).permit(:geocache_object_id)
        @item = Item.find(params[:id])
        geocache_object = GeocacheObject.find(item_params[:geocache_object_id])
        if geocache_object.items.count >= 3 
            render json: { error: 'Failed to update. A Geocache Object cannot contain 3 or more items.' }, status: 400 
        else 
            @item.update(item_params)
            render json: @item
        end
    end

end
