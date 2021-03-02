Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABE2329A96
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 11:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92248.174072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH2XF-0003qh-Bz; Tue, 02 Mar 2021 10:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92248.174072; Tue, 02 Mar 2021 10:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH2XF-0003qJ-8c; Tue, 02 Mar 2021 10:45:49 +0000
Received: by outflank-mailman (input) for mailman id 92248;
 Tue, 02 Mar 2021 10:45:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRZ7=IA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lH2XD-0003qE-Rn
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 10:45:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a91e02d3-337d-4315-ae0e-aa14b9b431f7;
 Tue, 02 Mar 2021 10:45:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D03DADCD;
 Tue,  2 Mar 2021 10:45:44 +0000 (UTC)
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
X-Inumbo-ID: a91e02d3-337d-4315-ae0e-aa14b9b431f7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614681944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4cnznGCDDMg+u497gGuDn7NkHjWumuEUE26kdVrLTdc=;
	b=U8+mNCROBlUCtMveqfuG3DkOP2BKrdPZ5CDn0a3EdKC1UncYiyXh3PNPnETGAl6kEq2U8r
	xhRL7hGHNOIVUhLw8bB3syHrPx6rFarmxdxZM6BOL5/ISt6lPaGHOd621u8yOXnYBwFcHi
	0HphvuCZs1NdaBwLE7KgMEU6zevoQEw=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
 <20210301170044.23295-3-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable
 libraries
Message-ID: <677223c5-e661-a132-35b8-2e9424817c7b@suse.com>
Date: Tue, 2 Mar 2021 11:45:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301170044.23295-3-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qT09KfmBFOVnsPA7LfIZeD4sXdjSKLwlp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qT09KfmBFOVnsPA7LfIZeD4sXdjSKLwlp
Content-Type: multipart/mixed; boundary="PSFzeLbKXobhW6sICOEpE0y50c9lsgypy";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <677223c5-e661-a132-35b8-2e9424817c7b@suse.com>
Subject: Re: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable
 libraries
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
 <20210301170044.23295-3-andrew.cooper3@citrix.com>
In-Reply-To: <20210301170044.23295-3-andrew.cooper3@citrix.com>

--PSFzeLbKXobhW6sICOEpE0y50c9lsgypy
Content-Type: multipart/mixed;
 boundary="------------D715ADE0B491DA52709A3841"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D715ADE0B491DA52709A3841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.03.21 18:00, Andrew Cooper wrote:
> These dumps were produced from the RELEASE-4.14.0 tag, with the abi-dum=
per
> tooling backported from staging.
>=20
> For each stable library, add a PKG_OLD_ABI variable pointing at the 4.1=
4 ABI.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> ---
>   tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump   |  924 +++++++++++=

>   .../abi/libxendevicemodel.so.1.3-x86_64-abi.dump   | 1491 +++++++++++=
++++++
>   tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump |  719 ++++++++
>   .../abi/libxenforeignmemory.so.1.3-x86_64-abi.dump |  847 ++++++++++
>   tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump | 1199 +++++++++++=
+++
>   tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump  |  597 +++++++
>   .../libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump  | 1711 +++++++++++=
+++++++++
>   .../libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump |  239 +++
>   .../libs/abi/libxentoollog.so.1.0-x86_64-abi.dump  |  882 ++++++++++
>   tools/libs/call/Makefile                           |    2 +
>   tools/libs/devicemodel/Makefile                    |    2 +
>   tools/libs/evtchn/Makefile                         |    2 +
>   tools/libs/foreignmemory/Makefile                  |    2 +
>   tools/libs/gnttab/Makefile                         |    2 +
>   tools/libs/hypfs/Makefile                          |    2 +
>   tools/libs/store/Makefile                          |    2 +
>   tools/libs/toolcore/Makefile                       |    2 +
>   tools/libs/toollog/Makefile                        |    2 +
>   18 files changed, 8627 insertions(+)
>   create mode 100644 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
>   create mode 100644 tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi=
=2Edump
>   create mode 100644 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump=

>   create mode 100644 tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-a=
bi.dump
>   create mode 100644 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump=

>   create mode 100644 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
>   create mode 100644 tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dum=
p
>   create mode 100644 tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.du=
mp
>   create mode 100644 tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dum=
p
>=20

> diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
> index 4ed201b3b3..37a7db5395 100644
> --- a/tools/libs/call/Makefile
> +++ b/tools/libs/call/Makefile
> @@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   +=3D solaris.c
>   SRCS-$(CONFIG_NetBSD)  +=3D netbsd.c
>   SRCS-$(CONFIG_MiniOS)  +=3D minios.c
>  =20
> +PKG_OLD_ABI =3D ../abi/libxen$(LIBNAME).so.1.2-$(XEN_TARGET_ARCH)-abi.=
dump
> +

Any reason you don't add

PKG_OLD_ABI =3D=20
=2E./abi/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)-$(XEN_TARGET_ARCH)-abi.dum=
p

to tools/libs/libs.mk, maybe with some way to override/disable the
setting (e.g. by setting a different value for PKG_OLD_ABI just
after including $(XEN_ROOT)/tools/libs/libs.mk) ?

You could even disable the ABI check if there is no map file
provided, which will be the case for all the unstable libs.

This would the need to touch all the stable library Makefiles.


Juergen

--------------D715ADE0B491DA52709A3841
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

--------------D715ADE0B491DA52709A3841--

--PSFzeLbKXobhW6sICOEpE0y50c9lsgypy--

--qT09KfmBFOVnsPA7LfIZeD4sXdjSKLwlp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA+F1cFAwAAAAAACgkQsN6d1ii/Ey/m
OwgAikJJuGkc8NwJCgmcAwWq2nS4s6qIxKxLpuwBslmHvUIlDy1uANhivJm37a2je/3KqtIu89XQ
KeHYmEfam+9blfx5h6LMCF6fJF5Dw7LyBllHNfPqJF8wmCsdd+pemnsPxq22UfF7DEFOAgKjdVej
J71ZAHGzAU3/gPuwhPkcMQDjzdayxqF5vpWsoJFTLZ9OmWuiwpUjRBaJEgOksOtze80AfLSOLBNw
3h2Z1XyTdh5p4q++b4nSSovWgeSYQ0DK+IlBU1Pj+yWUrzImGZZ2fGvmft1/35ToPImjbZI/KxdS
9zBGbAddSdV/zdx41EJmPHip1pOKhA1jkvcXgjhf1Q==
=L/Ds
-----END PGP SIGNATURE-----

--qT09KfmBFOVnsPA7LfIZeD4sXdjSKLwlp--

