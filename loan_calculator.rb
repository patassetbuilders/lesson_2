# this program calculates the loan amount.

# inputs
# the loan amount $
# annual percentage rate apr%
# loan duration years or months

# monthly interest rate $ amount
# loan duration in years

require 'pry'

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

def loan_duration_to_months(ym) #input is years.months
  (ym.to_i * 12) + ((ym.to_f - ym.to_i) * 100)
end

def mir(annual_interest_rate) #number 4.5 
  annual_interest_rate.to_f / 100 / 12
end

# Calculating the fixed monthly payment
# P = L[c(1 + c)n]/[(1 + c)n - 1]

def fixed_monthly_payment(amount, months, ir )
  amount*( ir * ( 1 + ir ) **months )/(( 1 + ir )**months - 1 )
end

prompt('This calculator helps you calculate loan repayments')

loan_amount = 0
prompt('Enter the loan amount')
loop do
  loan_amount = Kernel.gets().chomp()
  #look at removing , eg 45,000 = 45000
  if valid_number?(loan_amount)
    loan_amount = loan_amount.to_f
    prompt("Loan amount is #{loan_amount} dollars")
    break
  else
    prompt('That does not look like a number, enter the loan amount')
  end
end

annual_interest_rate = 0.0
monthly_interest_rate = 0.0
prompt('Enter the annual interest rate percent, eg enter 4.5 for 4.5%')
loop do
  annual_interest_rate = Kernel.gets().chomp()
  if valid_number?(annual_interest_rate)
    prompt("The annual interest rate is #{annual_interest_rate}%")
    monthly_interest_rate = mir(annual_interest_rate)
    break
  else
    prompt('Than does not look like a valid  interest rate')
  end
end
operator_prompt = <<-MSG
 Enter the loan duration in years.months 
       12.0 for 12 years
       12.04 for 12 years and 4 months
       0.60 for 60 months
 MSG
load_duration = 0
loan_duration_months = 0
prompt(operator_prompt)
loop do
  loan_duration = Kernel.gets().chomp()
  if valid_number?(loan_duration)
    loan_duration_months = loan_duration_to_months(loan_duration)
    prompt("Loan duration is #{loan_duration_months} months")
    break
  else
    prompt('That does not look like a valid loan duration')
  end
end

repayments = fixed_monthly_payment(loan_amount,
 loan_duration_months, monthly_interest_rate)
prompt("Repayment amount is #{repayments.to_i} per month")
 