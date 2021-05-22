

<!doctype html>
<html class="no-js" lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Musicando | Negozio</title>
  <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>

<body>

  <!-- Navigation -->
  <div class="top-bar">
    <div class="top-bar-left">
      <ul class="menu">
        <li class="menu-text">Musicando Corp.</li>
      </ul>
    </div>
    <div class="top-bar-right">
      <ul class="menu">
        <li><a href="http://localhost/Estate-in-Festa/home_page/">Home</a></li>
        <li><a href="http://localhost/Estate-in-Festa/home_page/negozio">Negozio</a></li>
        <li><a href="http://localhost/Estate-in-Festa/home_page/spettacoli">Spettacoli</a></li>
        <li><a href="http://localhost/Estate-in-Festa/home_page/contatti">Contatti</a></li>
        <li><a href="http://localhost/Estate-in-Festa/home_page/login">Login</a></li>
      </ul>
    </div>
  </div>
  <!-- /Navigation -->

  <br>

  <div class="row">

    <div class="medium-7 large-6 columns">
      <h1>I nostri fantastici concerti</h1>
      <p class="subheader">Scopri i migliori concerti dell'estate, forza è il momento di dare il via allo spettacolo!</p>
    </div>

    <div class="show-for-large large-3 columns">
      <img src="https://placehold.it/400x370&text=PSR1257 + 12 C" alt="picture of space">
    </div>

    <div class="medium-5 large-3 columns">
      <div class="callout secondary">
        <form>
          <div class="row">
            <div class="small-12 columns">
              <h5>Cerca per periodo</h5>
              <label>Inizio concerti
                <input type="text" placeholder="da....">
              </label>
            </div>
            <div class="small-12 columns">
              <label>Fine concerti
                <input type="number" placeholder="a....">
              </label>
              <button type="submit" class="button">Filtra</button>
            </div>
          </div>
        </form>
      </div>
    </div>

  </div>

  <div class="row column">
    <hr>
  </div>

  <div class="row column">
    <p class="lead">Gli Spettacoli</p>
  </div>

  <div class="row small-up-1 medium-up-2 large-up-3">
    <!-- inizio box informativo-->
    <?php 
        $_db = mysqli_connect('my_estateinmusica');

        if (mysqli_connect_error($_db) ) {
          die("<h1> impossible start connection</h1>");
        }
        mysqli_select_db($_db, 'my_estateinmusica');
          $query = "
            SELECT 
          PRENOTATE.Data_Prenotazione,
          SALE_CONCERTI.Numero_Posti, 
          SALE_CONCERTI.Nome, 
          SALE_CONCERTI.Indirizzo, 
          TELEFONI.Tipologia, 
          TELEFONI.Numero, 
          CONCERTI.Titolo,
          CONCERTI.Descrizione
        
          FROM 
          PRENOTATE, 
          SALE_CONCERTI, 
          TELEFONI, 
          CONCERTI
        
          WHERE
          PRENOTATE.Codice_Sala = SALE_CONCERTI.Codice_Sala AND
          PRENOTATE.Codice_Concerto = CONCERTI.Codice_Concerto AND
          TELEFONI.Codice_Sala = SALE_CONCERTI.Codice_Sala; 
          ";
        
          $_r = mysqli_query($_db, $query); 
            echo gettype($_r);
          mysqli_close($_db);





    while( $row = mysqli_fetch_assoc($_r)){
     
      echo "
      
      <div class='column'>
        <div class='callout'>
        <form action= 'programma.php' method= 'GET'>
          <p> <input type= 'text' value= '{$row['Data_Prenotazione']}' name= 'date'> </p>
          <p>POSTI DISPONIBILI: {$row['Numero_Posti']}</p>
          <p class='lead'><input type= 'text' value='{$row['Titolo']}' name= 'titolo'></p>
          <p class='subheader'>Indirizzo</p>
          {$row['Nome']}, {$row['Indirizzo']}
          <p class='subheader'>Contatti Telefonici</p>
          {$row['Numero']}<br>
          <input type= 'submit' value= 'Scopri il programma'>
          <a href= 'acquisto.php'> <input type= 'button' value= 'Compra Adesso'></a>
        </form>
      </div>
    </div>
      
      
      ";
    
    }
    
    
    ?>
    <!-- fine box-->
  </div>
  <footer>
    <div class="row expanded callout secondary" />
    <div class="row">
      <div class="medium-6 columns">
        <ul class="menu float-right">
          <li class="menu-text">Copyright</li>
        </ul>
      </div>
    </div>

  </footer>

  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <script src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
  <script>
    $(document).foundation();
  </script>
</body>

</html>
