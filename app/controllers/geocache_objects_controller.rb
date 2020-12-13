class GeocacheObjectsController < ApplicationController

    def create 
        geocache_object_params = params.require(:geocache_object).permit(:name, :coordinate)
        @geocache_object = GeocacheObject.create(geocache_object_params)
        if @geocache_object.valid? 
            render json: @geocache_object
        else 
            render json: { error: 'Failed to create geocache object' }, status: 400
        end
    end
end
