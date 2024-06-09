<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : 'ID='+=loginId}"/>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            margin-top: 50px;
            color: #333;
            /*text-align: center;*/
        }

        .comment-section {
            max-width: 1200px; /* Increased width */
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        button {
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        /*button { //버튼색깔번경*/
        /*    cursor: pointer;*/
        /*    background-color: #007bff;*/
        /*    color: #fff;*/
        /*    border: none;*/
        /*    transition: background-color 0.3s ease;*/
        /*}*/

        /*button:hover {*/
        /*    background-color: #0056b3;*/
        /*}*/

        ul {
            list-style-type: none;
            padding: 0;
        }

        /*li { //답글 삭제 수정 위치 변경 그리고 이상한 하얀선*/
        /*    margin-bottom: 10px;*/
        /*    padding: 10px;*/
        /*    display: flex;*/
        /*    align-items: flex-start;*/
        /*    border-bottom: 1px solid #eee;*/
        /*}*/

        .commenter {
            font-weight: bold;
            color: #333;
            margin-right: 10px;
        }

        .comment {
            color: #555;
            flex: 1;
        }

        /*//일자로 만들어줌 버튼 댓글 전체*/
        .comment-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        /*.comment-actions-left { // 답글 왼쪽으로 정렬*/
        /*    display: flex;*/
        /*    align-items: center;*/
        /*    margin-right: auto;*/
        /*}*/

        .comment-actions-color button {
            background: none;
            border: none;
            color: #007bff;
            cursor: pointer;
            margin-left: 10px;
        }

        .comment-actions button:hover {
            text-decoration: underline;
        }

        .reply-form {
            margin-top: 10px;
        }

        .comment-details {
            margin-left: 10px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .comment-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 10px;
        }

        .comment-body {
            flex: 1;
        }

        .comment-info {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .comment-time {
            color: #777;
            font-size: 0.9em;
            margin-left: 10px;
        }

        .delBtn,
        .modBtn,
        .replyBtn {
            float: right;
            margin-left: 10px;
            background: none;
            border: none;
            color: #007bff;
            cursor: pointer;
        }

    </style>
</head>
<body>
<h2>commentTest</h2>
<div class="comment-section">
    comment: <input type="text" name="comment"><br>
    <button id="sendBtn" type="button">SEND</button>
    <button id="modBtn" type="button">수정</button>

    <div id="commentList"></div>
    <div id="replyForm" style="display:none">
        <input type="text" name="replyComment">
        <button id="wrtRepBtn" type="button">등록</button>
    </div>
</div>

<script>
    let bno = ${boardDto.bno};

    let showList = function (bno) {
        $.ajax({
            type: 'GET',
            url: '/twohg/comments?bno=' + bno,
            success: function (result) {
                $("#commentList").html(toHtml(result));
            },
            error: function () {
                alert("error");
            }
        });
    }

    $(document).ready(function () {
        showList(bno);

        $("#sendBtn").click(function () {
            let comment = $("input[name=comment]").val();
            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus();
                return;
            }

            $.ajax({
                type: 'POST',
                url: '/twohg/comments?bno=' + bno,
                headers: { "content-type": "application/json" },
                data: JSON.stringify({ bno: bno, comment: comment }),
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error");
                }
            });
        });

        $("#modBtn").click(function () {
            let cno = $(this).data("cno");
            let comment = $("input[name=comment]").val();

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus();
                return;
            }

            $.ajax({
                type: 'PATCH',
                url: '/twohg/comments/' + cno,
                headers: { "content-type": "application/json" },
                data: JSON.stringify({ cno: cno, comment: comment }),
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error");
                }
            });
        });

        $("#commentList").on("click", ".modBtn", function () {
            let cno = $(this).closest("li").data("cno");
            let comment = $(this).closest("li").find(".comment").text();
            $("input[name=comment]").val(comment);
            $("#modBtn").data("cno", cno);
        });

        $("#commentList").on("click", ".replyBtn", function () {
            $("#replyForm").appendTo($(this).closest("li"));
            $("#replyForm").css("display", "block");
        });

        $("#wrtRepBtn").click(function () {
            let comment = $("input[name=replyComment]").val();
            let pcno = $("#replyForm").closest("li").data("cno");

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=replyComment]").focus();
                return;
            }

            $.ajax({
                type: 'POST',
                url: '/twohg/comments?bno=' + bno,
                headers: { "content-type": "application/json" },
                data: JSON.stringify({ pcno: pcno, bno: bno, comment: comment }),
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error");
                }
            });

            $("#replyForm").css("display", "none");
            $("input[name=replyComment]").val('');
            $("#replyForm").appendTo("body");
        });

        $("#commentList").on("click", ".viewRepliesBtn", function () {
            let repliesContainer = $(this).closest("li").find(".repliesContainer");
            let cno = $(this).closest("li").data("cno");

            // if (repliesContainer.is(':visible')) {
            //     repliesContainer.hide();
            // } else {
            //     $.ajax({
            //         type: 'GET',
            //         url: '/twohg/replies?cno=' + cno,
            //         success: function (result) {
            //             repliesContainer.html(toReplyHtml(result));
            //             repliesContainer.show();
            //         },
            //         error: function () {
            //             alert("error");
            //         }
            //     });
            // }
        });

        $("#commentList").on("click", ".delBtn", function () {
            let cno = $(this).closest("li").data("cno");
            let bno = $(this).closest("li").data("bno");

            $.ajax({
                type: 'DELETE',
                url: '/twohg/comments/' + cno + '?bno=' + bno,
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error");
                }
            });
        });
    });

    let toHtml = function (comments) {
        let tmp = "<ul>";

        comments.forEach(function (comment) {
            tmp += '<li data-cno=' + comment.cno + ' data-pcno=' + comment.pcno + ' data-bno=' + comment.bno + '>';
            tmp += '<div class="comment-item">';
            tmp += '<img class="avatar" src="https://via.placeholder.com/40" alt="avatar">';
            tmp += '<div class="comment-body">';
            tmp += '<div class="comment-info">';
            if (comment.cno != comment.pcno) {
                tmp += 'ㄴ';
            }
            tmp += '<span class="commenter">@' + comment.commenter + '</span>';
            tmp += '<span class="comment-time">' + new Date(comment.up_date).toLocaleString() + '</span>';
            tmp += '</div>';
            tmp += '<div class="comment">' + comment.comment + '</div>';
            tmp += '<div class="comment-actions-color">';
            // tmp += '<button class="viewRepliesBtn">댓글확인</button>';
            tmp += '<div class="comment-actions">';
            tmp += '<div class="comment-actions-left">';
            tmp += '<button class="replyBtn">답글</button>';
            tmp += '</div>';
            tmp += '<div class="comment-actions-right">';
            if ("${loginId}" == comment.commenter) {

                tmp += '<button class="modBtn">수정</button>';
                tmp += '<button class="delBtn">삭제</button>';
            }
            tmp += '</div></div></div></div>';

            // Add a container for replies
            tmp += '<div class="repliesContainer" style="display:none;"></div>';

            tmp += '</li>';
        });

        return tmp + "</ul>";
    };
</script>
</body>
</html>
