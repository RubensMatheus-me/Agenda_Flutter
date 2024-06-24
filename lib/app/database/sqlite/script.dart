

final create_table = '''
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    email VARCHAR(150) NOT NULL,
    url_avatar VARCHAR(300) NOT NULL
  )
''';


final insert1 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES('Pietro', '(11) 9 9999-0000', 'pietro@email.com', 'https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_1280.png')

''';


final insert2 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES('Ana', '(11) 9 9999-1234', 'ana@email.com', 'https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_1280.png')

''';


final insert3 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES('Joao', '(11) 9 9999-0011', 'joao@email.com', 'https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_1280.png')

''';