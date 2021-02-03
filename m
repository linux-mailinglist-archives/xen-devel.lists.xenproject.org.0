Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5C30D9F5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 13:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80913.148411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HU7-0001f0-Ri; Wed, 03 Feb 2021 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80913.148411; Wed, 03 Feb 2021 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HU7-0001eb-OM; Wed, 03 Feb 2021 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 80913;
 Wed, 03 Feb 2021 12:42:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7HU6-0001eW-RT
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 12:42:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65e17e11-91e0-4295-a011-c4e1b6017d45;
 Wed, 03 Feb 2021 12:42:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 188CBAD26;
 Wed,  3 Feb 2021 12:42:13 +0000 (UTC)
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
X-Inumbo-ID: 65e17e11-91e0-4295-a011-c4e1b6017d45
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612356133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91LYg4tGYNtPQ9Oa2Z/x4yec1JUVP0RzZjcMFpFb2w8=;
	b=U/migWGX5VE87spMeRUyJD6zZ8ocPmXvKd+MiEQlAhjM9kxmogkQsqmC94HoAsGvaJkJiR
	QspNzuV4AERiI5ykfVMVRtdHc96Q+nkqvMJAypUuSiy3SbaFy4GI2Eiky09o2GXpRdoL3D
	UJjIT4tmeQDj3EO+hwOOhczn3AHk3og=
Subject: Re: xenstored file descriptor leak
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
References: <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
 <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
 <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
 <20210203123312.GA2906@antioche.eu.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <25ba02f1-ec03-3bdd-b378-946889271969@suse.com>
Date: Wed, 3 Feb 2021 13:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203123312.GA2906@antioche.eu.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ffMcAP9bsnB8FxgIf9Ujp56vHVV5CmbcL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ffMcAP9bsnB8FxgIf9Ujp56vHVV5CmbcL
Content-Type: multipart/mixed; boundary="uBCt7eytPmlC2sArBPgLX7mbF43VdfmK6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
Message-ID: <25ba02f1-ec03-3bdd-b378-946889271969@suse.com>
Subject: Re: xenstored file descriptor leak
References: <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
 <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
 <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
 <20210203123312.GA2906@antioche.eu.org>
In-Reply-To: <20210203123312.GA2906@antioche.eu.org>

--uBCt7eytPmlC2sArBPgLX7mbF43VdfmK6
Content-Type: multipart/mixed;
 boundary="------------84524E00F3DAB670F147AEA8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------84524E00F3DAB670F147AEA8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.02.21 13:33, Manuel Bouyer wrote:
> On Wed, Feb 03, 2021 at 01:21:59PM +0100, J=FCrgen Gro=DF wrote:
>>> Will do
>>>
>>> In the patch I'm going to submit, may I add
>>>
>>> Reviewed-by: J=FCrgen Gro=DF <jgross@suse.com>
>>> ?
>>>
>>
>> Let me see the patch (including commit message) first, please.
>>
>> So just send out as a regular patch, and I'll respond accordingly. :-)=

>=20
> Attached is the new patch.
>=20
> As commit message I suggest:
>=20
> xenstored: close socket connections on error
>=20
> On error, don't keep socket connection in ignored state but close them.=

> When the remote end of a socket is closed, xenstored will flag it as an=

> error and switch the connection to ignored. But on some OSes (e.g.
> NetBSD), poll(2) will return only POLLIN in this case, so sockets in ig=
nored
> state will stay open forever in xenstored (and it will loop with CPU 10=
0%
> busy).
>=20

Uh, this is no regular patch. You've sent correct patches before,
haven't you? The patch should have a Signed-off-by: and in this case a
Fixes: tag as well (hint: the patch breaking your use case was
commit d2fa370d3ef9cbe22d7256c608671cdcdf6e0083). See

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches


Juergen

--------------84524E00F3DAB670F147AEA8
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

--------------84524E00F3DAB670F147AEA8--

--uBCt7eytPmlC2sArBPgLX7mbF43VdfmK6--

--ffMcAP9bsnB8FxgIf9Ujp56vHVV5CmbcL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAamiQFAwAAAAAACgkQsN6d1ii/Ey+9
qAf+JOIicE6OdczwAAU9M37NPtjrh1gjYHufaBUjB73Ym48odISQHlz+pQ1EDdZaYKBIZH9acB9c
jQ1HK54T1s7arWkvXrHjPg2ldGrMFXRlxXzAUaUNJgbQWWF8/jAzHBNw4k8n5vkGZJO9hmUO0gTl
kMTwJa5ySAa0rOWaFre8GgMs3aN+uOnaAEsd06Ob9Ou9ONE9REpwIKI9Ptb9UKFAlzTvHWeGItFN
0lAufCIxDJ7rEkgKKxo6QBe4KOkX1bolxb304GTH/uIitXeTn125OOtWCLUNfhGBC3McFGIBSc87
EUyBGZ60d/ImHurMfU9XmBzUd4nY65Lhx/Kn2/93Og==
=qBzP
-----END PGP SIGNATURE-----

--ffMcAP9bsnB8FxgIf9Ujp56vHVV5CmbcL--

