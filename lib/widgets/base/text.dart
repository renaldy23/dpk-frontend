import 'package:flutter/material.dart';

Text textHeading(context, title) =>
    Text(title, style: Theme.of(context).textTheme.headline6);

Text textSubTitle(context, title) =>
    Text(title, style: Theme.of(context).textTheme.subtitle1);
