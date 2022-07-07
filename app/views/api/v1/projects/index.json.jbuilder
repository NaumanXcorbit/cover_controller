json.array! @projects  do |project|
  json.id project.id
  json.name project.name
  json.about project.about
end