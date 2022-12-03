class PagesController < ApplicationController

  before_action :require_user

  def index

  end

  def details
  end

  def messages
    @messages = Message.all
  end

  def other
    @entry = current_user.entries.new
    @s = ["Stamping","Cerificate Attestation","Stamping & Attestation","Emigration","Tour Visa","Hotel Booking","Others"]
    @places = ["Saudi","Qatar","Kuwait","Oman","Bahrain","UAE","Singapore","Malaysia","Sri Lanka",'Canada','Nepal','Maldives','Bangladesh','Armenia','China',"India"]
  end

  def print
    # raise params.inspect
    @entry = current_user.entries.where(id: params[:id]).first
    @format = params[:format]
  end
  def print_money
    @money = current_user.moneys.where(id: params[:id]).first
    @format = params[:format]
  end
  def flight
    @places = Place.where(status: 1).all.pluck(:name)
    @val = "Flight Ticket"
    @entry = Entry.new
    @s = ["Indigo Airlines", "AIR INDIA","AirIndia Express", "Emirates", "Spice Jet", "Qatar Airways", "Air Arabia", "flydubai","Etihad","VIStaRa", "SriLankan Airlines", "British Airways","Oman Airways", "Gulf Air","Singapore Airlines","Malaysia Airlines","Saudi Airlines","Flynas","Go First","Air Asia"]
  end

  def train
    @places = Place.where(status: 2).all.pluck(:name)
    @entry = current_user.entries.new
    @val = "Train Ticket"
    @s = ["IRCTC"]
  end

  def money
    @money = current_user.moneys.new
  end

  def money_update
    en = current_user.moneys.new(money_params)
    en.bill_no = (current_user.moneys.all.count() + 1).to_s.rjust(4, '0')
    if en.save
      redirect_to print_money_path(en,en.id.to_s + en.phone)
    else
      redirect_to :back
    end
  end

  def entry_update
    en = current_user.entries.new(from: entry_params[:from], to: entry_params[:to], price: entry_params[:price],s_type: entry_params[:s_type],id_number: entry_params[:id_number], phone: entry_params[:phone], paid: entry_params[:paid], name: entry_params[:name], bill_no: (current_user.entries.all.count() + 1).to_s.rjust(4, '0') )
    if entry_params[:date]
      en.date = DateTime.parse(entry_params[:date]) - 5.hours - 30.minutes
    end
    if (entry_params[:flight1])
      en.from = entry_params[:from] + " " + entry_params[:flight1]
    end
    if (entry_params[:flight2])
      en.to = entry_params[:to] + " " + entry_params[:flight2]
    end
    if entry_params[:service_name] == "Others"
      en.service_name = entry_params[:days]
    elsif entry_params[:days]
      en.service_name = entry_params[:service_name] +" " + entry_params[:days]
    else
      en.service_name = entry_params[:service_name]
    end
    if en.save
      redirect_to print_path(en, en.id.to_s+en.phone)
    else
      redirect_to :back
    end
  end

  def search_money
    @money = current_user.moneys.where(phone: params[:phone]).last

    respond_to do |format|
      format.json {render json: @money}
    end

  end
  def reprint_ticket
    @entry = current_user.entries.where.not(s_type: nil).all
  end
  def reprint_money
    @money = current_user.moneys.all
  end
  def reprint_other
    @entry = current_user.entries.where(s_type: nil).all
  end
  def education
    @edu = current_user.educations.new
  end

  def print_edu
    @edu = current_user.educations.where(id: params[:id]).first
    @format = params[:format]
    # raise @format.inspect
  end

  def reprint_edu
    @edus = current_user.educations.all
  end
  def edu_update
    en = current_user.educations.new(edu_params)
    en.bill_no = (current_user.educations.all.count() + 1).to_s.rjust(4, '0');
    # raise en.id.to_s.inspect
    if en.save
      redirect_to print_edu_path(en,en.id.to_s + en.contact_number.to_s)
    else
      redirect_to :back
    end
  end
  private

    def entry_params
      params.require(:entry).permit(:members,:from,:to,:price,:s_type,:service_name,:id_number,:phone,:paid,:days,:flight1, :flight2 ,:date,:time,:name => [])
    end
    def money_params
      params.require(:money).permit(:from,:country,:phone,:name,:acc_no,:ifsc,:company,:aadhar_no,:pan_no,:amount,:address,:id_no,:phone)
    end

    def edu_params
      params.require(:education).permit(:name,:father_name,:address,:contact_number,:course,:college_name,:location,:payment)
    end


end
