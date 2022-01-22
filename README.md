`module.v` でモジュールを作成
`module_test.v` でテストベンチファイルを作成

コンパイル&vcdファイル生成
`iverilog -s MODULETEST module_test.v module.v & ./a.out`
-s はトップモジュール指定(省略可)

波形確認
`twinwave + and_test.vcd`


8レジスタのBIT
000 更新:一点XOR
001 取得:[0, n)開区間総XOR
reg0~reg6まで使用可能、reg7はゴミ箱です。
