class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create(object: Faker::Book.title, body: Faker::Movie.quote, read: false)

    if @email.save
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
        flash[:notice] = "Please try again"
      end
    end
  end

  def show
    @email = Email.find(params[:id])
    puts params
    # respond_to do  |format|
    #   format.html {redirect_to email_path}
    #   format.js { }
    # end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to emails_path
  end

  def update
    @email = Email.find(params[:id])
    @email.update(emails_params)
  end

  private

  def emails_params
    params.permit(:object, :body, :read)
  end
end
