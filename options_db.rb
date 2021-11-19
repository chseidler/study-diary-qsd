
require 'mysql2'

@db = Mysql2::Client.new(:host      => "localhost",
                         :username  => "qsd",
                         :password  => "qsd",
                         :database  => "study_diary")

def insert_item
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
        when 2
            nome_categoria = "RUBY"
        when 3
            nome_categoria = "PYTHON"
        else
            nome_categoria = "OUTRO"
        end
    @db.query("insert into studies (title, description, category)
                            values ('#{titulo}', '#{descricao}', '#{nome_categoria}') ")
    puts "\nEstudo #{titulo.upcase} cadastrado na Categoria #{nome_categoria} com sucesso!"
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def all_items
    rs = @db.query("select * from studies").each do |row|
        puts "#{row["category"]}: #{row["title"]}"
    end
    if rs.count < 1
        puts "\nNenhum item cadastrado."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def search_itens
    puts "A implementar! Tecle ENTER para voltar ao menu principal."
    gets
    menu
end

def list_category
    puts "A implementar! Tecle ENTER para voltar ao menu principal."
    gets
    menu
end

def check_item
    puts "A implementar! Tecle ENTER para voltar ao menu principal."
    gets
    menu
end

def checked_items
    puts "A implementar! Tecle ENTER para voltar ao menu principal."
    gets
    menu
end

def del_item
    puts "A implementar! Tecle ENTER para voltar ao menu principal."
    gets
    menu
end