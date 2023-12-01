// 게시글 삭제

function confirmDelete(qnaId) {
    if (confirm('정말로 삭제하시겠습니까?')) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'qnaDelete?id=' + qnaId);
        xhr.send();

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.responseText === 'deleted') {
                    alert('삭제 되었습니다.');
                    window.location.href = 'qna_list';
                } else {
                    alert('삭제에 실패했습니다.');
                }
            }
        };
    }
}

// 로그인 요청

function loginAlert(){
    alert('로그인 후 이용해 주세요.');
}

