class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def edit
    @note = current_note
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    @note = current_note
    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def current_note
    @note = Note.find params[:id]
  end
end
