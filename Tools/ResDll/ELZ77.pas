unit ELZ77;

interface

uses
  classes, SysUtils;

const
  N = 4096;
  F = 16;

const
  LZ77_GEN_ERR = -1;
  LZ77_SAME_STREAM = -2;
  LZ77_NO_622 = -3;
  LZ77_BAD_FORMAT = -4;
 
function LZ77Extract(dst, src: TStream): Integer;

implementation

 (*
function TZipLibLoader.Expand(src: String; dest: String): Integer;
var
  sTOF, dTOF: TOFStruct;
  sH, dH:     Integer;
begin
  sH     := -1;
  dH     := -1;
  Result := 0;
  try
    sH := LZOpenFile(PChar(src), sTOF, OF_READ);
    dH := LZOpenFile(PChar(dest), dTOF, OF_CREATE);
    if (sH > 0) and (dH >= 0) then
      Result := LZCopy(sH, dH);
  finally
    if sH >= 0 then
      LZClose(sH);
    if dH >= 0 then
      LZClose(dH);
  end;
end;

*)
function LZ77Extract(dst, src: TStream): Integer;
var
  bits, ch, i, j, len, mask: Integer;
  buffer: array of Char;

  magic1, magic2, magic3: Cardinal;
  reserved: WORD;
  filesize: Cardinal;

  function GetByte: Integer;
  var
    ch: Char;
  begin
    Result := -1;
    if src.Read(ch, 1) = 1 then
      Result := Integer(ch);
  end;

begin
  Result := LZ77_SAME_STREAM;
  if dst = src then
    exit;
  src.ReadBuffer(magic1, sizeof(Cardinal));
  Result := LZ77_BAD_FORMAT;
  if (magic1 = $44445A53) then
  begin
    src.ReadBuffer(magic2, sizeof(Cardinal));
    if (magic2 <> $3327F088) then
      exit;
  end
  else
  if (magic1 = $4A41574B) then
  begin
    src.ReadBuffer(magic2, sizeof(Cardinal));
    if (magic2 <> $D127F088) then
      exit;
    src.ReadBuffer(magic3, sizeof(Cardinal));
    if (magic3 <> $00120003) then
      exit;
    Result := LZ77_NO_622;
    exit; // unsupported 6.22
  end
  else
    exit;
  src.ReadBuffer(Reserved, sizeof(WORD));
  src.ReadBuffer(filesize, sizeof(Cardinal));

  SetLength(buffer, N);
  i := N - F;
  while True do
  begin
    bits := getbyte;
    if (bits < 0) then
      break;

    mask := 1;
    while mask < 256 do
    begin
      if (bits and mask) = 0 then
      begin
        j := GetByte;
        if j < 0 then
          break;
        len := GetByte;
        inc(j, (len and $F0) shl 4);
        len := (len and 15) + 3;
        while len > 0 do
        begin
          buffer[i] := buffer[j];
          dst.WriteBuffer(buffer[i], 1);
          j := succ(j) and (N - 1);
          i := succ(i) and (N - 1);
          dec(len);
        end;
      end
      else
      begin
        ch := GetByte;
        if ch < 0 then
          break;
        buffer[i] := Char(ch);
        dst.WriteBuffer(ch, 1);
        i := succ(i) and (N - 1);
      end;
      inc(mask, mask);
    end;
  end;
  Result := 0;
end;

end.
    
