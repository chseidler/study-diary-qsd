require_relative "./options.rb"

def menu
    loop do
        
        puts <<~MENU
        
        ---------------------------------------\\\\
        [1] Cadastrar um item para estudar      |
        [2] Ver todos os itens cadastrados      |
        [3] Buscar um item de estudo            |
        [4] Sair                                |
        Escolha uma opção:                      |
        ---------------------------------------//
        MENU

        opcao = gets.chomp.to_i

        case opcao
        when 1
            cadastrar_item
        when 2
            ver_itens
        when 3
            buscar_itens
        when 4
            exit
        else
            puts "\nOpção inválida, tecle ENTER para voltar ao menu principal."
            gets
        end
    end
end


menu

