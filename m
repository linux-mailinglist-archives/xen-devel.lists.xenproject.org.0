Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4835EC52
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 07:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110256.210449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWYMA-0003x0-Dp; Wed, 14 Apr 2021 05:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110256.210449; Wed, 14 Apr 2021 05:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWYMA-0003wb-Aa; Wed, 14 Apr 2021 05:46:30 +0000
Received: by outflank-mailman (input) for mailman id 110256;
 Wed, 14 Apr 2021 05:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMC9=JL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lWYM8-0003wW-Fw
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 05:46:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38712bb9-4431-44bd-84b5-36c0842aaf84;
 Wed, 14 Apr 2021 05:46:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F5E1B039;
 Wed, 14 Apr 2021 05:46:25 +0000 (UTC)
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
X-Inumbo-ID: 38712bb9-4431-44bd-84b5-36c0842aaf84
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618379185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0X0bXY2+cR1JJCl7IUHIDL/ZBxKz9pQW1O3/M7Xu2vw=;
	b=NcLroqAewYQem5QiXIcu9cnkcWyWxUX7Rkgmdyns32bVwwAhb/F0DZRxv4kexD9oy1M0/2
	8zHwPGuM7W3UMEDw8WUERtgxsgP0lwvAf/r6ikVPnernJiXaMCiQHY9zNF7aOzwefsCKQ+
	hXKJLnooMN0ON82cnoZZBFfhM1967Ew=
Subject: Re: [PATCH v3] tools: create libxensaverestore
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210413172028.29373-1-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5d483005-c6ca-88f1-0469-dd4a23c6752d@suse.com>
Date: Wed, 14 Apr 2021 07:46:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210413172028.29373-1-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="p8R8959tKgimXeuNQwcquH6CJMIX0udgd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--p8R8959tKgimXeuNQwcquH6CJMIX0udgd
Content-Type: multipart/mixed; boundary="8BhohdQI3IzQawKp9r3QwFlBv6WvClwxV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <5d483005-c6ca-88f1-0469-dd4a23c6752d@suse.com>
Subject: Re: [PATCH v3] tools: create libxensaverestore
References: <20210413172028.29373-1-olaf@aepfle.de>
In-Reply-To: <20210413172028.29373-1-olaf@aepfle.de>

--8BhohdQI3IzQawKp9r3QwFlBv6WvClwxV
Content-Type: multipart/mixed;
 boundary="------------60765A3A453500160586E88D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------60765A3A453500160586E88D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.04.21 19:20, Olaf Hering wrote:
> Move all save/restore related code from libxenguest.so into a separate
> library libxensaverestore.so. The only consumer is libxl-save-helper.
> There is no need to have the moved code mapped all the time in binaries=

> where libxenguest.so is used.
>=20
> According to size(1) the change is:
>     text	   data	    bss	    dec	    hex	filename
>   187183	   4304	     48	 191535	  2ec2f	guest/libxenguest.so.4.15.0
>=20
>   124106	   3376	     48	 127530	  1f22a	guest/libxenguest.so.4.15.0
>    67841	   1872	      8	  69721	  11059	saverestore/libxensaverestore.=
so.4.15.0
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
> v3:
> - repost in time for 4.16
> v2:
> - copy also license header
> - move xg_nomigrate.c
> - add size(1) output to commit msg
> - remove change from libxl_create.c
>=20
>   .gitignore                                    |   2 +
>   tools/include/xenguest.h                      | 186 ----------------
>   tools/include/xensaverestore.h                | 208 +++++++++++++++++=
+
>   tools/libs/Makefile                           |   1 +
>   tools/libs/guest/Makefile                     |  11 -
>   tools/libs/guest/xg_offline_page.c            |   1 -
>   tools/libs/light/Makefile                     |   4 +-
>   tools/libs/light/libxl_internal.h             |   1 +
>   tools/libs/light/libxl_save_helper.c          |   1 +
>   tools/libs/light/libxl_save_msgs_gen.pl       |   2 +-
>   tools/libs/saverestore/Makefile               |  38 ++++
>   .../{guest =3D> saverestore}/xg_nomigrate.c     |   0
>   .../{guest =3D> saverestore}/xg_save_restore.h  |   2 -
>   .../{guest =3D> saverestore}/xg_sr_common.c     |   0
>   .../{guest =3D> saverestore}/xg_sr_common.h     |  12 +
>   .../{guest =3D> saverestore}/xg_sr_common_x86.c |   0
>   .../{guest =3D> saverestore}/xg_sr_common_x86.h |   0
>   .../xg_sr_common_x86_pv.c                     |   0
>   .../xg_sr_common_x86_pv.h                     |   0
>   .../{guest =3D> saverestore}/xg_sr_restore.c    |   0
>   .../xg_sr_restore_x86_hvm.c                   |   0
>   .../xg_sr_restore_x86_pv.c                    |   0
>   .../libs/{guest =3D> saverestore}/xg_sr_save.c  |   0
>   .../xg_sr_save_x86_hvm.c                      |   0
>   .../xg_sr_save_x86_pv.c                       |   0
>   .../xg_sr_stream_format.h                     |   0
>   tools/libs/uselibs.mk                         |   4 +-
>   27 files changed, 269 insertions(+), 204 deletions(-)
>   create mode 100644 tools/include/xensaverestore.h
>   create mode 100644 tools/libs/saverestore/Makefile
>   rename tools/libs/{guest =3D> saverestore}/xg_nomigrate.c (100%)
>   rename tools/libs/{guest =3D> saverestore}/xg_save_restore.h (98%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_common.c (100%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_common.h (98%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_common_x86.c (100%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_common_x86.h (100%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_common_x86_pv.c (100=
%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_common_x86_pv.h (100=
%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_restore.c (100%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_restore_x86_hvm.c (1=
00%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_restore_x86_pv.c (10=
0%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_save.c (100%)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_save_x86_hvm.c (100%=
)
>   rename tools/libs/{guest =3D> saverestore}/xg_sr_save_x86_pv.c (100%)=

>   rename tools/libs/{guest =3D> saverestore}/xg_sr_stream_format.h (100=
%)

What about dropping the "xg_" prefix from the filenames?


Juergen

--------------60765A3A453500160586E88D
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

--------------60765A3A453500160586E88D--

--8BhohdQI3IzQawKp9r3QwFlBv6WvClwxV--

--p8R8959tKgimXeuNQwcquH6CJMIX0udgd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmB2gbAFAwAAAAAACgkQsN6d1ii/Ey9V
ugf/YEo8ffIAF9/mdlc1LSbox7Vwfb0ZjW9zlXAL4IhetcO0EmMvpvqH+RNao6k4OjLCKbmT6YEZ
1n4JGoApn1tGTevMTAWTCfTDWGH3Z0hQMOogK499z7smtlHZkhrLIQGwnF5a6NXPOuy6nDgeGHwP
sFGztWX+CppKtkvK3qFnsHTFs3/oMR9Nfb5lSW47eonkL+BT2Y/8CvXQ5p6FpGIwBqWHB1T/Oyad
RfvrnJdkQAYCemVyFOKCBvD6Z04NblY951+2CCwyjA+EKtIbfMIbvVhgm4TeFTWU4mjSFHoGPBCO
XA6guUZSIHOMcKUW/f4fO4jyzf+XQgdoIjCzyspmcw==
=kV4s
-----END PGP SIGNATURE-----

--p8R8959tKgimXeuNQwcquH6CJMIX0udgd--

