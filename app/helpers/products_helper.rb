module ProductsHelper

def large image
    image.variant(resize: 'x600>').processed
end

def card image
    image.variant(combine_options: { resize: '300x300^', extent: '300x300', gravity: 'center' }).processed
end


def thumb image
    image.variant(combine_options: { resize: '150x150^', extent: '150x150', gravity: 'center' }).processed
end

def tiny image
    image.variant(combine_options: { resize: '50x50^', extent: '50x50', gravity: 'center' }).processed
end

end
