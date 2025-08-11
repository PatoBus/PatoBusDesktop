unit UnitSessao;

interface

type
  // Estrutura que vai armazenar as informações do usuário logado
  TSessaoUsuario = record
    IdUsuario: Integer;
    Usuario: string;
    IdEmpresa: Integer;
    Adm: Boolean;
  end;

var
  // Variável global que pode ser usada em todo o sistema
  SessaoUsuario: TSessaoUsuario;

implementation

end.

