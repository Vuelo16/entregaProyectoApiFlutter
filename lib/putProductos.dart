import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_api1/getProductos.dart';
import 'package:http/http.dart' as http;

class editarProducto extends StatefulWidget {
  final Product producto;

  const editarProducto({Key? key, required this.producto}) : super(key: key);

  @override
  State<editarProducto> createState() {
    return _editarProductoState();
  }
}

class _editarProductoState extends State<editarProducto> {
  final TextEditingController _nombreProd = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _stock = TextEditingController();
  final TextEditingController _stock_min = TextEditingController();
  final TextEditingController _valor_uni = TextEditingController();
  final TextEditingController _estadoProd = TextEditingController();

  Future<Product>? _futureProduct;

  @override
  void initState() {
    super.initState();
    _nombreProd.text = widget.producto.nombreProd;
    _descripcion.text = widget.producto.descripcion;
    _categoria.text = widget.producto.categoria;
    _stock.text = widget.producto.stock.toString();
    _stock_min.text = widget.producto.stock_min.toString();
    _valor_uni.text = widget.producto.valor_uni.toString();
    _estadoProd.text = widget.producto.estadoProd.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Editar Productos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureProduct == null ) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Scaffold buildColumn() {
    return Scaffold(
       body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 200),
          child: Column(
            children: [
          const SizedBox(height: 16),
              TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _nombreProd,
      decoration: const InputDecoration(
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),

    TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _descripcion,
      decoration: const InputDecoration(
        labelText: 'Descripcion',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),

    TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _categoria,
      decoration: const InputDecoration(
        labelText: 'Categoria',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),

    TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _stock,
      decoration: const InputDecoration(
        labelText: 'Stock',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),

    TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _stock_min,
      decoration: const InputDecoration(
        labelText: 'Stock Minimo',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),

    TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _valor_uni,
      decoration: const InputDecoration(
        labelText: 'Valor unitario',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),

    TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _estadoProd,
      decoration: const InputDecoration(
        labelText: 'Estado',
        suffixIcon: Icon(Icons.check_box_outlined),
        icon: Icon(Icons.input),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
      
            final String nuevoNombreProd = _nombreProd.text;
            final String nuevaDescripcion = _descripcion.text;
            final String nuevaCategoria = _categoria.text;
            final String nuevoStock = _stock.text;
            final String nuevoStockMin = _stock_min.text;
            final String nuevoValorUni = _valor_uni.text;
            final String nuevoEstadoProd = _estadoProd.text;

            setState(() {

              _futureProduct = actualizarProducto(widget.producto.id,nuevoNombreProd, nuevaDescripcion, nuevaCategoria, nuevoStock, nuevoStockMin, nuevoValorUni, nuevoEstadoProd);
            });
            
          },
          child: const Text('Editar Producto'),
        ),
      ],
          ),
        ),
       ),
    );
  }
  FutureBuilder<Product> buildFutureBuilder() {
    return FutureBuilder<Product>(
      future: _futureProduct,
      builder: (context, snapshot) {         
          if (snapshot.hasData) {
            return Text(snapshot.data!.nombreProd);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
        
        return const CircularProgressIndicator();
      },
    );
  }
}


Future<Product> actualizarProducto(String id, String nuevoNombreProd, String nuevaDescripcion, String nuevaCategoria, String nuevoStock, String nuevoStockMin, String nuevoValorUni, String nuevoEstadoProd) async {
            
  final response = await http.put(
    Uri.parse('https://entregable-node-back.onrender.com/api/producto/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      '_id': id,
      'nombreProd':nuevoNombreProd,
      'descripcion':nuevaDescripcion,
      'categoria':nuevaCategoria,
      'stock':nuevoStock,
      'stock_min':nuevoStockMin,
      'valor_uni':nuevoValorUni,
      'estadoProd':nuevoEstadoProd,
    }),
  );

  if (response.statusCode == 201) {

    return Product.fromJson(jsonDecode(response.body));
    
  } else {
        throw Exception(response.body);
  }
}

