class DiaryController < ApplicationController
  def index
    @pupils = Pupil.all.order(:lastname, :name)
  end


  def view
    @pupils = Pupil.all.order(:lastname, :name)
  end

  def addgrade
    puts
  end

  def subjects
     @subjects = Subject.all
  end
end
