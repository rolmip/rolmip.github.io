# Proposta de layout do site ROLMIP

Protótipo local em inglês, preparado em 12 de outubro de 2026. Ainda não foi publicado nem integrado ao gerador Zensical usado pelo site atual. Os arquivos existentes em `docs/` e o fluxo de publicação foram preservados.

## Direção visual e conteúdo

- Novo logo SVG original, sem alteração do desenho, na apresentação; símbolo no cabeçalho, rodapé e favicon.
- Rótulos matemáticos em torno do simplex e fórmula da faixa introdutória renderizados com MathML e anotação LaTeX, sem dependência de biblioteca externa.
- Azul-marinho e verde-petróleo, fundo claro e tipografia de leitura editorial.
- Apresentação do toolbox, exemplos, instalação, artigo, equipe e contato em vistas individuais da mesma página, acessíveis pelo menu e por URLs com fragmento.
- Seis exemplos progressivos com requisitos, resultado esperado, código copiável e download em MATLAB.
- Referência bibliográfica com cópia, visualização e download de BibTeX.
- Layout responsivo, vistas e abas navegáveis por teclado, foco visível e respeito à preferência por movimento reduzido.
- Conteúdo e fotos da equipe obtidos do próprio repositório; nenhuma nova alegação de ganho de desempenho.

## Visualização

Abra `index.html` diretamente no navegador ou execute, nesta pasta:

```sh
python3 -m http.server 8765 --bind 127.0.0.1
```

Abra `http://127.0.0.1:8765/`. Não há instalação de dependências ou etapa de compilação. Imagens, CSS e o JavaScript da interface são locais. A integração de visitas carrega `count.js` e o total de visitas do GoatCounter; as visualizações locais não são contabilizadas.

O contador na Home usa o total do site (`TOTAL`) e aponta para `https://rolmip.goatcounter.com/`. Cada vista do menu é registrada separadamente no GoatCounter por seu fragmento de URL. Para visitantes poderem abrir o painel pelo contador, a visualização pública do dashboard precisa ser habilitada nas configurações da conta.

## Exemplos

1. `examples/polynomial_example.m`: construção e recuperação de um coeficiente matricial.
2. `examples/algebra_example.m`: soma e produto, respeitando a ordem matricial.
3. `examples/stability_example.m`: certificado quadrático comum para um sistema contínuo politópico com dois vértices, usando YALMIP e SeDuMi.
4. `examples/hinf_example.m`: limite superior robusto H∞ via lema bounded-real, minimizando `eta = gamma^2` e retornando `sqrt(eta)`.
5. `examples/h2_example.m`: limite superior robusto H₂ via majorante comum do Gramiano de observabilidade, minimizando `trace(B0'*X0*B0)` e retornando sua raiz quadrada.
6. `examples/stateFeedback_hinf_example.m`: controle robusto H∞ por realimentação de estados, com ganho `K = ZW⁻¹`; resultado informado: limite superior `0.961973` e `K = [-806043.8469 -7270023.3120]`.

Os cinco exemplos originais foram executados no MATLAB R2023b com a cópia `ROLMIP_github/rolmip`, YALMIP 20250626 e SeDuMi disponível neste computador. O resultado do sexto exemplo foi fornecido pelo usuário; não foi reexecutado nesta edição. As matrizes dos dois primeiros exemplos foram comparadas com os resultados esperados. Para o terceiro, verificaram-se o status do solver, `P >= I` e `Ai'*P + P*Ai <= -I` nos dois vértices. O certificado é uma condição suficiente; a ausência de certificado não prova instabilidade.

Log: `../../output/website-proposal/matlab-examples.log`.

O navegador foi inspecionado em larguras de 390 e 1440 pixels, sem transbordamento horizontal da página; blocos de código têm rolagem própria. Foram conferidos carregamento das imagens, mudança das abas, seleção por teclado e feedback de cópia. O conteúdo efetivo da área de transferência do sistema não foi confirmado pelo adaptador do navegador. Capturas estão em `../../output/website-proposal/`.

## Integração posterior

Após a escolha do layout, transferir a apresentação para os templates e estilos do Zensical, criar uma página permanente de exemplos e manter os scripts MATLAB como fonte única para os trechos exibidos. Neste protótipo, o código está embutido no HTML para funcionar também sem servidor. Após editar os scripts, execute `python3 sync_examples.py` nesta pasta para atualizar o bloco JSON `example-data`, o trecho HTML inicial e `examples.json` a partir dos arquivos `.m`.

Manter os endereços existentes de documentação e projetos relacionados ao integrar. Ampliar a galeria com múltiplos simplexos, variáveis dependentes de parâmetros e exportação de LMIs, sempre acompanhados de testes e resultados esperados. Nenhuma publicação ou alteração remota foi realizada nesta proposta.


## Validação dos exemplos H∞ e H₂

Ambos usam `A(alpha) = alpha*A1 + (1-alpha)*A2`, `0 <= alpha <= 1`, com `A1 = [-1 0.2; 0 -2]`, `A2 = [-2 0; 0.3 -1]`, `B0 = [1; 0.5]`, `C0 = [1 0.4]` e `D = 0`. Os parâmetros são fixos para cada modelo LTI. As matrizes de decisão P e X são comuns ao politopo; os resultados são limites superiores suficientes, possivelmente conservadores, e não uma afirmação de cálculo exato do máximo das normas.

As LMIs são afins em alpha porque P/X, B0 e C0 são constantes. Portanto, a verificação dos dois vértices cobre todo o segmento por convexidade. Não generalizar essa conclusão para polinômios de grau maior usando apenas seus valores nos vértices.

| Verificação | H∞ | H₂ |
|---|---:|---:|
| Limite superior obtido | 1.150001516 | 0.825611400 |
| Máximo em uma malha de 101 modelos LTI | 1.150000000 | 0.825126253 |
| Maior autovalor da matriz LMI | −9.999e−7 | −1.000e−6 |

A malha é uma conferência independente, não uma prova de maximização global. Foram usados `ss` e `norm` do Control System Toolbox para comparar as normas dos modelos amostrados, além de `lyap` para verificar o majorante do Gramiano. Esse toolbox adicional é necessário somente para o script de validação, não para executar os dois exemplos publicados. Os testes confirmaram positividade de P e X e negatividade das matrizes das LMIs; pequenas variações numéricas entre versões de solver são esperadas.

A norma H₂ de um sistema contínuo estável com termo direto não nulo é infinita; por isso o exemplo usa D = 0. Referência: [norm, documentação oficial MATLAB](https://www.mathworks.com/help/control/ref/dynamicsystem.norm.html).

Evidências: `../../output/website-proposal/verify_norm_examples.m` e `../../output/website-proposal/norm-examples-validation.log`.
