# frozen_string_literal: true

puts 'Seeding...'
Role.create(
  [
    { name: 'admin' },
    { name: 'donator' },
    { name: 'viewer' },
    { name: 'creator' }
  ]
)
puts 'Roles has been created'

Permission.create(
  {
    role_id: Role.find_by(name: 'admin').id,
    can_index_contributions: true,
    can_see_contribution: true,
    can_delete_contribution: false,
    can_create_contribution: true,
    can_index_goals: true,
    can_see_goal: true,
    can_update_goal: true,
    can_delete_goal: true,
    can_create_goal: true
  }
)
puts 'Permission for admin has been created'

Permission.create(
  {
    role_id: Role.find_by(name: 'creator').id,
    can_index_contributions: true,
    can_see_contribution: true,
    can_delete_contribution: true,
    can_create_contribution: true,
    can_index_goals: true,
    can_see_goal: true,
    can_update_goal: true,
    can_delete_goal: true,
    can_create_goal: true
  }
)
puts 'Permission for creator has been created'

Permission.create(
  {
    role_id: Role.find_by(name: 'donator').id,
    can_index_contributions: false,
    can_see_contribution: false,
    can_delete_contribution: false,
    can_create_contribution: true,
    can_index_goals: false,
    can_see_goal: true,
    can_update_goal: false,
    can_delete_goal: false,
    can_create_goal: false
  }
)
puts 'Permission for donator has been created'

Permission.create(
  {
    role_id: Role.find_by(name: 'viewer').id,
    can_index_contributions: false,
    can_see_contribution: false,
    can_delete_contribution: false,
    can_create_contribution: true,
    can_index_goals: false,
    can_see_goal: true,
    can_update_goal: false,
    can_delete_goal: false,
    can_create_goal: false
  }
)
puts 'Permission for viewer has been created'
