import'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
                hintText:'Enter Email', 
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 14
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                             )
                  ),
                  border:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black 
                      
                    
                    ),
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
          
        ),
        
                  ),
                  
);