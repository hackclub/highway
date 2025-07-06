# JLCPCB Cost optimizing

Written by pythonatsea / hudson

FYI this guide is focused on people in the US with regards to tariffs and shipping

Hi! If you're reading this you've probably mostly completed your design and you're realizing you've way underestimated the cost of PCBA at JLCPCB, and you need to cut your BOM a bit. There are a couple easy(ish) ways to do this.

## Size
JLC's prices for PCBs are locked at **$2 for 2 layer boards under 100x100mm, and 4-8 layer PCBs under 50x50mm**. After this they become quite expensive, so keep that in mind when designing your PCB.

## Quantity
Make sure that you have 5 PCBs (the minimum), and you can also reduce the number of PCB's _assembled_ to 2, which can save a bit on parts costs. You should also consider if you _need_ PCBA, or if you can handsolder your parts. **If you only have THT parts, you don't need PCBA.**

## Economic assembly
JLC has 2 types of assembly, economic assembly and standard assembly. Standerd assembly is _considerably_ more expensive, the setup fee alone is $17 more. **You should _always_ be using ecenomic assembly**, which does mean you're limited to having parts on only one side of the board.

## Basic parts
JLC has 3 different types of parts, basic, preferred extended, and (non preferred) extended. For every extended part you use, they charge a **$3 loading fee**, which adds up quickly, especially after tariffs. The easiest way to to search for basic and preferred extended parts is https://lrks.github.io/jlcpcb-economic-parts/active.html, whcih has all of them in one place. For most parts you can find a comparable replacement that's a basic part. 

## Poor man's panelization
If you have 2 PCBs that both need to get assembled, you can connect them with mousebites and only pay the setup fee once. This can also save money if both PCBs together are under 100x100mm, even if you're not getting them assembled.

## Shipping
Shipping is mostly based on weight, although UPS and FedEx also charge rural surcharges. Generally DHL is the cheapest option besides global direct standard line, which doesn't prepay tariffs and will probably cause headaches with customs. Keeping weight as low as you can is the secret to low(er) shipping costs.

## Tariffs (for the US)
JLC charges tariffs at **60% when the order is placed**, and won't adjust it based on the actual rate the tariff is charged by customs, so once you place your order you're done. Because the tariffs are based on the order price, for every dollar you can save on the PCB you actually save $1.60.
