Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335AE377D6E
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 09:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124863.235096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg0fh-0000qp-Mx; Mon, 10 May 2021 07:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124863.235096; Mon, 10 May 2021 07:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg0fh-0000op-JZ; Mon, 10 May 2021 07:49:45 +0000
Received: by outflank-mailman (input) for mailman id 124863;
 Mon, 10 May 2021 07:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EdaL=KF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lg0fg-0000oj-0d
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 07:49:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fa04fdc-fffd-4123-8dbc-b69a3546c66e;
 Mon, 10 May 2021 07:49:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF517AD2D;
 Mon, 10 May 2021 07:49:41 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2fa04fdc-fffd-4123-8dbc-b69a3546c66e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620632982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0j83j8RRCJnZ3MKwwsBj8yqBRz3BqNt5M6mxu5X8Wwo=;
	b=FotK3A+6GfJnf1/8xTrFFiptRKCEEIkHX7F8oZHIVuVpIDeFPFWTGy7Ee5zQIUJ8GOXOSU
	HNVKAU/9d0+0/k6TnykU3yAMxkAqVrzsSi7+wcKH9Ns+VjRydOCzCibs7iFAYj/MMtAEAq
	g+oRrvozg205lPiuUJQld4n8VbKOuUo=
Subject: Re: [PATCH] tools/xenstored: Prevent a buffer overflow in
 dump_state_node_perms()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210506161223.15984-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f9542104-b645-4d94-5aab-0854e4b54ff0@suse.com>
Date: Mon, 10 May 2021 09:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210506161223.15984-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M7Dqxg3PbDERPyj4OsEb9flCpBK13PLa8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--M7Dqxg3PbDERPyj4OsEb9flCpBK13PLa8
Content-Type: multipart/mixed; boundary="P0dmCRNO8HREAsoC0YH5fxeDjhKJOgapR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <f9542104-b645-4d94-5aab-0854e4b54ff0@suse.com>
Subject: Re: [PATCH] tools/xenstored: Prevent a buffer overflow in
 dump_state_node_perms()
References: <20210506161223.15984-1-julien@xen.org>
In-Reply-To: <20210506161223.15984-1-julien@xen.org>

--P0dmCRNO8HREAsoC0YH5fxeDjhKJOgapR
Content-Type: multipart/mixed;
 boundary="------------91173C0EA6CDDADA40C5A858"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------91173C0EA6CDDADA40C5A858
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.05.21 18:12, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> ASAN reported one issue when Live Updating Xenstored:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D873=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on addres=
s 0x7ffc194f53e0 at pc 0x555c6b323292 bp 0x7ffc194f5340 sp 0x7ffc194f5338=

> WRITE of size 1 at 0x7ffc194f53e0 thread T0
>      #0 0x555c6b323291 in dump_state_node_perms xen/tools/xenstore/xens=
tored_core.c:2468
>      #1 0x555c6b32746e in dump_state_special_node xen/tools/xenstore/xe=
nstored_domain.c:1257
>      #2 0x555c6b32a702 in dump_state_special_nodes xen/tools/xenstore/x=
enstored_domain.c:1273
>      #3 0x555c6b32ddb3 in lu_dump_state xen/tools/xenstore/xenstored_co=
ntrol.c:521
>      #4 0x555c6b32e380 in do_lu_start xen/tools/xenstore/xenstored_cont=
rol.c:660
>      #5 0x555c6b31b461 in call_delayed xen/tools/xenstore/xenstored_cor=
e.c:278
>      #6 0x555c6b32275e in main xen/tools/xenstore/xenstored_core.c:2357=

>      #7 0x7f95eecf3d09 in __libc_start_main ../csu/libc-start.c:308
>      #8 0x555c6b3197e9 in _start (/usr/local/sbin/xenstored+0xc7e9)
>=20
> Address 0x7ffc194f53e0 is located in stack of thread T0 at offset 80 in=
 frame
>      #0 0x555c6b32713e in dump_state_special_node xen/tools/xenstore/xe=
nstored_domain.c:1232
>=20
>    This frame has 2 object(s):
>      [32, 40) 'head' (line 1233)
>      [64, 80) 'sn' (line 1234) <=3D=3D Memory access at offset 80 overf=
lows this variable
>=20
> This is happening because the callers are passing a pointer to a variab=
le
> allocated on the stack. However, the field perms is a dynamic array, so=

> Xenstored will end up to read outside of the variable.
>=20
> Rework the code so the permissions are written one by one in the fd.
>=20
> Fixes: ed6eebf17d2c ("tools/xenstore: dump the xenstore state for live =
update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------91173C0EA6CDDADA40C5A858
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------91173C0EA6CDDADA40C5A858--

--P0dmCRNO8HREAsoC0YH5fxeDjhKJOgapR--

--M7Dqxg3PbDERPyj4OsEb9flCpBK13PLa8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCY5ZUFAwAAAAAACgkQsN6d1ii/Ey9t
6gf+PcEXkHUG1/XhitF2xSy++vtjjRFB/eCoD8oh5TdX8QP+XzjD+GqAO/DFS+ycifg0KI7iy3ck
PjfNqAKlmUkjXI3TP3KiV/3vBli12QKMynXdr+LYEmigDuPx2miecA0K217RxWBvND6OzioFPJOZ
BB2y2CAmDivirAuOK6adMF77429yfRaXsUSCnslAOdQUCcm6bWaoIwUOZLm6Q6klCwlI9P9mnNMO
2qY2Ey7nkAxpbDn8Kbt5pTf6qZFT3swI0hd0vssUhg5nKMLy6E0HmP/WF/dMcHNNqzDN1d4ALGKF
Go4JVvtxq4im2W18bsJ/hyNWZ/YNvPovhVxkUtc6BA==
=sxDG
-----END PGP SIGNATURE-----

--M7Dqxg3PbDERPyj4OsEb9flCpBK13PLa8--

