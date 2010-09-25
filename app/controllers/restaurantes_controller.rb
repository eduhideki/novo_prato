require 'hpricot'
require 'open-uri'

class RestaurantesController < ApplicationController

  respond_to :html, :xml, :json

  def index
   # @restaurantes = Restaurante.order("nome").paginate :page => params['page'], :per_page=>3, :total_entries => 10

   @restaurantes = WillPaginate::Collection.create(params[:page], 3) do |pager|
  result = Restaurante.find(:all, :limit => pager.per_page, :offset => pager.offset)
  # inject the result array into the paginated collection:
  pager.replace(result)

  unless pager.total_entries
    # the pager didn't manage to guess the total count, do it manually
    pager.total_entries = Restaurante.count
  end


doc= Hpricot(open('http://twitter.com/paulo_caelum'))
@items = doc / ".hentry .entry-content"

end
    respond_with @restaurantes
  end
  
  def show
    @restaurante = Restaurante.find(params[:id])
  end
  
  def new
    @restaurante = Restaurante.new
  end
  
  def create
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save
      flash[:notice] = "Cadastro OK!"
      flash[:bla] = "Cadastro BLA!"
      redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "new"
    end
  end
  
  def edit
    @restaurante = Restaurante.find(params[:id])
  end
  
  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes(params[:restaurante])
      redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "new"
    end
  end

  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    redirect_to(:action => "index")
  end

  def italiana
    @restaurantes = Restaurante.where(:especialidade => "italiana")
    render :action => "index"
  end
  def por_especialidade
    @restaurantes = Restaurante.where(:especialidade => params[:especialidade])
    render :action => "index"
  end
  
end
