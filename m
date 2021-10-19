Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437064336AE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213197.371345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoqT-0004ql-VH; Tue, 19 Oct 2021 13:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213197.371345; Tue, 19 Oct 2021 13:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoqT-0004oy-RP; Tue, 19 Oct 2021 13:07:57 +0000
Received: by outflank-mailman (input) for mailman id 213197;
 Tue, 19 Oct 2021 13:07:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcoqS-0004os-BU
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:07:56 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fc6fe03-a34d-4816-b964-1595102b2833;
 Tue, 19 Oct 2021 13:07:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8D7621A93;
 Tue, 19 Oct 2021 13:07:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1DE913CC9;
 Tue, 19 Oct 2021 13:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QmUzKirDbmHhJQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Oct 2021 13:07:54 +0000
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
X-Inumbo-ID: 2fc6fe03-a34d-4816-b964-1595102b2833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634648874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ6UWPgStl8cPJHXbxwStnAGwOYnh680a8RYn4T+NGA=;
	b=IzPmeWenC4Fp40o6ciUIaAiwNbkuatLDzHasiXfb86S+0sb27IPxfLrAqk9KITWl2SUEGe
	yrAiNBP8oKwkL3/kOMuz73RDb9l32Jvssh9wE2sraMnlzz79eEik1NO0vaDISCIUBYvGyy
	7GoZKf2mxRA7gsVTvEbyYWPDy6yYf6Y=
Subject: Re: [PATCH] OSStest: explicitly enable building qemu-traditional
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org
References: <20211019130211.32233-1-jgross@suse.com>
 <24942.49760.686147.851391@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <152bf281-6921-42bd-a87a-054056a385ff@suse.com>
Date: Tue, 19 Oct 2021 15:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24942.49760.686147.851391@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NxW4JdUChGlCBZ4hRvHt4CqR4Wy8xR0fC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NxW4JdUChGlCBZ4hRvHt4CqR4Wy8xR0fC
Content-Type: multipart/mixed; boundary="87fFNOMLy7vyutFoReN2k9nty8heZcOz2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Message-ID: <152bf281-6921-42bd-a87a-054056a385ff@suse.com>
Subject: Re: [PATCH] OSStest: explicitly enable building qemu-traditional
References: <20211019130211.32233-1-jgross@suse.com>
 <24942.49760.686147.851391@mariner.uk.xensource.com>
In-Reply-To: <24942.49760.686147.851391@mariner.uk.xensource.com>

--87fFNOMLy7vyutFoReN2k9nty8heZcOz2
Content-Type: multipart/mixed;
 boundary="------------60E24F63DAA496CBCFADFCD9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------60E24F63DAA496CBCFADFCD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.10.21 15:04, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH] OSStest: explicitly enable building qemu=
-traditional"):
>> It is planned to no longer build qemu-traditional per default.
>>
>> In order to be able to continue running tests with ioemu-stubdom run
>> configure with --enable-qemu-traditional.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
>=20
> OOI, have you done any kind of test on this ?

No, this was a pure "lets do things in a similar way as the other
options" approach.

> I'm kind of inclined to just push it and let osstest's pre-production
> self-test test it.

You are in a far better position than me to decide this. :-)


Juergen

--------------60E24F63DAA496CBCFADFCD9
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------60E24F63DAA496CBCFADFCD9--

--87fFNOMLy7vyutFoReN2k9nty8heZcOz2--

--NxW4JdUChGlCBZ4hRvHt4CqR4Wy8xR0fC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFuwyoFAwAAAAAACgkQsN6d1ii/Ey/3
NQf+Kk+pYHTbPeLcMrcTV4Gij43N0lXcQ474NRu1dh0N/WqyxF6WGBaj8EgBY8E/EsLNitS6shtg
lA5jZ2k1/+f2iQwEbpex3Y4zRekPA5uwunKVZsLV7KYCPHYNntHyaDlfi0H4L3eBhN1U2ZSoMgyM
o61Wu8ZtBA4FpCyTg9ScSuodw5SKf562Moxi5Rp9A3qPQtzhWneYo4+2+x61xvKqlYhu6bg8RAzS
Cp8mQl+/3YpWsLPjbToU1DiJaKIHrNnfQnD9NVPVWLMI9cGGtOKi53Wku8w2BeOELnabIxjL7nqi
9MaW+u401IW75CZvSCH3Znl2wuepFekLUhb153/Qsg==
=vAzo
-----END PGP SIGNATURE-----

--NxW4JdUChGlCBZ4hRvHt4CqR4Wy8xR0fC--

