# Leyes Grammar of graphics

## Theme

The themes of ggplot2 allow you to modify aesthetic aspects of the graph that are not related to the data itself. That includes axes, labels, background colors, the size of the margins, etc. It is unusual (and less expert users are discouraged) to have to alter the themes that ggplot2 uses by default. It only becomes necessary when the graphics have to conform to a corporate image or comply with some demanding publication criteria.

A theme is a collection of modifiable elements (e.g. panel.background, indicating the color, transparency, etc. of the canvas on which the graphic is rendered). The theme that ggplot2 uses by default is theme_grey. Typing theme_grey () in R's console displays around forty modifiable elements and their attributes as defined by that theme.

What can be done with the themes? A first option is to choose another one. For example, you can replace the usual one with others available in the package like theme_bw (or theme_classic) by doing.

```R
p <- p + theme_bw()
```

You can use both the themes that ggplot2 includes by default and others created by the community. Some, for example, try to imitate the style of recognized publications such as The Economist or the like. Some are collected in packages, such as ggthemes.

Alternatively (or additionally), it is possible to modify a given theme in a graph. For example, doing

```R
p <- p + 
  theme_bw() + 
  theme(
    panel.background = element_rect(fill = "lightblue"),
    panel.grid.minor = element_line(linetype = "dotted")
  )
```

The color attribute of a chart canvas and the type of the line with which the mesh is drawn are being modified.

Finally, it is possible to build your own and personalized themes. Although not a complicated process, the details are beyond the scope of this introduction.

## Coordinates

The word coordinate derives from the Latin ordinare, which means to order
or arrange. Coordinates are sets that locate points in space. These sets are usually numbers grouped in tuples, one tuple for each point. Because spaces can
be defined as sets of geometric objects plus axioms defining their behavior,
coordinates can be thought of more generally as schemes for mapping elements of sets to geometric objects. 

## Facets


Many of the graphics that can be generated with the above elements can be reproduced without much effort (excepting, perhaps, aspect issues) using traditional R graphics, but not faceted ones.

The facets implement the Trellis charts mentioned earlier. For example,

```R
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + geom_smooth() + 
  facet_grid(~ Species)
```

Create three horizontally arranged charts that compare the ratio of the width and length of the petal of the three species of irises. A characteristic of these graphs, which is critical in order to make adequate comparisons, is that they share axes.

Graphics could be arranged vertically by replacing facet_grid (~ Species) with facet_grid (Species ~.) In the code above. Also, you can subdivide the canvas by two (or more!) Variables like so:

```R
tmp <- paro[paro$Provinces %in% c("50 Zaragoza", "22 Huesca", "44 Teruel"),]
ggplot(tmp, aes(x = Periodo, y = tasa.paro)) +
  geom_point() + geom_smooth() + 
  facet_grid(Provinces~Gender)
```

## Statistics

Modern statistics as a discipline arose in the early
18th century, when collection of data about the state was recognized as essential to serving the needs of its constituents. This Enlightenment perspective
gave rise not only to the modern social sciences, but also to mathematical
methods for analyzing data measured with error (Stigler, 1983). 
In a graphical system, statistics are methods that alter the position of geometric graphs. We are accustomed to think of a chart as a display of a statistic
or a statistical function (e.g., a bar chart of budget expenditures). As such, it
would seem that we should begin by aggregating data, computing statistics,
and drawing a chart. This would be wrong, however. By putting statistics under control of graphing functions, rather than whole charts under the control
of statistics, we accomplish several things. First, we can represent more than
one statistic in a frame. One graphic can represent a mean and another a median, in the same frame. Second, making statistics into graphing methods forces them to be views or summaries of the raw data rather than data themselves.
In other words, the casewise data and a graphic are inextricably bound because
we never break the connection between the variables and the graphics that represent them. This allows us to drill-down, brush, and investigate values with
other dynamic tools. 

## Geometries  

The word geometry comes from the Greek , which means land
measurement. A geometer measures magnitudes in space. This chapter is
about geometric functions produced by a Grapher object. The Grapher object
contains functions to create graphs that can be represented by magnitudes in a
space. Grapher cannot make every graph in the set of all possible graphs. Grapher produces only certain graphs that can be expressed as geometric objects.
We will call these geometric graphs.
The geometric graphs in this chapter are subsets of product sets of real
numbers Rm or natural numbers Nm. We will be concerned with geometric objects for which 1 !&m ! 3. These objects will be embedded in a space Rn
 in which
m !&n !&3. Geometric graphs are built from bounded regions. Bounded regions
are produced by the Cartesian product of bounded intervals. 

## Aesthetics

In a graph there are, in the terminology of ggplot2, aesthetics. Aesthetics are, for example, the horizontal or vertical distance, the color, the shape (of a point), the size (of a point or the thickness of a line), etc. Just as when speaking we associate a set of sounds (eg, table) with a meaning (the object we know as table), when making a graph we associate elements without their own meaning (eg, colors) one: the one corresponding to a column determined from the data.

In ggplot2, within the graphics language that it implements, this explicit association of meanings to signifiers, that is, from columns of data to aesthetics, is very important.

```R
p <- p + aes(x = Petal.Length, y = Petal.Width, colour = Species)
```
Information about the aesthetics you have to use and what iris variables you have to use are being added to p:

The horizontal distance, x, will be given by the length of the petal.
The vertical distance, and, for its width.
Color, by species.
Note the syntax of the previous code, quite particular and typical of the ggplot2 package. The aesthetics have been added to the protographic. Additional elements will be added in the following sections. The important thing is to remember how the sum is the sign that combines the elements that make up the language of the graphics.

Anyway, it is usual to combine both steps in a single expression

```R
p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))
```

## Data


One of the most important elements of a graph is the data to be represented. A peculiarity of ggplot2 is that it only accepts one type of data: data.frames. Other graphical functions (eg, Hist) support vectors, lists, or other types of structures. ggplot2 no.

```R
p <- ggplot(iris)
```


The previous code creates an object, p that comes to be a protographic: it contains the data that we are going to use, those of the iris data set.