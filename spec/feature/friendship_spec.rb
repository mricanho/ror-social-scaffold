require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  before :each do
    @user_one = User.create(name: 'user1', email: 'user1@mail.com', password: '123456')
    @user_two = User.create(name: 'user2', email: 'user2@mail.com', password: '123456')
    @user_three = User.create(name: 'user3', email: 'user3@mail.com', password: '123456')
    @friendship = Friendship.create(user_id: @user_three.id, friend_id: @user_one.id, status: nil)
  end

  it 'accepts friendship from another user' do
    visit user_session_path
    fill_in 'user[email]', with: @user_one.email
    fill_in 'user[password]', with: @user_one.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_on 'All users'
    expect(page).to have_content('Name: user3')
    click_button 'Accept Friendship'
    expect(page).to have_content('Friendship has been accepted')
  end

  it 'deletes friendship request from another user' do
    visit user_session_path
    fill_in 'user[email]', with: @user_one.email
    fill_in 'user[password]', with: @user_one.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_on 'All users'
    expect(page).to have_content('Name: user3')
    click_button 'Reject Friendship'
    expect(page).to have_content('Friendship has been rejected')
  end
end
