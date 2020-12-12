class GeocacheObjectsController < ApplicationController

    def create 
        geocache_object_params = params.require(:geocache_object).permit(:name, :coordinate)
        GeocacheObject.create(geocache_object_params)
    end
end
