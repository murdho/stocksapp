class StocksController < ApplicationController

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])

    bundle = @stock.price * @stock.quantity
    percent = @stock.percent
    year = @stock.years + 1
    y = 0
    @calc = Hash.new
    year.times do
      @calc[y] = bundle
      bundle = bundle + bundle * percent
      y += 1
    end
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(params[:stock])
    


    if @stock.save
      value = (@stock.price * @stock.quantity)*((1+@stock.percent)**@stock.years)
      @stock.value = value.round(2)
      @stock.save
      redirect_to @stock, notice: "Stock successfully added."
    else
      render action: "new"
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update_attributes(params[:stock])
      value = (@stock.price * @stock.quantity)*((1+@stock.percent)**@stock.years)
      @stock.value = value.round(2)
      @stock.save
      redirect_to @stock, notice: "Stock successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to stocks_path, notice: "Stock successfully deleted."
  end

  def calculation
    @stock = Stock.find(params[:id])

    bundle = @stock.price * @stock.quantity
    percent = @stock.percent
    year = @stock.years + 1
    y = 0
    @calc = Hash.new
    year.times do
      @calc[y] = bundle
      bundle = bundle + bundle * percent
      y += 1
    end
  end
end
