class StudyItem
    attr_accessor :titulo, :descricao
    def initialize(titulo, descricao)
        @titulo = titulo
        @descricao = descricao
    end  
end

class Category
    attr_accessor :categorias, :nome
    def initialize(nome)
        @nome = nome
        @categorias = []
    end

    def adicionar_cat(studyitem)
        categorias << studyitem
    end   
end


@java = Category.new('Java')
@ruby = Category.new("Ruby")
@python = Category.new("Python")
@outro = Category.new("Outro")

def cadastrar_item
    puts "\nTitulo do item a ser estudado:"
    titulo = gets.chomp
    puts "\nDeseja adicionar uma descrição? \n[1] SIM \n[2] NÃO"
    selecionar = gets.chomp.to_i
        if selecionar == 1
            puts "\nDigite a descrição:"
            descricao = gets.chomp
        else
            descricao = ""
        end 
    puts "\nQual a categoria do seu objeto de estudo?\n\n[1] JAVA \n[2] RUBY \n[3] PYTHON\n[4] OUTRO"
    selecionar2 = gets.chomp.to_i
        case selecionar2
        when 1
            nome_categoria = "JAVA"
            @java.adicionar_cat(StudyItem.new(titulo, descricao))
        when 2
            nome_categoria = "RUBY"
            @ruby.adicionar_cat(StudyItem.new(titulo, descricao))
        when 3
            nome_categoria = "PYTHON"
            @python.adicionar_cat(StudyItem.new(titulo, descricao))
        else
            nome_categoria = "OUTRO"
            @outro.adicionar_cat(StudyItem.new(titulo, descricao))
        end
    puts "\nEstudo #{titulo.upcase} cadastrado na Categoria #{nome_categoria} com sucesso!"
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def ver_itens
    if @java.categorias.length == 0 and @ruby.categorias.length == 0 and @python.categorias.length == 0 and @outro.categorias.length == 0
        puts "\nNenhum item cadastrado."
    else
        puts "\nTodos os itens cadastrados:"
        @java.categorias.each { |element| puts "JAVA: #{element.titulo}" }
        @ruby.categorias.each { |element| puts "RUBY: #{element.titulo}" }
        @python.categorias.each { |element| puts "PYTHON: #{element.titulo}" }
        @outro.categorias.each { |element| puts "OUTRO: #{element.titulo}" } 
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def buscar_itens
    if @java.categorias.length == 0 and @ruby.categorias.length == 0 and @python.categorias.length == 0 and @outro.categorias.length == 0
        puts "\nNenhum item cadastrado para pesquisar."
    else    
        puts "\nPesquise um item:"
        pesquisa = gets.chomp
        pesq_java = @java.categorias.each do |element|
            if element.titulo.downcase.include? pesquisa.downcase then puts "JAVA: #{element.titulo}" end
        end
        pesq_ruby = @ruby.categorias.each do |element|
            if element.titulo.downcase.include? pesquisa.downcase then puts "RUBY: #{element.titulo}" end
        end
        pesq_python = @python.categorias.each do |element|
            if element.titulo.downcase.include? pesquisa.downcase then puts "PYTHON: #{element.titulo}" end
        end
        pesq_outro = @outro.categorias.each do |element|
            if element.titulo.downcase.include? pesquisa.downcase then puts "OUTRO: #{element.titulo}" end
        end
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

