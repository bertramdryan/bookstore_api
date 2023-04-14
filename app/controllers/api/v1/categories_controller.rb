module Api
    module V1
        class CategoriesController < ApplicationController
            before_action :set_category, only: :destroy

            def index
                @categories = Category.all
                render json: CategoriesRepresenter.new(@categories).as_json
            end

            def create
                @category = Category.create(category_params)

                if @category.save
                    render json: CategoryRepresenter.new(@category).as_json status: :created
                end
            end

            private

            def category_params
                params.permit(:name)
            end

            def set_category
                @category = Category.find(params[:id])
            end
        end
    end
end
