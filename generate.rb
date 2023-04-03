#!/usr/bin/env ruby
distribution = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
base_prompt = 'base prompt'
list_of_prompts = [
  'first',
  'second'
]

def loop_through_steps(base_prompt, start_prompt, end_prompt, steps)
  (0...steps).map do |i|
    prompts = [base_prompt] + Array.new(steps - i - 1, start_prompt) + Array.new(i + 1, end_prompt)
    prompts.join(' BREAK ')
  end
end

prompts = list_of_prompts.each_cons(2).flat_map do |start_prompt, end_prompt|
  loop_through_steps(base_prompt, start_prompt, end_prompt, distribution.length)
end

File.write('prompts.txt', prompts.join("\n"))
