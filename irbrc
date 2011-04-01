## Tomado desde http://dancingpenguinsoflight.com/2009/07/improved-irb-configuration/

IRB_START_TIME = Time.now

# Imprimit a formato  yaml con "y"
require 'yaml'
# Pretty printing
require 'pp'
# Permite cargar gems
require 'rubygems'
# Tab completion
require 'irb/completion'
# Save irb sessions to history file
require 'irb/ext/save-history'


# For coloration
require 'wirble'

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

# Facilidad de Bechmark
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








