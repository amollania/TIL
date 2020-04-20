<!DOCTYPE html>
<html lang="en">
<head>

    <?php
    // Cookie save
    if((include 'cookie.php')==TRUE) {}

    // php Source
    $relative_path = preg_replace("`\/[^/]*\.php$`i", "/", $_SERVER['PHP_SELF']);

    if((include 'head.php')==TRUE) {}
    ?>
</head>

<body> 
    <?php
    if((include 'header.php')==TRUE) {}
    if((include 'body.php')==TRUE) {}
    ?>

    <footer>
    <?php
    if((include 'footer.php')==TRUE) {}
    ?>
    </footer>

</body>
</html>
