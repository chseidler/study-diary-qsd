
require 'mysql2'

@db = Mysql2::Client.new(:host      => "localhost",
                         :username  => "qsd",
                         :password  => "qsd",
                         :database  => "study_diary")

def insert_item
    puts "\nTítulo do item a ser estudado:"
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
    @db.query("INSERT INTO studies (title, description, category)
                            values ('#{titulo}', '#{descricao}', '#{nome_categoria}') ")
    puts "\nEstudo #{titulo.upcase} cadastrado na Categoria #{nome_categoria} com sucesso!"
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def all_items
    a_i = @db.query("SELECT * FROM studies WHERE active = 1 ORDER BY category ASC").each do |row|
        puts "\n#{row['category']}: #{row['title']} - #{row['description']}"
    end
    if a_i.count < 1
        puts "\nNenhum item cadastrado."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def search_items
    puts "\nPesquise um item:"
    pesquisa = gets.chomp
    s_i = @db.query("SELECT * FROM studies WHERE active = 1 AND title LIKE '%#{pesquisa}%' OR description LIKE '%#{pesquisa}%' ORDER BY category ASC").each do |row|
        puts "\n#{row['category']}: #{row['title']} - #{row['description']}"
    end
    if s_i.count < 1
        puts "\nNenhum item encontrado."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def list_category
    puts "\nQual a categoria que deseja listar todos itens?\n\n[1] JAVA \n[2] RUBY \n[3] PYTHON\n[4] OUTRO"
    selecionar3 = gets.chomp.to_i
    case selecionar3
    when 1
        nome_categoria = "JAVA"
    when 2
        nome_categoria = "RUBY"
    when 3
        nome_categoria = "PYTHON"
    else
        nome_categoria = "OUTRO"
    end
    l_c = @db.query("SELECT * FROM studies WHERE category = '#{nome_categoria}' ORDER BY category ASC").each do |row|
        puts "\n#{row['category']}: #{row['title']} - #{row['description']}"
    end
    if l_c.count < 1
        puts "\nNenhum item encontrado nesta categoria."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def check_item
    c_i = @db.query("SELECT * FROM studies WHERE active = 1 ORDER BY category ASC").each do |row|
        puts "[ID - #{row['id']}] - #{row['category']}: #{row['title']} - #{row['description']}"
    end
    puts "Digite o ID do item que deseja marcar como conluído:"
    concluir = gets.chomp.to_i
    puts "Tem certeza que deseja marcar o item [ID - #{concluir}] como concluído? \n[1] SIM \n[2] NÃO"
    confirmar = gets.chomp.to_i
    if confirmar == 1
        @db.query("UPDATE studies SET active = 0 WHERE id = #{concluir}")
        puts "Item concluído com sucesso."
    else
        puts "Item mantido."
    end
    if c_i.count < 1
        puts "\nNenhum item para ser concluído."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def checked_items
    c_is = @db.query("SELECT * FROM studies WHERE active = 0 ORDER BY category ASC").each do |row|
        puts "\n#{row['category']}: #{row['title']} - #{row['description']}"
    end
    if c_is.count < 1
        puts "\nNenhum item concluído."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end

def del_item
    d_i = @db.query("SELECT * FROM studies ORDER BY category ASC").each do |row|
        puts "[ID - #{row['id']}] - #{row['category']}: #{row['title']} - #{row['description']}"
    end
    puts "Digite o ID do item que deseja deletar:"
    deletar = gets.chomp.to_i
    puts "Tem certeza que deseja deletar o item [ID - #{deletar}] ? \n[1] SIM \n[2] NÃO"
    confirmar = gets.chomp.to_i
    if confirmar == 1
        @db.query("DELETE FROM studies WHERE id = #{deletar}")
        puts "Item deletado com sucesso."
    else
        puts "Item mantido."
    end
    if d_i.count < 1
        puts "\nNenhum item para ser deletado."
    end
    puts "\nTecle ENTER para voltar ao menu principal."
    gets
    menu
end
