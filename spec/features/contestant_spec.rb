require 'rails_helper'

RSpec.describe Project do
  before do
    # challenge
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    #projects
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    #contestants
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    #contestant projects
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  # User Story 2 of 3
  # (e.g.   Kentaro Kameyama
  #       Projects: Litfit, Rug Tuxedo

  #       Jay McCarroll
  #       Projects: LeatherFeather)

  describe "As a visitor," do
    describe "When I visit the contestants index page (/contestants)" do
      describe "I see a list of names of all the contestants" do
        it "And under each contestants name I see a list of the projects (names) that they've been on" do

          visit ("/contestants")

          expect(page).to have_content("Jay McCarroll")
          expect(page).to have_content("Gretchen Jones")
          expect(page).to have_content("Kentaro Kameyama")
          expect(page).to have_content("Erin Robertson")

          expect(page).to have_content("News Chic")
          expect(page).to have_content("Boardfit")
          expect(page).to have_content("Upholstery Tuxedo")
        end
      end
    end
  end
end