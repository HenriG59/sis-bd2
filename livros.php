<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Bibliófilo's</h1>

        <h2>Livros</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $livro_id = 'livro_id';
        $titulo = 'titulo';
        $genero = 'genero';
        $editora = 'editora';
        $autor_id = 'autor';
        
        

        $sql = 'SELECT livros.titulo,livros.genero,livros.editora,autor.nome autor 
            FROM livros
            INNER JOIN autor
            ON livros.autor_id = autor.autor_id;';



        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $titulo . '</th>' .
            '        <th>' . $genero . '</th>' .
            '        <th>' . $editora . '</th>' .
            '        <th>' . $autor_id . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$titulo] . '</td>' .
                    '<td>' . $registro[$genero] . '</td>'.
                    '<td>' . $registro[$editora] . '</td>'.
                    '<td>' . $registro[$autor_id] . '</td>' ;
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>