module ProductsHelper

def large image
    # image.variant(resize: 'x600>').processed
    image
end

def card image
    # image.variant(combine_options: { resize: '300x300^', extent: '300x300', gravity: 'center' }).processed
    image
end


def thumb image
    image
end

def tiny image
    image
end

end
