if @journey and @journey.cab
  json.(@journey, :id, :start_point_x, :start_point_y, :starts_at, :end_point_x, :end_point_y, :ends_at, :created_at, :updated_at)
  json.cab @journey.cab, :id, :position_x, :position_y, :kind, :created_at, :updated_at
else
  json.message 'No cab available, please try later.'
end
