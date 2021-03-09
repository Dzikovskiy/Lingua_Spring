<!DOCTYPE HTML>
<html lang="en">
<#include "parts/security.ftl">
<#import "parts/addCourseModal.ftl" as acm>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/assets/css/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Scada:ital,wght@0,400;0,700;1,400;1,700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:300i,400,700&display=swap&subset=cyrillic-ext"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script src="https://kit.fontawesome.com/54153b1a19.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <title>Lingua</title>
    <link rel="icon" href="/static/assets/icon/ic_launcher.ico"/>
</head>

<body>

<!-- Header -->
<header class="header" id="header">
    <div class="container">
        <div class="header_inner">
            <div class="header_logo" data-scroll="#intro">Lingua</div>
            <nav class="nav2" id="nav">
                <a class="nav_link2 current2" href="/profile">Profile</a>
                <a class="nav_link2" href="/learn">Learn</a>
                <a class="nav_link2" href="/test">Test</a>
                <a class="nav_link2" href="/match">Match</a>
                <a class="nav_link2 logout" href="/logout">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <span class="material-icons exit">
                            exit_to_app
                        </span> Logout
                </a>
            </nav>
        </div>
    </div>
</header>
<div class="page">
    <section class="profile">
        <div class="login_text">
            <#if name?has_content>
                ${name}<#else>User Name
            </#if>
        </div>
        <#if isAdmin>
            <form action="/word/save" id="word_form" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="box words_form">
<#--                    <div class="form__group field">-->
<#--                        <input type="input" class="form__field" placeholder="Word" name="word_1" id='word_1' required/>-->
<#--                        <label for="word_1" class="form__label words">Word</label>-->
<#--                        <input type="input" class="form__field" placeholder="Translation" name="word_2" id='word_2'-->
<#--                               required/>-->
<#--                        <label for="word_2" class="form__label words">Translation</label>-->
<#--                    </div>-->
<#--                    <a onclick="document.getElementById('word_form').submit();" href="javascript:{}"-->
<#--                       class="search_button">add-->
<#--                        word</a>-->

                    <div class="link_box">
                    <a href="#" class="search_button add-course-btn" id="add-course-btn">add course</a>
                    <a href="#" class="search_button">add word</a>
                    </div>
                </div>

            </form>
        </#if>
        <div class="box">
            <div class="form__group field">
                <input type="input" class="form__field" placeholder="Search word" name="word" id='word' required/>
                <label for="word" class="form__label">Search word</label>

            </div>
            <a href="#" class="search_button">search</a>

        </div>
        <table class="profile_table" style="width:30%">
            <tr>
                <th>learned:</th>
            </tr>
            <#if wordsLearned?has_content>
                <#list wordsLearned as word>
                    <tr>
                        <td>${word.getLangFirst()} - ${word.getLangSecond()}</td>
                    </tr>
                </#list>
            </#if>
        </table>
        <table class="profile_table center" style="width:30%">
            <tr>
                <th>tested:</th>
            </tr>
            <#if wordsTested?has_content>
                <#list wordsTested as word>
                    <tr>
                        <td>${word.getLangFirst()} - ${word.getLangSecond()}</td>
                    </tr>
                </#list>
            </#if>
        </table>
        <table class="profile_table right" style="width:30%">
            <tr>
                <th>matched:</th>
            </tr>
            <#if wordsMatched?has_content>
                <#list wordsMatched as word>
                    <tr>
                        <td>${word.getLangFirst()} - ${word.getLangSecond()}</td>
                    </tr>
                </#list>
            </#if>

            <tr>
                <td>one - адзiн</td>
            </tr>
            <tr>
                <td>four - чатыры</td>
            </tr>
        </table>
    </section>

    <div class="addCourseModal" id="addCourseModal">
        <@acm.modal/>
    </div>

</div>

<#--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<script src="assets/js/app.js"></script>


</body>

</html>