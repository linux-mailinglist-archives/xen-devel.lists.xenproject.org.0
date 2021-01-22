Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7823008A7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72960.131529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zJ6-0001CK-1Q; Fri, 22 Jan 2021 16:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72960.131529; Fri, 22 Jan 2021 16:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zJ5-0001Bv-UC; Fri, 22 Jan 2021 16:29:07 +0000
Received: by outflank-mailman (input) for mailman id 72960;
 Fri, 22 Jan 2021 16:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2lNi=GZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2zJ4-0001Bq-PG
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:29:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac43f6e0-144e-4a1e-93da-5a11f36ced3c;
 Fri, 22 Jan 2021 16:29:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDEFDAF55;
 Fri, 22 Jan 2021 16:29:03 +0000 (UTC)
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
X-Inumbo-ID: ac43f6e0-144e-4a1e-93da-5a11f36ced3c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611332943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9OcdWRVpdGdF146z9KEvRVEEhUPFex/VcJBukiZm3S8=;
	b=WOQ075ZDQh8Ry2KEccJHZ/9KPCfNMy/UW2M1hOTuLFb0wBRoojJzju1V7RiVdYplP9mvx3
	tHQ9n0LBYEI48QTUqSpzOLSnwPQvtlQHhyPiPahs/BHtFMwm8iDXAFyfM/Sr3cxgV+hy7E
	TGApwq6NEWUnOPTYEoW/wj309FJe6hQ=
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
 <20210122155603.23402-7-iwj@xenproject.org>
 <0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
 <24586.64456.905401.474099@mariner.uk.xensource.com>
 <3c119c18-b020-bfb3-3a13-dd39f4c37241@suse.com>
 <24586.64690.177873.712218@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aadab8b1-c758-1943-f9cc-9f68b2d7096a@suse.com>
Date: Fri, 22 Jan 2021 17:29:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24586.64690.177873.712218@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5hZ8H86HxBP10LjZOi9iazEZ3DpCRJXap"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5hZ8H86HxBP10LjZOi9iazEZ3DpCRJXap
Content-Type: multipart/mixed; boundary="OxtlyjycaRw15gcVRS4X0fUPNOeFyfx1v";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
 Wei Liu <wl@xen.org>
Message-ID: <aadab8b1-c758-1943-f9cc-9f68b2d7096a@suse.com>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
References: <20210122155603.23402-1-iwj@xenproject.org>
 <20210122155603.23402-7-iwj@xenproject.org>
 <0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
 <24586.64456.905401.474099@mariner.uk.xensource.com>
 <3c119c18-b020-bfb3-3a13-dd39f4c37241@suse.com>
 <24586.64690.177873.712218@mariner.uk.xensource.com>
In-Reply-To: <24586.64690.177873.712218@mariner.uk.xensource.com>

--OxtlyjycaRw15gcVRS4X0fUPNOeFyfx1v
Content-Type: multipart/mixed;
 boundary="------------144AAF9C5E31E3C6F3CC824C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------144AAF9C5E31E3C6F3CC824C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.01.21 17:26, Ian Jackson wrote:
> J=C3=BCrgen Gro=C3=9F writes ("Re: [OSSTEST PATCH 7/7] make-flight: Str=
ipy xenstored"):
>> There is only stub C xenstored in our build.
>=20
> I should have looked myself, shouldn't I:
>=20
> -rw-r--r-- 1 osstest osstest  233391 Jan 21 22:14 xenstorepvh-stubdom.g=
z
> -rw-r--r-- 1 osstest osstest  232653 Jan 21 22:14 xenstore-stubdom.gz
>  =20
> Oh so many options!

xenstorepvh-stubdom.gz isn't functional yet, but I hope to change that
in the 4.16 timeframe.


Juergen

--------------144AAF9C5E31E3C6F3CC824C
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

--------------144AAF9C5E31E3C6F3CC824C--

--OxtlyjycaRw15gcVRS4X0fUPNOeFyfx1v--

--5hZ8H86HxBP10LjZOi9iazEZ3DpCRJXap
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAK/U4FAwAAAAAACgkQsN6d1ii/Ey+n
QAf/TuVMe+/i4LFkYuHNpTIEv5+1cyeogT3NKPKRiGUGQ+iA5knmzIziUYIU4WUVtnziJjgGg6RQ
Puh4qBQV3s4KX52opX1z5+fVD04MOyqoOBANMQ+M0wXzcJ+xjhBOntkJ36quJqaLbgW7Prn83dLQ
Ilm2faX91ttZSAw2gKv3NCELpqHsPoioSIo1aFdomgDL6rnDer1ickU2jQcdT3y07a7JV5x83gBi
ek7Gx2RxtqCoJb88xVTkhPiAfLiNQ4euJfBBSPwr4wPZb1Bti/pY1BCfbHb6QIZv/i8xW4apvSjc
2RRUTsegRqCVlw/SVULpNGSP8hK9G8xriRVS26iJ1w==
=C14y
-----END PGP SIGNATURE-----

--5hZ8H86HxBP10LjZOi9iazEZ3DpCRJXap--

