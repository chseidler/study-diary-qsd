
require_relative "./options_db.rb"

def menu
    loop do
        
        puts <<~MENU
        
        ---------------------------------------\\\\
        [1] Cadastrar um item para estudar      |
        [2] Ver todos os itens cadastrados      |
        [3] Buscar um item de estudo            |
        [4] Listar por categoria                |
        [5] Marcar um item como concluído       |
        [6] Itens concluídos                    |
        [7] Apagar um item                      |
        [8] Sair                                |
        Escolha uma opção:                      |
        ---------------------------------------//
        MENU

        opcao = gets.chomp.to_i

        case opcao
        when 1
            insert_item
        when 2
            all_items
        when 3
            search_items
        when 4
            list_category
        when 5
            check_item
        when 6
            checked_items
        when 7
            del_item
        when 8
            @db.close
            exit
        else
            puts "\nOpção inválida, tecle ENTER para voltar ao menu principal."
            gets
        end
    end
end


menu

