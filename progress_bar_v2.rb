# Progress bar v2
# Updating survey functionality
#   convert answers array data into new array
#   print both arrays into table
#   paint numbers into colors based on number if
# Improve progress bar functionality
# Display answers array in table format



# terminal-table class
require 'terminal-table'
# paint class
require 'paint'


# class for the Progress_bar
# What does it do? What does it need?

class Progress_bar
  def initialize(title, total_actions) # what does it need
    @title = title
    @current_actions = 1.to_i
    @total_actions = total_actions.to_i
  end
  attr_accessor :title, :current_actions, :total_actions

end

# Begin Survey class
class Survey
  def initialize(questions, instructions) # what does it need
    @questions  = questions
    @instructions = instructions
  end
  attr_accessor :questions, :instructions

# method to ask survey questions
  def run_survey(progress_bar)
    answers = [] # setting answers variable into array
    converted_answers =[] # setting array for converted numbers

    #reference questions .each looks over entire array
    #increment current step for every question in array
    @questions.each do |question| # |signular of what is in array|
      system("clear") # clears out what was in there before
        # print progress bar, survey title: current questions / total questions
        puts "#{progress_bar.title}"
        puts
        puts "You are on question #{progress_bar.current_actions}/#{questions.length}"
        puts
        puts "#{instructions}"
        puts
        puts question # singular of questions , ask user question in array
        puts
        answer = gets.chomp.to_i # store answer from question
        #if answer.is_a?(Integer) # error check
        # input values for Celcius
          if answer >= 30 # setting criteria to paint value, if value greater or equal to 30
          answers << Paint[answer, :red, :bold] # paint answer value bold red and input into answers array
          else
            answers << Paint[answer, :green] # any other value paint green
          end
          # input values for Fahrenheit
          converted_answer = answer * 1.8 + 32 # convert answer value to Fahrenheit put in new variable
          if converted_answer >= 85 # if value greater than or equal 85
            converted_answers << Paint[converted_answer.to_i, :red, :bold] # if true paint bold red
          else
            converted_answers << Paint[converted_answer.to_i, :green] # any other value paint green
          end # end of if
        #  else # error check
        #puts "oops" #error check
   end


        #increment current_action for each answered question
        progress_bar.current_actions = progress_bar.current_actions + 1
    end # end do for @questions

    puts "#" * 43
    puts
    puts Paint["Thanks for taking the survey. Here are your results.", :bold]
    puts
      answers.each do |answer|
      #  puts answer # print each answer from array individually
  #    if answer >= 85
  #      converted_answers << Paint[answer, :red]
  #    else
  #      converted_answers << answer
  #    end
    end # end do
      #puts answers.inspect
      #puts converted_answers.inspect



    # begin table
    # array for 7 days of the week
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    # combine arrays into 2d array
    rows = [days, answers, converted_answers].transpose
      #answers.each do |answer|
      # rows << [answer]
    #  end
    #  converted_answers.each do |converted_answer|
    #  rows << [converted_answer]
    #  end


    table = Terminal::Table.new :title => Paint[progress_bar.title, :blue], :headings => ['Day','Temp C', 'Temp F'], :rows => rows
    table.style = {:all_separators => true}

    puts Paint[table]

end # end run_survey


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

# begin instructions strings
survey_instructions = "Please enter the temperature in celcius."



# create survey and pass questions array into args
survey_1 = Survey.new(questions_list, survey_instructions)
# create progress par object and pass in survey data
progress_bar_1 = Progress_bar.new("Was it Hot or Not? I meant the weather!", 7)



survey_1.run_survey(progress_bar_1)
