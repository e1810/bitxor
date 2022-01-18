`module.v` でモジュールを作成
`module_test.v` でテストベンチファイルを作成

コンパイル&vcdファイル生成
`iverilog -s ANDTEST module_test.v module.v & ./a.out`

波形確認
`twinwave + and_test.vcd`
