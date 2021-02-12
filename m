Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105731A257
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 17:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84362.158213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAazJ-0004rt-4E; Fri, 12 Feb 2021 16:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84362.158213; Fri, 12 Feb 2021 16:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAazJ-0004rU-0l; Fri, 12 Feb 2021 16:08:09 +0000
Received: by outflank-mailman (input) for mailman id 84362;
 Fri, 12 Feb 2021 16:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DDLl=HO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lAazH-0004rP-03
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 16:08:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 554b83a8-3006-4472-bdf9-4365c5a67bf4;
 Fri, 12 Feb 2021 16:08:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2263FB773;
 Fri, 12 Feb 2021 16:08:05 +0000 (UTC)
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
X-Inumbo-ID: 554b83a8-3006-4472-bdf9-4365c5a67bf4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613146085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EBTa6uQGZ2JnAJEQi8Cw9Dd3OJRkwy7U15wp9gpQuvc=;
	b=ogw4o064XnfXXXNOk4TKdvuLhcVnONSacDQZweKnSFjK/jf3Q/6FQBAbDH7j5maxzax+rB
	8ORmYcxzYY8xD5av+VSifUlka/jlFRWVLulZ7xnorFt8E1+RxTMyZGbZz6XqDAao9JfCAY
	TPFrDDCBy+R6LTYaG1214mihzPDP3JY=
Subject: Re: [PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in
 lu_read_state()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-7-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cea38f47-7dc3-ea67-104a-e5b1899a7f3b@suse.com>
Date: Fri, 12 Feb 2021 17:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212153953.4582-7-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RB8B3HmeeuY4YhLkuLHMPNaKjUGqpdzne"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RB8B3HmeeuY4YhLkuLHMPNaKjUGqpdzne
Content-Type: multipart/mixed; boundary="pKKo9JB3kWQkMvqkyPhiol9jY1VJMC2Di";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <cea38f47-7dc3-ea67-104a-e5b1899a7f3b@suse.com>
Subject: Re: [PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in
 lu_read_state()
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-7-andrew.cooper3@citrix.com>
In-Reply-To: <20210212153953.4582-7-andrew.cooper3@citrix.com>

--pKKo9JB3kWQkMvqkyPhiol9jY1VJMC2Di
Content-Type: multipart/mixed;
 boundary="------------FEDE9DAFA83136D86D129C31"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FEDE9DAFA83136D86D129C31
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.02.21 16:39, Andrew Cooper wrote:
> Various version of gcc, when compiling with -Og, complain:
>=20
>    xenstored_control.c: In function =E2=80=98lu_read_state=E2=80=99:
>    xenstored_control.c:540:11: error: =E2=80=98state.size=E2=80=99 is u=
sed uninitialized in this
>    function [-Werror=3Duninitialized]
>      if (state.size =3D=3D 0)
>          ~~~~~^~~~~
>    xenstored_control.c:543:6: error: =E2=80=98state.buf=E2=80=99 may be=
 used uninitialized in
>    this function [-Werror=3Dmaybe-uninitialized]
>      pre =3D state.buf;
>      ~~~~^~~~~~~~~~~
>    xenstored_control.c:550:23: error: =E2=80=98state.buf=E2=80=99 may b=
e used uninitialized in
>    this function [-Werror=3Dmaybe-uninitialized]
>       (void *)head - state.buf < state.size;
>                      ~~~~~^~~~
>    xenstored_control.c:550:35: error: =E2=80=98state.size=E2=80=99 may =
be used uninitialized in
>    this function [-Werror=3Dmaybe-uninitialized]
>       (void *)head - state.buf < state.size;
>                                  ~~~~~^~~~~
>=20
> Interestingly, this is only in the stubdom build.  I can't identify any=

> relevant differences vs the regular tools build.

But me. :-)

lu_get_dump_state() is empty for the stubdom case (this will change when
LU is implemented for stubdom, too). In the daemon case this function is
setting all the fields which are relevant.

>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------FEDE9DAFA83136D86D129C31
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

--------------FEDE9DAFA83136D86D129C31--

--pKKo9JB3kWQkMvqkyPhiol9jY1VJMC2Di--

--RB8B3HmeeuY4YhLkuLHMPNaKjUGqpdzne
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAmp+QFAwAAAAAACgkQsN6d1ii/Ey//
1wf+M+x1gMb3ErfWAlF9kE+gqqtRiO2UMDB5K0h+/RvaWoPrhbFnUeCyAZ11Vp8e4I0F1R+NMeCy
/KDrKL8ZbPkcFDUUjmhoLxDVkhwWHI0oiVfTcfD2pNmK8nYyTE7ItXDOnT6WPaKQLLq4hMX7MORA
h4d6v8F9zD1bRShKKfHFnxxTJpuj10yXS0QAyyA7ZKMt745HQsFOmBg5u4LiiEDdharqsQOhI7Vj
cTADhdAcisPmgnXsoyXaKOg93SJ+7rBT/H8beTK7TE/0sPlL5KMxP7Hdam5H9SZY6YL1EN8IFT9P
u7bgXjPQWSsXHHbXY6AmHMkO2RvQZLPuEKFn58SMvQ==
=zNBf
-----END PGP SIGNATURE-----

--RB8B3HmeeuY4YhLkuLHMPNaKjUGqpdzne--

