<?php 
## cadastro aluno =2,chamada=0
$h=fopen('../act.txt','w');
$conteudo="0";
fwrite($h,$conteudo);
fclose($h);
?>
<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="imagens/logo.png">

    <title>BioChamada</title>

    <!-- Principal CSS do Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Estilos customizados para esse template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin" action="login.php" method="POST">
      <img class="mb-4" src="imagens/logo.png" alt="" width="220" height="220">
<!--      <h1 class="h3 mb-3 font-weight-normal">Faça login Professor</h1> -->
      <label for="inputEmail" class="sr-only">Endereço de email</label>
      <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Seu email" required autofocus>
      <label for="inputPassword" class="sr-only">Senha</label>
      <input type="password" id="inputPassword" class="form-control" name="senha" placeholder="Senha" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me" required>  <a href="termo.php" class="btn btn-link btn-sm">
        Aceito os termos.
      </a>
        </label>
      </div>
     
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      
      <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
    </form>
  </body>
</html>