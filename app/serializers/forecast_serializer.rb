class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :summary, :temperature
end
