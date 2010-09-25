module ApplicationHelper

  def teste
    "testeree"
    "<a href='laal'>teste lalal</a>"
  end

  def menu_principal
    menu = %w(cliente qualificacao restaurante)
    menu_principal = "<ul>"
    
    menu.each do |item|
      menu_principal << "<li>" + link_to(item, :controller  => item.pluralize) + "</li>"
    end
    
    menu_principal << "</ul>"
    raw menu_principal
  end

  def valor_formatado(number)
    number_to_currency(number, :unit => "R$", :separator => ",", :delimiter => ".")  
  end

def comentarios(comentavel)
  comentarios = "<div id='comentarios'>"
  comentarios << "<h3>Comentarios</h3>"
  comentarios << render(:partial => "comentarios/comentario",
                        :collection => comentavel.comentarios)
  comentarios << "</div>"
  raw comentarios
end


end
