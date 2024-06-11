
final create_table = '''
  CREATE TABLE contact(
  id INT NOT NULL PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,
  telefone CHAR(16) NOT NULL,
  email VARCHAR(150) NOT NULL,
  url_vatar VARCHAR(300) NOT NULL,
  )

''';

final insert1 = '''
  INSERT INTO contact(nome, telefone, email, url_avatar)
  VALUES('Pietro','(11) 9 9874-5656','https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png')
''';

final insert2 = '''
  INSERT INTO contact(nome, telefone, email, url_avatar)
  VALUES('Rubens','(44) 9 9712-2777','https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png')
''';

final insert3 = '''
  INSERT INTO contact(nome, telefone, email, url_avatar)
  VALUES('Joana','(11) 9 9562-3356)','https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png')
''';


