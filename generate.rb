#!/usr/bin/env ruby
# Distribution:
# 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
base_prompt = 'base prompt'
list_of_prompts = [
  'prompt'
]

steps = 20

def loop_through_steps(base_prompt, start_prompt, end_prompt, steps)
  prompts = []

  (0...steps).each do |i|
    p = Array.new(19 - i, start_prompt) + Array.new(i + 1, end_prompt)
    prompts << "#{base_prompt} BREAK #{p.join(' BREAK ')}"
  end

  prompts
end

prompts = []
list_of_prompts.each_with_index do |prompt, index|
  if index < list_of_prompts.length - 1
    prompts << loop_through_steps(base_prompt, prompt, list_of_prompts[index + 1], steps)
  end
end

prompts.flatten!

File.open('prompts.txt', 'w') do |f|
  prompts.each do |p|
    f.puts p
  end
end
