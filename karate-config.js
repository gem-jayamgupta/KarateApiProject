function fn() {
    var config = {
        baseUrl: 'https://jsonplaceholder.typicode.com',
        apiEndpoints: {
            books: '/posts',
            authors: '/authors',
            specificBook: '/posts/1',
            unavailableBook: '/posts/999'
        }
    };

    return config;
}
