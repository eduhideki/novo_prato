require 'test_helper'

class QualificacoesControllerTest < ActionController::TestCase
  setup do
    @qualificacao = qualificacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qualificacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qualificacao" do
    assert_difference('Qualificacao.count') do
      post :create, :qualificacao => @qualificacao.attributes
    end

    assert_redirected_to qualificacao_path(assigns(:qualificacao))
  end

  test "should show qualificacao" do
    get :show, :id => @qualificacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @qualificacao.to_param
    assert_response :success
  end

  test "should update qualificacao" do
    put :update, :id => @qualificacao.to_param, :qualificacao => @qualificacao.attributes
    assert_redirected_to qualificacao_path(assigns(:qualificacao))
  end

  test "should destroy qualificacao" do
    assert_difference('Qualificacao.count', -1) do
      delete :destroy, :id => @qualificacao.to_param
    end

    assert_redirected_to qualificacoes_path
  end
end
