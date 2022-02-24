class Api::V1::ItemsController < Api::V1::GraphitiController
  def index
    items = ItemResource.all(params)
    respond_with(items)
  end

  def show
    item = ItemResource.find(params)
    respond_with(item)
  end

  def create
    item = ItemResource.build(params)

    if item.save
      render jsonapi: item, status: :created
    else
      render jsonapi_errors: item
    end
  end

  def update
    item = ItemResource.find(params)

    if item.update_attributes
      render jsonapi: item
    else
      render jsonapi_errors: item
    end
  end

  def destroy
    item = ItemResource.find(params)

    if item.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: item
    end
  end
end
