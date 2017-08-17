#= require active_admin/base

$(document).ready -> 
  $('#user_confirmed_at').change ->
    state = $(this).prop "checked"

    if confirm('Are you sure you want to update this record')
      $(this).prop 'checked', state
    else
      $(this).prop 'checked', !state
  return
