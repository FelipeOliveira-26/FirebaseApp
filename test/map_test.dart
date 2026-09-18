import 'package:flutter_test/flutter_test.dart';

// Map que armazena o nome dos alunos e uma lista com suas notas.
Map<String, List<double>> alunos = {
 'Maria': [8.0, 9.0],
 'Bruna': [7.0, 7.0],
 'Carla': [10.0, 9.0],
};

void main() {
   // Testa a adição de um novo aluno ao map.
 test('Adicionar elemento', () {
   alunos.putIfAbsent('Elena', () => [9.0, 8.0]);

    // Verifica se a chave Elena foi adicionada ao map.
   expect(alunos.containsKey('Elena'), isTrue);
   expect(alunos['Elena'], [9.0, 8.0]);
 });

  // Testa a adição de vários alunos usando addAll().
 test('Adicionar outro dicionário', () {
   alunos.addAll({
     'Elena': [9.0, 8.0],
     'Luiza': [8.0, 9.0],
   });

    // Verifica se os dois alunos foram adicionados.
   expect(alunos.containsKey('Elena'), isTrue);
   expect(alunos.containsKey('Luiza'), isTrue);
 });

  // Testa a remoção de um aluno do map.
 test('Remover elemento', () {
   alunos.remove('Bruna');

     // Verifica se Bruna não está mais presente.
   expect(alunos.containsKey('Bruna'), isFalse);
 });

  // Testa duas formas de atualizar as notas de um aluno.
 test('Atualizar elemento', () {
   alunos.update('Carla', (value) => [9.0, 8.0]);
   expect(alunos['Carla'], [9.0, 8.0]);
   alunos['Carla'] = [8.0, 9.0];
   expect(alunos['Carla'], [8.0, 9.0]);
 });

  // Testa a leitura das chaves e valores e o percurso do map.
 test('Testar percorrer dicionário', () {
   expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
   expect(alunos.values, [
     [8.0, 9.0],
     [8.0, 9.0],
     [9.0, 8.0],
     [8.0, 9.0],
   ]);
   double soma = 0;

    // Percorre cada aluno e suas respectivas notas.
   alunos.forEach((key, value) {
     for (double nota in value) {
       soma += nota;
     }
   });

     // Confirma se a soma de todas as notas está correta.
   expect(soma, 68.0);
 });

   // Calcula e testa a média das notas de cada aluno.
 test('Calcular médias', () {
  alunos.remove('Bruna');

  alunos.update('Carla', (value) => [8.0, 9.0]);

  alunos.addAll({
    'Elena': [9.0, 8.0],
    'Luiza': [8.0, 9.0],
  });
 
  // Cria um map para armazenar o nome e a média de cada aluno.
  Map<String, double> medias = {};
 
    // Percorre o map e calcula a média das notas de cada aluno.
  alunos.forEach((nome, notas) {
    double soma = 0;

   // Soma todas as notas do aluno.
    for (double nota in notas) {
      soma += nota;
    }
    
    // Divide a soma pela quantidade de notas para obter a média.
    medias[nome] = soma / notas.length;
  });
  

    // Verifica se as médias calculadas estão corretas.
  expect(medias, {
    'Maria': 8.5,
    'Carla': 8.5,
    'Elena': 8.5,
    'Luiza': 8.5
  });
});
}