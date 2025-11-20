# 📹 Como Configurar Vídeos no Google Drive para Embed

## ⚠️ Problema Comum

Vídeos do Google Drive podem não carregar em iframe se não estiverem configurados corretamente.

## ✅ Solução: Configuração Correta

### Passo 1: Upload do Vídeo

1. Faça upload do vídeo no Google Drive
2. Certifique-se de que o formato é suportado (MP4, WebM, etc.)

### Passo 2: Configurar Compartilhamento

1. **Clique com botão direito** no arquivo de vídeo
2. Selecione **"Obter link"** ou **"Compartilhar"**
3. Configure como **"Qualquer pessoa com o link pode visualizar"**
   - ⚠️ **IMPORTANTE**: Deve ser "visualizar", não apenas "ver link"
   - ⚠️ **NÃO** marque como "Restrito" ou "Apenas pessoas específicas"

### Passo 3: Copiar Link Correto

Use um destes formatos de URL:

**Formato 1 (Recomendado):**
```
https://drive.google.com/file/d/FILE_ID/view?usp=sharing
```

**Formato 2:**
```
https://drive.google.com/file/d/FILE_ID/view
```

**Formato 3:**
```
https://drive.google.com/open?id=FILE_ID
```

Onde `FILE_ID` é o ID único do arquivo (geralmente 33 caracteres).

### Passo 4: Adicionar no Banco de Dados

No campo `video_url` da tabela `aulas`, adicione a URL completa:

```sql
UPDATE aulas 
SET video_url = 'https://drive.google.com/file/d/1aDvDjTizU8F1nrAQKPzQmZ-xHghTllv6/view?usp=sharing'
WHERE id = 'aula_id';
```

---

## 🔍 Verificação

### Como Verificar se Está Configurado Corretamente

1. **Teste o link diretamente:**
   - Abra a URL no navegador (modo anônimo)
   - Deve abrir o vídeo sem pedir login

2. **Teste o embed:**
   - A URL de embed será: `https://drive.google.com/file/d/FILE_ID/preview`
   - Abra essa URL no navegador
   - Se mostrar o vídeo, o embed funcionará

3. **Verifique no console:**
   - Abra o console do navegador (F12)
   - Procure por mensagens de erro
   - Veja os logs: "File ID extraído" e "URL de embed gerada"

---

## 🐛 Problemas Comuns

### Problema 1: "Carregando vídeo Google Drive..." infinito

**Causa:** Arquivo não está compartilhado corretamente ou formato não suportado.

**Solução:**
1. Verifique se o arquivo está como "Qualquer pessoa com o link pode visualizar"
2. Teste o link em modo anônimo
3. Verifique se o formato do vídeo é suportado (MP4, WebM)

### Problema 2: Iframe não carrega

**Causa:** Google Drive pode bloquear embed de alguns tipos de arquivo.

**Solução:**
- O sistema agora mostra um botão "Abrir vídeo no Google Drive" como fallback
- Clique no botão para abrir o vídeo diretamente no Google Drive

### Problema 3: File ID não encontrado

**Causa:** URL no formato incorreto.

**Solução:**
- Use um dos formatos recomendados acima
- Certifique-se de que a URL contém `/file/d/` ou `?id=`

---

## 📝 Formatos de URL Suportados

O sistema detecta automaticamente estes formatos:

✅ `https://drive.google.com/file/d/FILE_ID/view`
✅ `https://drive.google.com/file/d/FILE_ID/view?usp=sharing`
✅ `https://drive.google.com/open?id=FILE_ID`
✅ `https://docs.google.com/uc?export=download&id=FILE_ID`

---

## 🎯 Recomendações

### Para Melhor Compatibilidade

1. **Use MP4** - Formato mais compatível
2. **Tamanho moderado** - Vídeos muito grandes podem ter problemas
3. **Compartilhamento público** - Configure como "Qualquer pessoa com o link pode visualizar"
4. **Teste antes** - Sempre teste o link antes de adicionar no banco

### Alternativa: Supabase Storage

Se o Google Drive continuar dando problemas, considere usar **Supabase Storage**:
- ✅ Embed garantido
- ✅ Controle total de acesso
- ✅ URLs assinadas (mais seguro)
- ✅ Melhor performance

Veja: `MIGRACAO-VIDEOS-PRIVADOS.md`

---

## 🔧 Debug

Se o vídeo não carregar, verifique no console:

1. **File ID extraído?**
   - Procure: `✅ File ID extraído`
   - Se não aparecer, a URL está no formato errado

2. **URL de embed gerada?**
   - Procure: `🔗 URL de embed gerada`
   - Verifique se a URL está correta

3. **Iframe carregado?**
   - Procure: `✅ Iframe do Google Drive carregado`
   - Se não aparecer, o embed falhou

4. **Erros?**
   - Procure: `❌ Erro ao carregar iframe`
   - Veja a mensagem de erro para diagnóstico

---

**Última atualização:** Janeiro 2025

