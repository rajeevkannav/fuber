if @journey and @journey.completed?
  json.(@journey, :id, :start_point_x, :start_point_y, :starts_at, :end_point_x, :end_point_y, :ends_at, :created_at, :updated_at)
  json.cost do
    json.total @journey.cost
  end
else
  json.message 'No cab available, please try later.'
end
