class AnalyticsController < ApplicationController
  # GET /analytics
  # GET /analytics.json
  def index
    @analytics = Analytic.find(:all, :order => "id desc", :limit => 100)
    
    @metric = Analytic.where("method = 'RedtailRESTAPI.CRMv1.Contact_Master_Fetch'").count
    @metric1 = Analytic.where("method = 'RedtailRESTAPI.CRMv1.Activity_byUser_BasicPaged_Fetch'").count
    @metric2 = Analytic.where("method = 'RedtailRESTAPI.CRMv1.Users_ShortName_Fetch'").count
    @metric3 = Analytic.where("method = 'RedtailRESTAPI.CRMv1.Authenticate'").count
    @metric4 = Analytic.where("method = 'RedtailRESTAPI.CRMv1.User_Preference_Calendar_Fetch'").count
    @metric5 = Analytic.where("method NOT IN ('RedtailRESTAPI.CRMv1.Contact_Master_Fetch','RedtailRESTAPI.CRMv1.Activity_byUser_BasicPaged_Fetch', 'RedtailRESTAPI.CRMv1.Users_ShortName_Fetch', 'RedtailRESTAPI.CRMv1.Authenticate', 'RedtailRESTAPI.CRMv1.User_Preference_Calendar_Fetch')").count

    @metricPartner = Analytic.find_by_sql("select Count(ApiKey) as Total, APIKey from analytics group by APIKey order by Total desc Limit 1;")



   
    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @analytics }
    end
  end

  # GET /analytics/1
  # GET /analytics/1.json
  def show
    @analytic = Analytic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @analytic }
    end
  end


  # GET /analytics/new
  # GET /analytics/new.json
  def new
    @analytic = Analytic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analytic }
    end
  end

# GET /analytics/demo
  def demo
    @analytic = LazyHighCharts::HighChart.new('graph') do |f|
    f.options[:chart][:defaultSeriesType] = "area"
    f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12, 13, 5])
    f.series(:name=>'Mary', :data=>[9, 10, 13, 2, 5, 12, 4, 7, 9])

    respond_to do |format|
      format.html # demo.html.erb
      #format.json { render json: @analytic }
    end
  end
  # GET /analytics/1/edit
  def edit
    @analytic = Analytic.find(params[:id])
  end

  # POST /analytics
  # POST /analytics.json
  def create
    @analytic = Analytic.new(params[:analytic])

    respond_to do |format|
      if @analytic.save
        format.html { redirect_to @analytic, notice: 'Analytic was successfully created.' }
        format.json { render json: @analytic, status: :created, location: @analytic }
      else
        format.html { render action: "new" }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analytics/1
  # PUT /analytics/1.json
  def update
    @analytic = Analytic.find(params[:id])

    respond_to do |format|
      if @analytic.update_attributes(params[:analytic])
        format.html { redirect_to @analytic, notice: 'Analytic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analytics/1
  # DELETE /analytics/1.json
  def destroy
    @analytic = Analytic.find(params[:id])
    @analytic.destroy

    respond_to do |format|
      format.html { redirect_to analytics_url }
      format.json { head :no_content }
    end
  end
  end
end

