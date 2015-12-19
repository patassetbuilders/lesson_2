# ask the user for two numbers
# ask the user for the operator to perform
# perform the operation on the two numbers
# output the result
require 'pry'
require 'yaml'

LANGUAGE = 'es'  
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(p)
  Kernel.puts(" => #{p}")
end



def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

first_number = ''
second_number = ''
operator = ''

prompt(messages('welcome'))

name = ''
loop do
  prompt(messages('enter_name'))
  name = Kernel.gets().chomp()
  if 
    name.empty?()
  else
    break
  end  
end

loop do #main loop
  
  loop do
    prompt(messages('first_number'))
    first_number = Kernel.gets().chomp()
    break if valid_number?(first_number) 
    prompt(messages('error_message1'))
  end
  
  loop do
    prompt(messages('second_number'))
    second_number = Kernel.gets().chomp()
    break if valid_number?(second_number)
    prompt(messages('error_message1'))
  end
  
  operator_prompt = <<-MSG
   Enter the type of operation you wish to perform?
     1)  Add
     2)  Substract
     3)  Multiply
     4)  Divide
   MSG
  prompt(operator_prompt)
  
  loop do
    operator = Kernel.gets().chomp()
    break if %w( 1 2 3 4 ).include?(operator)
    prompt(MESSAGES['operator_error'])
  end
  
  answer = 0
  case operator
  when '1'
    answer = first_number.to_i() + second_number.to_i()
  when '2'
    answer = first_number.to_i() - second_number.to_i()
  when '3'
    answer = first_number.to_i() * second_number.to_i()
  when '4'
    answer = first_number.to_f() / second_number.to_f()
  end
  Kernel.puts("Answer is #{answer}")

  prompt('Thank you for using Calculator, do you want to continue (Y to continue)')   
  continue = gets().chomp().downcase   
  break unless continue.start_with?('y') 
  
end
  
prompt("Bye #{name.upcase}, thank you for using Calculator, please tell your friends")