import 'package:condoview/components/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, String>> allHistoryData = [
    {
      'categoria': 'Mensagem',
      'data': '2024-08-06',
      'remetente': 'Síndico',
      'assunto': 'Reunião de condomínio',
      'conteudo': 'Aviso sobre a reunião geral.',
      'anexos': 'Nenhum',
      'status': 'Lido',
    },
    {
      'categoria': 'Aviso',
      'data': '2024-08-05',
      'remetente': 'Administração',
      'assunto': 'Manutenção programada',
      'conteudo': 'Manutenção na área comum no dia 10.',
      'anexos': 'Nenhum',
      'status': 'Lido',
    },
    // Adicione mais itens de exemplo aqui
  ];

  List<Map<String, String>> filteredData = [];
  String searchTerm = '';
  String selectedCategory = 'Todos';

  @override
  void initState() {
    super.initState();
    filteredData = allHistoryData;
  }

  void filterData() {
    setState(() {
      filteredData = allHistoryData.where((item) {
        final matchTerm = searchTerm.isEmpty ||
            item['assunto']!.toLowerCase().contains(searchTerm.toLowerCase());
        final matchCategory = selectedCategory == 'Todos' ||
            item['categoria'] == selectedCategory;
        return matchTerm && matchCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Comunicações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar por assunto',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
                filterData();
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
                filterData();
              },
              items: <String>['Todos', 'Mensagem', 'Aviso']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  final item = filteredData[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(item['assunto'] ?? ''),
                      subtitle: Text('${item['categoria']} - ${item['data']}'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(item['assunto'] ?? ''),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Categoria: ${item['categoria']}'),
                                Text('Data: ${item['data']}'),
                                Text('Remetente: ${item['remetente']}'),
                                SizedBox(height: 8.0),
                                Text('Conteúdo:'),
                                Text(item['conteudo'] ?? ''),
                                SizedBox(height: 8.0),
                                Text('Anexos: ${item['anexos']}'),
                                Text('Status: ${item['status']}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: Text('Fechar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex:
            1, // Indica que o índice da barra de navegação é a tela de pesquisa
        onTap: (index) {
          // Navega para a tela selecionada
          Navigator.pushNamed(context, _getRouteName(index));
        },
      ),
    );
  }

  String _getRouteName(int index) {
    switch (index) {
      case 0:
        return '/home';
      case 1:
        return '/search';
      case 2:
        return '/condominio';
      case 3:
        return '/vizinhança';
      case 4:
        return '/conversas';
      default:
        return '/home';
    }
  }
}
