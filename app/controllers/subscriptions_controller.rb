class SubscriptionsController < ApplicationController
  before_action :authenticate_user
  before_action :set_subscription, only: %i[show update destroy] # add update_image when we get to avatar

  def index
    subscriptions = current_user.subscriptions # chain method with this .with_attached_image when we get to image
    subscriptions_category = subscriptions.map do |subscription|
      subscription_hash = subscription.attributes
      subscription_hash[:category] = subscription.category.name
      subscription_hash
      # subscription.category.name
    end
    
    render json: { 
      subscriptions: subscriptions_category,
      current_user: current_user.email
      }
    # generate_image_urls(bookmarks)
  end

  def show
    render json: @subscription
  end

  def create
    subscription = current_user.subscriptions.create(subscription_params)
    # if subscription_params[:image]
    render json: { subscription: subscription }, status: :created
    # else
      # render json: { bookmark: bookmark, image: '' }, status: :created
    # end
  end

  def update
    @subscription.update(subscription_params)
    render json: 'subscription updated', status: :ok
  end

  def destroy
    @subscription.destroy
    render json: 'subscription deleted', status: :ok
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :payment_amount, :payment_date) # :image 
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # def generate_image_urls(bookmarks)
  #   bookmarks.map do |bookmark|
  #     if bookmark.image.attached?
  #       bookmark.attributes.merge(image: url_for(bookmark.image))
  #     else
  #       bookmark
  #     end
  #   end
  # end


end
