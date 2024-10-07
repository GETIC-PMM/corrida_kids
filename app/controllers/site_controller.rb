class SiteController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception
    protect_from_forgery prepend: true, with: :null_session, if: proc { |c| c.request.format == 'application/json' }

    after_action :flash_to_headers

    def index
        @inscricao = Inscricao.new(params_inscricao)
    end

    def inscrever
        @inscricao = Inscricao.new(params_inscricao)
        @inscricao.errors.add(:base, "Vagas esgotadas") if Inscricao.count >= 650
        if @inscricao.errors.blank? && @inscricao.save
            flash[:notice] = 'Inscrição realizada com sucesso!'
            InscricaoMailer.confirmacao_inscricao(@inscricao).deliver_later
            redirect_to root_path
        else
            flash[:error] = 'Não foi possível realizar a inscrição. Por favor, tente novamente.'
            render :index
        end
    end

    def flash_to_headers
        return unless request.xhr?
        response.headers['X-Message'] = flash_message
        response.headers["X-Message-Type"] = flash_type.to_s
        flash.discard # don't want the flash to appear when you reload page
    end

    private
        def flash_message
            [:error, :warning, :notice].each do |type|
                return flash[type] unless flash[type].blank?
            end
        end

        def flash_type
            [:error, :warning, :notice].each do |type|
                return type unless flash[type].blank?
            end
        end

        def params_inscricao
            if params[:inscricao].present?
                params.require(:inscricao).permit(
                    :nome_crianca,
                    :data_nascimento_crianca,
                    :cpf_crianca,
                    :nome_responsavel,
                    :cpf_responsavel,
                    :telefone_contato
                )
            end
        end
end
