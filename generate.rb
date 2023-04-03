#!/usr/bin/env ruby
# Distribution:
# 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
steps = 20
base_prompt = 'base prompt'
list_of_prompts = [
  'prompt'
]

def loop_through_steps(base_prompt, start_prompt, end_prompt, steps)
  (0...steps).map do |i|
    "#{base_prompt} BREAK #{Array.new(19 - i, start_prompt) + Array.new(i + 1, end_prompt)}"
  end
end

prompts = list_of_prompts.each_cons(2).flat_map do |start_prompt, end_prompt|
  loop_through_steps(base_prompt, start_prompt, end_prompt, steps)
end

File.write('prompts.txt', prompts.join("\n"))
