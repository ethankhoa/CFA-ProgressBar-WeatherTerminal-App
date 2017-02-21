# Progress bar

# incrementally update

# class for the Progress_bar
# What does it do? What does it need?
#

class Progress_bar
  def initialize(title) # what does it need
    @title = title
    @current_actions = 1
    # commenting below out because not needed yet
    #@actions_remaining = @total_actions - @current_actions
  end
  attr_accessor :title, :current_actions

  def count_remaining # count how many remaining out of total
    puts "Progress #{@current_actions}/#{@total_actions}"
  end

  def percent_remaining # percentage of how many remaining out of total
    # needs to percent format
    puts "Progress #{@current_actions/@total_actions*100}"
  end

  def action_complete
    @current_actions = @current_actions + 1
  end

end

######### Begin Survey class
class Survey
  def initialize(questions) # what does it need
    @questions  = questions
  end
  attr_accessor :questions

# method to ask survey questions
  def run_survey(progress_bar)
    answers = [] # setting answers variable into array
    #reference questions .each looks over entire array
    # increment current step for every question in array
    @questions.each do |question| # |signular of what is in array|
      system("clear") # clears out what was in there before
        # print progress bar, survey title: current questions / total questions
        puts "#{progress_bar.title}: #{progress_bar.current_actions}/#{questions.length}"
        puts question # singular of questions , ask user question in array
        answer = gets.chomp # store answer from question
        answers << answer # add answer into the end of the answers array
        #increment current_action for each answered question
        progress_bar.current_actions = progress_bar.current_actions + 1
    end


    puts "Thanks for taking the weather survey. Here are your answers below."
      answers.each do |answer|
        puts answer # print each answer from array individually
      end
    end

end # end of Survey class

######## Begin Questions class # COMMENTING OUT TIL LATER

#class Questions
#  def initialize(question_no, question)
#    @question_no = question_no
#    @question = question
#    @answer = answer
#  end
#  attr_accessor :question_no :question :answer
#end
######## End Questions class # COMMENTING OUT TIL LATER


# begin questions list
questions_list = [ # array for questions
  "What was the temperature on Sunday?",
  "What was the temperature on Monday?",
  "What was the temperature on Tuesday?",
  "What was the temperature on Wednesday?",
  "What was the temperature on Thursday?",
  "What was the temperature on Friday?",
  "What was the temperature on Saturday?"
]
# end questions list


# create survey and pass questions array into args
survey_1 = Survey.new(questions_list)
# create progress par object and pass in survey data
progress_bar_1 = Progress_bar.new("Was it Hot or Not? I mean the weather!")



survey_1.run_survey(progress_bar_1)
