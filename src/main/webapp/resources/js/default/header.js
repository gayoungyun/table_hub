function submitSearch() {
    var category = document.getElementById('search_category').value;
    var keyword = document.getElementById('search_keyword').value.trim();

    // 검색어가 유효한 경우에만 검색 실행
    if (keyword !== '') {
        var path = contextPath;
        var url = path + '/main/mainPage2';

        if (category !== '') {
            url += '?searchType=' + category + '&keyword=' + encodeURIComponent(keyword);
        } else {
            url += '?keyword=' + encodeURIComponent(keyword);
        }

        window.location.href = url; // 검색 결과 페이지로 이동
    } else {
        alert('검색어를 입력하세요.');
    }
}