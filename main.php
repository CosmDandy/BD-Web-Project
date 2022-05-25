<?php
require_once("Connections/project_con.php");

if (!$_SESSION['auth']) {
    header('Location: ' . 'login.php');
}

$user = $_SESSION['user_id'][0];
$select_note = mysqli_query($link, "SELECT * FROM notes WHERE user_id = '$user' ORDER BY created DESC ");
$user_search = str_replace(',', ' ', $_GET['user_search']);
$search_words = explode(' ', $user_search);

$final_search_words = array();
if (count($search_words) > 0) {
    foreach ($search_words as $word) {
        if (!empty($word)) {
            $final_search_words[] = $word;
        }
    }
}

$where_list = "SELECT * FROM notes WHERE";
foreach ($final_search_words as $word) {
    $where_list .= " article LIKE '%$word%' OR";
}
$where_list = substr($where_list, 0, -3);
if (!empty($where_list)) {
    $res_query = mysqli_query($link, $where_list);
}
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="windows-1251">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="font.css">
    <title>Заметки</title>
</head>
<body>
<!-- Menu -->
<div class="menu">
    <button type="button" class="submenu" onclick="javascript:location.href='account.php';">
        <img alt="#" src="Photos/user.png">
    </button>
    <div>
        <button type="button" class="submenu">
            <img alt="#" src="Photos/house.png" onclick="javascript:location.href='main.php';">
        </button>
        <button type="button" class="submenu" onclick="javascript:location.href='createNote.php';">
            <img alt="#" src="Photos/new-note.png">
        </button>
        <button type="button" class="submenu" onclick="javascript:location.href='main.php';">
            <img alt="#" src="Photos/menu.png">
        </button>
    </div>
    <button type="button" class="submenu" onclick="location.href='logout.php';">
        <img alt="#" src="Photos/logout.png">
    </button>
</div>

<!-- Main Content -->
<div class="content_wrapper">
    <div class="content">
        <div class="search">
            <form name="search" method="get" action="">
                <label for="user_search">
                    <input type="text" name="user_search" id="user_search">
                </label>
                <button type="submit">
                    <img alt="#" src="Photos/search.png">
                </button>
            </form>
        </div>
    </div>
    <?php if ($final_search_words[0] != "") {
        while ($res_array = mysqli_fetch_array($res_query)) { ?>
            <div class="content">
                <div class="block">
                    <div class="">
                        <h2><?php echo $res_array['id']; ?></h2>
                    </div>
                    <div class="">
                        <h2><?php echo $res_array['title']; ?></h2>
                    </div>
                    <div class="">
                        <h2><?php echo $res_array['article']; ?></h2>
                    </div>
                </div>
            </div>
        <?php }
    } else { ?>
    <div class="content">
        <?php while ($note = mysqli_fetch_array($select_note)) {
            if (!($note['deleted'])) {
                ?>
                <div class="block">
                    <div>
                        <div class="note_head">
                            <h2><?php echo $note['title']; ?></h2>
                        </div>
                        <div class="note_text">
                            <h3><?php echo $note['article']; ?></h3>
                        </div>
                    </div>
                    <div class="block_b">
                        <div class="note_date">
                            <p><?php echo $note['created']; ?></p>
                        </div>
                        <button type="button" onclick="location.href='editNote.php?note=<?php echo $note["id"]; ?>;'">
                            <img alt="#" src="Photos/edit-note.png">
                        </button>
                    </div>
                </div>
            <?php } } }?>
    </div>
</div>
</body>
</html>