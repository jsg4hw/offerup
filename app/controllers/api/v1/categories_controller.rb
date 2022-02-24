class Api::V1::CategoriesController < Api::V1::GraphitiController
  def index
    categories = CategoryResource.all(params)
    respond_with(categories)
  end

  def show
    category = CategoryResource.find(params)
    respond_with(category)
  end

  def create
    category = CategoryResource.build(params)

    if category.save
      render jsonapi: category, status: :created
    else
      render jsonapi_errors: category
    end
  end

  def update
    category = CategoryResource.find(params)

    if category.update_attributes
      render jsonapi: category
    else
      render jsonapi_errors: category
    end
  end

  def destroy
    category = CategoryResource.find(params)

    if category.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: category
    end
  end
end
