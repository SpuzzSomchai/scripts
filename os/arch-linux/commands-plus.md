Instalando pacotes específicos
Para instalar um único pacote ou lista de pacotes, incluindo dependências, execute o seguinte comando:

```
# pacman -S nome_pacote1 nome_pacote2 ...
```
Para instalar uma lista de pacotes com expressão regular (veja esse tópico do fórum):

```
# pacman -S $(pacman -Ssq regexp_pacote)
```

Às vezes, há várias versões de um pacote nos diferentes repositórios, por exemplo extra e testing. Para instalar a versão do repositório extra neste exemplo, o repositório deve ser definido na frente do nome do pacote:

```
# pacman -S extra/nome_pacote
```

Para instalar um número de pacotes que compartilham padrões em sua nomenclatura pode-se usar expansão com chaves:

```
# pacman -S plasma-{desktop,mediacenter,nm}
```
Isso pode ser expandido para quaisquer níveis sejam necessários:

```
# pacman -S plasma-{workspace{,-wallpapers},pa}
```
Instalando grupos de pacotes
Alguns pacotes pertencem a um grupo de pacotes que podem ser instalados simultaneamente. Por exemplo, o comando:

```
# pacman -S gnome
```

Para ver quais pacotes pertencem ao grupo gnome, execute:

```
# pacman -Sg gnome
```

Removendo pacotes
Para remover um único pacote, deixando todas as suas dependências instaladas:

```
# pacman -R nome_pacote
```
Para remover um pacote e suas dependências que não são exigidas por qualquer outro pacote instalado:

```
# pacman -Rs nome_pacote
```
Para remover um pacote, suas dependências e todos os pacotes que dependem deste pacote:

```
# pacman -Rsc nome_pacote
```
Para remover um pacote, o qual é exigido por outro pacote, sem remover o pacote dependente:

```
# pacman -Rdd nome_pacote
```
O pacman salva arquivos de configuração importantes ao remover certos aplicativos e os nomes com a extensão: .pacsave. Para prevenir a criação desses arquivos de backup use a opção -n:

```
# pacman -Rn nome_pacote
```

Atualizando pacotes

O pacman pode pesquisar por pacotes na base de dados, pesquisando nomes e descrições dos pacotes:

```
$ pacman -Ss string1 string2 ...
```
Algumas vezes, ERE (Extended Regular Expressions) incorporadas no -s podem causar muitos dos resultados indesejados, então têm que ser limitadas a corresponder ao nome de pacote apenas; não a descrição nem qualquer outro campo:

```
$ pacman -Ss '^vim-'
```
Para procurar os pacotes já instalados:

```
$ pacman -Qs string1 string2 ...
```
Para procurar nomes de pacotes em pacotes remotos:

```
$ pacman -Fs string1 string2 ...
```
Para exibir informações detalhadas sobre um determinado pacote:

```
$ pacman -Si nome_pacote
```
Para os pacotes instalados localmente:

```
$ pacman -Qi nome_pacote
```
Inserindo duas opções -i também exibirá a lista de arquivos de backup e seus estados de alterações:

```
$ pacman -Qii nome_pacote
```
Para obter uma lista dos arquivos instalados por um pacote:

```
$ pacman -Ql nome_pacote
```
Para obter uma lista dos arquivos instalados por um pacote remoto:

```
$ pacman -Fl nome_pacote
```
Para verificar a presença dos arquivos instalados por um pacote:

```
$ pacman -Qk nome_pacote
```
Passando a opção k duas vezes, irá ser realizado uma verificação mais aprofundada.

Pode-se também consultar a base de dados para saber qual pacote um arquivo no arquivo do sistema pertence:

```
$ pacman -Qo /caminho/para/nome_de_arquivo
```
Para consultar o banco de dados para saber de qual pacote remoto um arquivo pertence:

```
$ pacman -Fo /caminho/para/nome_de_arquivo
```
Para listar todos os pacotes que não são exigidos como dependências (órfãos):

```
$ pacman -Qdt
```

Para listar todos os pacotes explicitamente instalados e que não são necessários como dependências:

```
$ pacman -Qet
```

Limpando o cache de pacotes

Você também pode definir quantas versões mais recentes você deseja manter. Para reter apenas a uma versão anterior, use:

```
# paccache -rk1
```
Adicione a opção u para limitar a ação do paccache a pacotes desinstalados. Por exemplo, para remover todas as versões em cache de pacotes desinstalados, use o seguinte:

```
# paccache -ruk0
```

Para remover todos os pacotes em cache que não estão instalados atualmente e a base de dados de sincronização não utilizado, execute:

```
# pacman -Sc
```
Para remover todos os arquivos do cache, use a opção de limpeza duas vezes, sendo essa a abordagem mais agressiva e que vai deixar nada na pasta de cache:

```
# pacman -Scc
```

Comandos adicionais
Faça o download de um pacote sem instalá-lo:

```
# pacman -Sw nome_pacote
```
Instale um pacote "local" que não seja de um repositório remoto (ex., o pacote é do AUR):

```
# pacman -U /caminho/para/pacote/nome_pacote-versão.pkg.tar.xz
```
Para manter uma cópia do pacote local no cache do pacman, use:

```
# pacman -U file:///caminho/para/pacote/nome_pacote-versão.pkg.tar.xz
```
Instale um pacote "remoto" (não de um repositório indicado nos arquivos de configuração do pacman):

```
# pacman -U http://www.exemplo.com/repo/exemplo.pkg.tar.xz
```

Ao instalar um pacote, é possível forçar o motivo da instalação da dependência com:

```
# pacman -S --asdeps nome_pacote
```

Para alterar o motivo da instalação de um pacote já instalado, execute:

```
# pacman -D -asdeps nome_pacote
```

Sincronize a base de dados de arquivos:

```
# pacman -Fy
```

Se você tem um sistema do Arch saudável disponível, você pode ver a lista completa de dependências com:

```
$ pacman -Q $(pactree -u pacman)
```
Mas você pode precisar atualizar algumas delas, dependendo do seu problema. Um exemplo de extração de um pacote é

```
# tar -xvpwf pacote.tar.xz -C / --exclude .PKGINFO --exclude .INSTALL --exclude .MTREE --exclude .BUILDINFO
```

Configure automatic login
Edit the /etc/gdm/custom.conf file and make sure that the [daemon] section in the file specifies the following:
```

[daemon]
AutomaticLoginEnable=True
AutomaticLogin=username

reinstall gdm?

# pacman -Rns gdm
and then:

# pacman -S gdm
and

# systemctl enable gdm.service
# systemctl -f enable gdm.service

```
