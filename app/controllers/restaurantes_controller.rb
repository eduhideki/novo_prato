

class RestaurantesController < ApplicationController

  respond_to :html, :xml, :json

  def index
    @restaurantes = Restaurante.order("nome").paginate :page => params['page'], :per_page=>3, :total_entries => 10
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
