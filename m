Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E037B669
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 08:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126136.237443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgipB-0001AC-5U; Wed, 12 May 2021 06:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126136.237443; Wed, 12 May 2021 06:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgipB-00017G-2J; Wed, 12 May 2021 06:58:29 +0000
Received: by outflank-mailman (input) for mailman id 126136;
 Wed, 12 May 2021 06:58:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F0FV=KH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lgipA-00017A-9c
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 06:58:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb3971da-7174-4eba-97b6-d5ec8996eaad;
 Wed, 12 May 2021 06:58:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63251AEEF;
 Wed, 12 May 2021 06:58:26 +0000 (UTC)
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
X-Inumbo-ID: cb3971da-7174-4eba-97b6-d5ec8996eaad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620802706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qr1pBb5ME1m/hDGzrHCzb7zbDgOx3pj3UFLX3yboP0M=;
	b=s3KPU2cvc5BHhbsIYMGIKhzA0Tstkm6DNoNNPsJLWrHuNRJi9Zb2YFmMX+pRdPH5mj2JiD
	Wh1l79PgsRO47o9L+1wd+7BH6LIuNGoWv8D1ghzAL9nQcGDdFgQSuXRfvu7JyRJflO5RCm
	L/2127BDOHtlWmc9f4oh9YiOXgzdDI8=
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20210412152236.1975-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
Date: Wed, 12 May 2021 08:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210412152236.1975-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="78G7TuzXokz2mlyJCRm3gsmTvqRpPQr6R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--78G7TuzXokz2mlyJCRm3gsmTvqRpPQr6R
Content-Type: multipart/mixed; boundary="LO8pSzdI3l6E16X0Dnt1yfck8mjpNMchy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Message-ID: <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
References: <20210412152236.1975-1-jgross@suse.com>
In-Reply-To: <20210412152236.1975-1-jgross@suse.com>

--LO8pSzdI3l6E16X0Dnt1yfck8mjpNMchy
Content-Type: multipart/mixed;
 boundary="------------1F206A47E54C17FAC7DB509B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1F206A47E54C17FAC7DB509B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Ping?

On 12.04.21 17:22, Juergen Gross wrote:
> There are some corners left which don't support the not so very new
> linear p2m list of pv guests, which has been introduced in Linux kernel=

> 3.19 and which is mandatory for non-legacy versions of Xen since kernel=

> 4.14.
>=20
> This series adds support for the linear p2m list where it is missing
> (colo support and "xl dump-core").
>=20
> In theory it should be possible to merge the p2m list mapping code
> from migration handling and core dump handling, but this needs quite
> some cleanup before this is possible.
>=20
> The first three patches of this series are fixing real problems, so
> I've put them at the start of this series, especially in order to make
> backports easier.
>=20
> The other three patches are only the first steps of cleanup. The main
> work done here is to concentrate all p2m mapping in libxenguest instead=

