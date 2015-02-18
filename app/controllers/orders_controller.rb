class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :get_customer

  def get_customer
    @customer = Customer.find(params[:customer_id]);
  end

  # GET /customers/1/orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /customers/1/orders/1
  # GET /customers/1/orders/1.json
  def show
  end

  # GET /customers/1/orders/new
  def new
    @order = @customer.orders.new
  end

  # GET /customers/1/orders/1/edit
  def edit
  end

  # POST /customers/1/orders
  # POST /customers/1/orders.json
  def create
    @order = @customer.orders.new

    respond_to do |format|
      if @order.save
        format.html { redirect_to [@customer, @order], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: [@customer, @order] }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1/orders/1
  # PATCH/PUT /customers/1/orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to [@customer, @order], notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: [@customer, @order] }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1/orders/1
  # DELETE /customers/1/orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to customer_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Customer.find(params[:customer_id]).orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id)
    end
end
