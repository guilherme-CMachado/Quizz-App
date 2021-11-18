class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "O nome do garoto protagonista do desenho pokémon é? ______",
    "options": ['Dash', 'Ash', 'Zach', 'Ted'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Qual o tipo do pokémon Pikachu?.",
    "options": ['Besta', 'Voador', 'Lutador', 'Elétrico'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Jessie, James e ______ são integrantes da Equipe Rocket ",
    "options": ['Meowth', 'Chansey', 'Starly', 'Glameow'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Qual o nome da enfermeira responsável pelo centro pokémon?",
    "options": ['Roy', 'Molly', 'Joy', 'Jennie'],
    "answer_index": 2,
  },
];