> of having one implementation in each of libxenguest and libxenctrl.
>=20
> Merging the two implementations should be rather easy, but this will
> require to touch many lines of code, as the migration handling variant
> seems to be more mature, but it is using the migration stream specific
> structures heavily. So I'd like to have some confirmation that my way
> to clean this up is the right one.
>=20
> My idea would be to add the data needed for p2m mapping to struct
> domain_info_context and replace the related fields in struct
> xc_sr_context with a struct domain_info_context. Modifying the
> interface of xc_core_arch_map_p2m() to take most current parameters
> via struct domain_info_context would then enable migration coding to
> use xc_core_arch_map_p2m() for mapping the p2m. xc_core_arch_map_p2m()
> should look basically like the current migration p2m mapping code
> afterwards.
>=20
> Any comments to that plan?
>=20
> Changes in V2:
> - added missing #include in ocaml stub
>=20
> Juergen Gross (6):
>    tools/libs/guest: fix max_pfn setting in map_p2m()
>    tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m
>      table
>    tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_any=
()
>    tools/libs: move xc_resume.c to libxenguest
>    tools/libs: move xc_core* from libxenctrl to libxenguest
>    tools/libs/guest: make some definitions private to libxenguest
>=20
>   tools/include/xenctrl.h                       |  63 ---
>   tools/include/xenguest.h                      |  63 +++
>   tools/libs/ctrl/Makefile                      |   4 -
>   tools/libs/ctrl/xc_core_x86.c                 | 223 ----------
>   tools/libs/ctrl/xc_domain.c                   |   2 -
>   tools/libs/ctrl/xc_private.h                  |  43 +-
>   tools/libs/guest/Makefile                     |   4 +
>   .../libs/{ctrl/xc_core.c =3D> guest/xg_core.c}  |   7 +-
>   .../libs/{ctrl/xc_core.h =3D> guest/xg_core.h}  |  15 +-
>   .../xc_core_arm.c =3D> guest/xg_core_arm.c}     |  31 +-
>   .../xc_core_arm.h =3D> guest/xg_core_arm.h}     |   0
>   tools/libs/guest/xg_core_x86.c                | 399 +++++++++++++++++=
+
>   .../xc_core_x86.h =3D> guest/xg_core_x86.h}     |   0
>   tools/libs/guest/xg_dom_boot.c                |   2 +-
>   tools/libs/guest/xg_domain.c                  |  19 +-
>   tools/libs/guest/xg_offline_page.c            |   2 +-
>   tools/libs/guest/xg_private.h                 |  16 +-
>   .../{ctrl/xc_resume.c =3D> guest/xg_resume.c}   |  69 +--
>   tools/libs/guest/xg_sr_save_x86_pv.c          |   2 +-
>   tools/ocaml/libs/xc/xenctrl_stubs.c           |   1 +
>   20 files changed, 545 insertions(+), 420 deletions(-)
>   delete mode 100644 tools/libs/ctrl/xc_core_x86.c
>   rename tools/libs/{ctrl/xc_core.c =3D> guest/xg_core.c} (99%)
>   rename tools/libs/{ctrl/xc_core.h =3D> guest/xg_core.h} (92%)
>   rename tools/libs/{ctrl/xc_core_arm.c =3D> guest/xg_core_arm.c} (72%)=

>   rename tools/libs/{ctrl/xc_core_arm.h =3D> guest/xg_core_arm.h} (100%=
)
>   create mode 100644 tools/libs/guest/xg_core_x86.c
>   rename tools/libs/{ctrl/xc_core_x86.h =3D> guest/xg_core_x86.h} (100%=
)
>   rename tools/libs/{ctrl/xc_resume.c =3D> guest/xg_resume.c} (80%)
>=20


--------------1F206A47E54C17FAC7DB509B
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

--------------1F206A47E54C17FAC7DB509B--

--LO8pSzdI3l6E16X0Dnt1yfck8mjpNMchy--

--78G7TuzXokz2mlyJCRm3gsmTvqRpPQr6R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCbfJAFAwAAAAAACgkQsN6d1ii/Ey+L
7Af+MngKfuLlpfBSjsHl7qCpAKGLPNn1mJj9OdMRrlzOLghk3LlS70brs36S+3z63g/MRo7grWuq
RCgit9/W20mAqggN+yE8TT2dFCnM6Qx6r1wgClRNG0XHnwy4ycW0zhhKY6LJnoKPbxKpvCEDj79h
eLF+5bGYjIU42iyXDP03w1R/Mh7YAN4uhDxP5mky981Pa2zMoGyO0WHvSwV0YUJfyUFd1B2FuAGS
ci+JcSDB30y0ia16mzYiH8/XN831jmFzOTnYgC1jMAIkJd2jMYsm9T2zUg7IO4A6JSLjsvJHc2Ar
O081OqPddJoUuOLgljn1KEM7vrG1y5phISpFkUgdjw==
=cAlH
-----END PGP SIGNATURE-----

--78G7TuzXokz2mlyJCRm3gsmTvqRpPQr6R--

