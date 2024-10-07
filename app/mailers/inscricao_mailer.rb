class InscricaoMailer < ApplicationMailer

  def confirmacao_inscricao(inscricao)
    @inscricao = inscricao
    mail(to: @inscricao.email, subject: 'Confirmação de inscrição')
  end
end
