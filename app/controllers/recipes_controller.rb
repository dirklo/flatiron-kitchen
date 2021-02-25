class RecipesController < ApplicationController
    def show
        @recipe = Recipe.find(params[:id])
    end
    
    def new
        @recipe = Recipe.new
    end

    def create
        r = Recipe.new(recipe_params)
        if r.save
            redirect_to r
        else
            render 'recipes/new'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        r = Recipe.update(recipe_params)[0]
        if r.save
            redirect_to r
        else
            render 'recipes/edit'
        end
    end

    private
        def recipe_params
            params.require(:recipe).permit(:name, :ingredient_ids => [])
        end
end