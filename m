Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D598C32A41F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 16:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92459.174371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH71U-0001ji-5P; Tue, 02 Mar 2021 15:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92459.174371; Tue, 02 Mar 2021 15:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH71U-0001jN-1s; Tue, 02 Mar 2021 15:33:20 +0000
Received: by outflank-mailman (input) for mailman id 92459;
 Tue, 02 Mar 2021 15:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRZ7=IA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lH71S-0001jI-Os
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 15:33:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66eeeeda-9ab0-4c9c-b4bc-9de135446c72;
 Tue, 02 Mar 2021 15:33:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 252F4ABF4;
 Tue,  2 Mar 2021 15:33:17 +0000 (UTC)
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
X-Inumbo-ID: 66eeeeda-9ab0-4c9c-b4bc-9de135446c72
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614699197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VUbQBz0+/7UJgiejbhrKKI+eu6d5ntlrWmo6Po66sHY=;
	b=Lx4L6a2iGTfPq4EWv2NtoQQ8ktOcIzg2I98vsP9kBK5KBiSPKMaIOKdP/wKwYdHJcxz0r7
	aNvR2KaG1TvL/gOzFmn1TOqRAHhMBNC03SNgVBhDDTsQWnvyftpT2U1MMP7h0VFT9ngUdY
	Q+l/CGi1BUJ9XNbOPnaALjLgqplXrdw=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
References: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: xenstore_lib.h and libxenstore API/ABI problems
Message-ID: <ec572c8a-3d30-bd0a-a880-1c00575b56f6@suse.com>
Date: Tue, 2 Mar 2021 16:33:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a88a10rAWhm449WhO6nBDZTmHAzESCZZT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a88a10rAWhm449WhO6nBDZTmHAzESCZZT
Content-Type: multipart/mixed; boundary="yU1obsVrD3PEktxFSwlBcY6o4XSgMmuD7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <ec572c8a-3d30-bd0a-a880-1c00575b56f6@suse.com>
Subject: Re: xenstore_lib.h and libxenstore API/ABI problems
References: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
In-Reply-To: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>

--yU1obsVrD3PEktxFSwlBcY6o4XSgMmuD7
Content-Type: multipart/mixed;
 boundary="------------D6B0B3E97EAA32A83E8B76D1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D6B0B3E97EAA32A83E8B76D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.03.21 16:23, Andrew Cooper wrote:
> Hello,
>=20
> This is a total mess.
>=20
> libxenstored does not have a stable ABI.=C2=A0 xenstore_lib.h contains:=

>=20
> * struct xs_permissions, which contains an enum - one of the very commo=
n
> ABI traps.
>=20
> * the prototypes for expanding_buffer_ensure(), sanitise_value() and
> unsanitise_value(), which are inappropriately-namespaced symbols in
> libxenstore
>=20
> * struct expanding_buffer with a classic string-handling trap (int len)=
=2E
>=20
> * Various xenstored-internal details such as struct xs_tdb_record_hdr,
> the internal permission bits, as well as stuff like
> xs_daemon_{root,run}dir(), and worse xs_daemon_tdb(),=C2=A0 which have
> absolutely no business being external to xenstored.
>=20
>=20
> Its clear that most of this shouldn't be part of libxenstore, but that
> ship has sailed.=C2=A0 3.0.3 is broken and cannot be fixed.
>=20
> My best suggestion is that we freeze 3.0.3 where it is, and create a 4.=
0
> which has all of the xenstore_lib.h content deleted.=C2=A0 That, AFAICT=
, gets
> us something which is 99% compatible, and stands a chance of being able=

> to kept properly stable.
>=20
> Thoughts?

How would that work in practice?

Would we ship both libraries, or only 4.0?


Juergen




--------------D6B0B3E97EAA32A83E8B76D1
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

--------------D6B0B3E97EAA32A83E8B76D1--

--yU1obsVrD3PEktxFSwlBcY6o4XSgMmuD7--

--a88a10rAWhm449WhO6nBDZTmHAzESCZZT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA+WrwFAwAAAAAACgkQsN6d1ii/Ey9B
Lgf7BiOfDePi4gXvrOKvEAnWPXi3LfzhFRufdBFK6IJTJf1QzpugZveYmeSkhAnoQrMXqAd6XyXm
IcPT5wtqK1NM4kBLJ/jJiQQ1ZYlSpTxBR+fAqPNb9LTlRchh5McAnGMcgCaYgWmGL/hyhS3urzUb
iwJ1xEbdHz5iEjz6q1TaLRYPxK5AEASYRgBhFQ+CF1CF4Srn5jCr5aAqDc5o7uxlS+TEPHhq5uhY
QtnFO2827g1pRqZvwo8upyyFqXzIBBKTCKLQU2SKoTuI16l1bsCQ0E0nELDHib9UQGhrvfPtg7oU
MepaUJhxs/YDq8bIj9ixtkhxPXpu9LNnw+/bUNyNFw==
=dT+o
-----END PGP SIGNATURE-----

--a88a10rAWhm449WhO6nBDZTmHAzESCZZT--

