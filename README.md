# steampec

Steam store product data fetcher

## Usage

```console
$ ./steampec <app-id> \
  --country <country-code> \
  --language <language-code> \
  --file <file-export-path> \
  --pretty
```

- You can find `app-id` (Number) in the Steam store page URL.
- `country-code` (Optional) is the [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) country code.
- For `language-code` (Optional), refer to the API language code section at [Steamworks Documentation](https://partner.steamgames.com/doc/store/localization/languages).
- You can see usage using the `--help` flag.

### Example

```console
$ ./steampec 553850 -c kr -l koreana -f ~/.../helldivers2.json -p
```

## Build & Run

```console
$ cd steampec
$ xed . # Open Swift Package project in Xcode
$ swift run steampec # Debug build & run
$ swift build -c release # Release build
```
