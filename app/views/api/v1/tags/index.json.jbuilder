json.styles do
    json.array! @tags do |tag|
        json.name tag
    end
end