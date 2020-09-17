class TodolistsController < ApplicationController
  
  def new
    @list = List.new # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成。
  end
  
  def create
    list = List.new(list_params) #「list_params」はプライベートメソッド。下のprivateで定義されている
     #①データを新規登録するためのインスタンス作成
    list.save
    #②データをデータベースに保存するためのsaveメソッド実行
    redirect_to todolist_path(list.id)
    #③詳細表示画面へリダイレクト
  end
  
  def index #データの一覧表示アクションの追加
    @lists = List.all #「@lists」全データ/「List.all」データベースの全データを取り出す
  end
  
  def show
    @list = List.find(params[:id])
  end
  
#privateは必ず下に書くこと/ここから下はcontrollerの中でしか呼び出せない
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
