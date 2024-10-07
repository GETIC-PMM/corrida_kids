class Admin::InscricoesDatatable
    delegate :params, :can?, :h, :t, :link_to, :button_to, :content_tag,
            :admin_inscricao_path,
            :edit_admin_inscricao_path, to: :@view


    def initialize(view)
        @view = view
        @remote = params[:remote] == 'true'
    end

    def as_json(_options = {})
        {
            draw: params[:draw].to_i,
            recordsTotal: total,
            recordsFiltered: inscricoes.total_count,
            data: data
        }
    end

    private
        def data
            inscricoes.each_with_index.map do |inscricao, index|
                {
                    'index' => (index + 1) + ((page - 1) * per_page),


                            'created_at' => column_created_at(inscricao),


                            'updated_at' => column_updated_at(inscricao),


                            'nome_crianca' => column_nome_crianca(inscricao),


                            'data_nascimento_crianca' => column_data_nascimento_crianca(inscricao),


                            'cpf_crianca' => column_cpf_crianca(inscricao),


                            'nome_responsavel' => column_nome_responsavel(inscricao),


                            'cpf_responsavel' => column_cpf_responsavel(inscricao),


                            'telefone_contato' => column_telefone_contato(inscricao),


                            'prova' => column_prova(inscricao),


                            'categoria' => column_categoria(inscricao),


                            'tamanho_camisa' => column_tamanho_camisa(inscricao),


                            'sub_categoria' => column_sub_categoria(inscricao),


                    'opcoes' => column_opcoes(inscricao)
                }
            end
        end




                def column_created_at(inscricao)

                        inscricao.try(:created_at).try(:to_fs)

                end


                def column_updated_at(inscricao)

                        inscricao.try(:updated_at).try(:to_fs)

                end



                def column_nome_crianca(inscricao)

                        inscricao.try(:nome_crianca)

                end


                def column_data_nascimento_crianca(inscricao)

                        inscricao.data_nascimento_crianca.try(:strftime, "%d/%m/%Y")

                end


                def column_cpf_crianca(inscricao)

                        inscricao.try(:cpf_crianca)

                end


                def column_nome_responsavel(inscricao)

                        inscricao.try(:nome_responsavel)

                end


                def column_cpf_responsavel(inscricao)

                        inscricao.try(:cpf_responsavel)

                end


                def column_telefone_contato(inscricao)

                        inscricao.try(:telefone_contato)

                end


                def column_prova(inscricao)

                        inscricao.try(:prova)

                end


                def column_categoria(inscricao)

                        inscricao.try(:categoria)

                end


                def column_tamanho_camisa(inscricao)

                        inscricao.try(:tamanho_camisa)

                end


                def column_sub_categoria(inscricao)

                        inscricao.try(:sub_categoria)

                end




        def column_opcoes(inscricao)
            opcoes = "<div class='sm-hero__datatable-actions'>"

            opcoes << (link_to(admin_inscricao_path(inscricao),
                { remote: @remote, class: 'btn btn-sm btn-primary text-white me-2', title: 'Visualizar',
                data: { toggle: 'tooltip', placement: 'top' } }) do
                content_tag(:i, '', class: 'bi bi-search') + ' Visualizar'
            end).to_s if can? :show, inscricao

            opcoes << (link_to(edit_admin_inscricao_path(inscricao),
                { remote: @remote, class: 'btn btn-sm btn-warning text-dark me-2', title: 'Editar',
                data: { toggle: 'tooltip', placement: 'top' } }) do
                content_tag(:i, '', class: 'bi bi-pencil') + ' Editar'
            end).to_s if can? :edit, inscricao

            opcoes <<  (button_to admin_inscricao_path(inscricao),
                method: :delete,
                data: { confirm: t('helpers.links.confirm_destroy', model: inscricao.model_name.human), toggle: 'tooltip', placement: 'top' },
                remote: @remote,
                class: 'btn btn-sm btn-danger text-white me-2', title: 'Remover' do
                content_tag(:i, '', class: 'bi bi-trash') + ' Remover'
            end).to_s if can? :destroy, inscricao

            opcoes <<  "</div>"


            opcoes.html_safe
        end

        def inscricoes
            @inscricoes ||= fetch
        end

        def query
            'Inscricao'
        end

        def fetch
            str_query = query
            params[:columns].each do |column|
                str_query << ".where(#{column[1][:data]}: '#{column[1][:search][:value]}')" if column[1][:search][:value].present?
            end
            str_query << '.search(params[:search][:value])' if params[:search][:value].present?
            str_query << %{.order("#{sort_column}" => "#{sort_direction}").page(page).per(per_page)}
            eval str_query
        end

        def total
            str_query = query
            str_query << '.count'
            eval str_query
        end

        def page
            params[:start].to_i / per_page + 1
        end

        def per_page
            params[:length].to_i.positive? ? params[:length].to_i : 10
        end

        def sort_column
            columns = ["id", "created_at", "updated_at", "nome_crianca", "data_nascimento_crianca", "cpf_crianca", "nome_responsavel", "cpf_responsavel", "telefone_contato", "prova", "categoria", "tamanho_camisa", "sub_categoria"]
            columns[params[:order]['0'][:column].to_i]
        end

        def sort_direction
            params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
        end
end
