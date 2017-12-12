orig = $LOADED_FEATURES.dup
p load './load_me.rb'
p $LOADED_FEATURES - orig
p require './load_me'
