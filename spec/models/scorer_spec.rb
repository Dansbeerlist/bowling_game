require "spec_helper"
require File.expand_path("../../../scorer", __FILE__)
describe Scorer do
  context "given example should calculate correctly" do
    before do 
      @test_score_array = [[4,3],[10],[4,5],[1,3],[0,4],[2,5],[8,0],[9,1],[6,2],[2,3]]
      @scorer = Scorer.new(@test_score_array)
    end
    it "should store the initial bowling frames in a method called initial_data" do
      @scorer.initial_data.should eq(@test_score_array)
    end
    it 'should score the first frame correctly' do
      @scorer.score_for_frame(1).should eq(7)
    end
    it 'should recognize that the second frame is a strike' do
      @scorer.frame_type_for(2).should eq(:strike)
    end
    it "should recognize that the eighth frame is a spare" do
      @scorer.frame_type_for(8).should eq(:spare)
    end
    it "should add the score for eight correctly" do
      @scorer.score_for_frame(8).should eq(16)
    end
    it 'should score the second frame correctly' do
      @scorer.score_for_frame(2).should eq(19)
    end
    it "should have ten frames" do
      @scorer.number_of_frames.should eq(10)
    end
    it "should ensure that rspec works" do
      Scorer.rspec_works.should eq("a-okay")
    end
    it "should give us back the example output" do
      test_result = [7, 26, 35, 39, 43, 50, 58, 74, 82, 87]

      @scorer.scores.should eq(test_result)
    end
  end
  context "edge cases" do
    context "perfect score" do
      before  do
        @perfect_game = [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10,10,10]]
        @scorer = Scorer.new(@perfect_game)
      end
      it 'should calculate 30 for the first frame' do
        @scorer.score_for_frame(1).should eq(30)
      end
      it 'should calculate the total score of 300'do
        @scorer.total_score.should eq(300)
      end
    end
    context "weird combos of ending numbers" do
      before  do
        @great_game = [[10],[10],[10],[10],[10],[10],[10],[10],[8,2],[10,10,10]]
        @scorer = Scorer.new(@great_game)
      end
      it 'should calculate to a total score of 278' do
        @scorer.total_score.should eq(278)
      end
    end
  end
end