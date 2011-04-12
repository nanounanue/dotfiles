## Tomado desde http://dancingpenguinsoflight.com/2009/07/improved-irb-configuration/

IRB_START_TIME = Time.now

# Imprimit a formato  yaml con "y"
require 'yaml'
# Permite cargar gems
require 'rubygems' rescue nil
# Tab completion
require 'irb/completion'
# Save irb sessions to history file
require 'irb/ext/save-history'


# For coloration
require 'wirble'

# For tables
require 'hirb'

# awesome_print
require 'ap'

# Incluye números de línea y niveles de indentación
IRB.conf[:PROMPT][:SHORT] = {
  :PROMPT_C=>"%03n:%i* ",
  :RETURN=>"%s\n",
  :PROMPT_I=>"%03n:%i> ",
  :PROMPT_N=>"%03n:%i> ",
  :PROMPT_S=>"%03n:%i%l "
}

IRB.conf[:PROMPT_MODE] = :SHORT
# Agrega funcionalidad de readline
IRB.conf[:USE_READLINE] = true
# Auto indentación
IRB.conf[:AUTO_INDENT] = true
# Dónde se guarda la historia
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
# Cuántas líneas a guardar
IRB.conf[:SAVE_HISTORY] = 1000

# Colorear
Wirble.init(:skip_prompt => true, :skip_history => true)
Wirble.colorize

# Cargar hirb
Hirb::View.enable

# Facilidad de Benchmark
# Basado en  => http://pastie.org/179534
def quick(repetitions=100, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
    b.report {repetitions.times &block}
  end
  nil
end

# Regresa únicamente los métodos no presentes en los objetos básicos 
class Object
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

if ENV.include?('RAILS_ENV')
   if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
  
  if ENV['RAILS_ENV'] == 'test'
    require 'test/test_helper'
  end

# for rails 3
elsif defined?(Rails) && !Rails.env.nil?
  if Rails.logger
    Rails.logger =Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
  if Rails.env == 'test'
    require 'test/test_helper'
  end
else
  # nothing to do
end

# annotate column names of an AR model
def show(obj)
  y(obj.send("column_names"))
end

puts "> all systems are go wirble/hirb/ap/show <"







