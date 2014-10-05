json.array!(@devices) do |device|
	json.extract! device, :id, :mac
	json.url device_url(device, format: :json)
end
