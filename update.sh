#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�ۑ�Zupdate.sh �TKO�@��W���d;Q�zhU�7�J=#g�v�q�����*�$<Z�"�@)�$�z�"1�3^�9���އ^v��|3��͌/-SĂ���U�V{���[�V��S�8�	��-�a�r��7f���H�=?l���~��*�_=�����XP|��7��:�:N��U��w���O�#���rƖւ�b�Vg�Aq:&x�e�?˚Ev�U��_��`#E�ō�ۡwȖ+��gX;/VX���v��Y����a+n������l	��M��~x�Z|���-��(�
����TrR}�5 �T��`(n`9Q �&a
���M���Bǁ�RT�sL;�bݰ)J-�,�JN�1M�I�A6$&E&� ���j�qM���6���!g�"[���yؤ����	0(B�\��%�wڕ��5I0��v.�_��W뾷���ʁ��L�n.2��e������7���v��8�%�k���!)&&��f6#g�RbDJ�}M��L����t�kC>�R�8a�D���A��4&�{�b`�*�נC�� �pE�!���]X3P�.��1����3��r���f,��:o&)����b�	~cB�$�߀8��j�A3To㼦\"뮍������c�+	�ALt�o�mO�,���R�ܤ��{E�[L���@ԁ�M���rL#6�"[��7��������5 ���G�����^�|3�[�t�HV���6�M>�`?�l�0&���`��  