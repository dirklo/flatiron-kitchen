class IngredientsController < ApplicationController
    def show
        @ingredient = Ingredient.find(params[:id])
    end
    
    def new
        @ingredient = Ingredient.new
    end

    def create
        i = Ingredient.new(ingredient_params)
        if i.save
            redirect_to i
        else
            render 'ingredients/new'
        end
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        i = Ingredient.update(ingredient_params)[0]
        if i.save
            redirect_to i
        else
            render 'ingredients/edit'
        end
    end

    private
        def ingredient_params
            params.require(:ingredient).permit(:name)
        end
end