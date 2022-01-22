`module.v` でモジュールを作成
`module_test.v` でテストベンチファイルを作成

コンパイル&vcdファイル生成
`iverilog -s MODULETEST module_test.v module.v & ./a.out`
-s はトップモジュール指定(省略可)

波形確認
`twinwave + and_test.vcd`
