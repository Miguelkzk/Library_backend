class ClientsController < ApplicationController
  before_action :set_client, only: %i[show update destroy]
  def index
    render json: Client.all
  end

  def show
    render json: @client
  end

  def create
    client = Client.new(client_params)
    if client.save
      render json: client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @client.destroy
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end
  def search_client
    card_id = params[:card_id]

    if card_id.present?
      client = Client.find_by(card_id: card_id)

      if client.present?
        render json: client
      else
        render json: nil, status: :ok
      end
    else
      render json: nil, status: :ok
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.permit(:card_id, :name, :lastname, :email, :phone)
  end
end
