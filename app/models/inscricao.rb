class Inscricao < ApplicationRecord
    self.implicit_order_column = :created_at

    # extends ...................................................................

    # includes ..................................................................
    audited
    acts_as_paranoid

    include Searchrable

    # security (i.e. attr_accessible) ...........................................

    # enums .....................................................................
    enum prova: {
        corrida_5km: "corrida_5km",
        caminhada_3km: "caminhada_3km"
    }

    enum categoria: {
        masculino: 'masculino',
        feminino: 'feminino',
        pcd: 'pcd'
    }
    enum tamanho_camisa: {
        pp: 'pp',
        p: 'p',
        m: 'm',
        g: 'g',
        gg: 'gg',
        xg: 'xg'
    }

    enum sub_categoria: {
        ate_25_anos: "ate_25_anos",
        entre_26_e_35_anos: "entre_26_e_35_anos",
        entre_36_e_45_anos: "entre_36_e_45_anos",
        acima_de_46_anos: "acima_de_46_anos",
        pcds: "pcds"
    }
    # relationships .............................................................

    # validations ...............................................................
    validates :nome_crianca, :data_nascimento_crianca, :cpf_crianca, :nome_responsavel, :cpf_responsavel, :telefone_contato, presence: true
    validates_uniqueness_of :cpf_crianca, message: 'já está cadastrado'
    # callbacks .................................................................
    # scopes ....................................................................

end
