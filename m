Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42EB34D260
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 16:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103083.196701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQsso-0002t7-3f; Mon, 29 Mar 2021 14:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103083.196701; Mon, 29 Mar 2021 14:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQsso-0002si-01; Mon, 29 Mar 2021 14:28:46 +0000
Received: by outflank-mailman (input) for mailman id 103083;
 Mon, 29 Mar 2021 14:28:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmlW=I3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lQssn-0002sd-5W
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:28:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d80282e-2cb1-4a45-bf04-99e6c39139f3;
 Mon, 29 Mar 2021 14:28:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B365B12E;
 Mon, 29 Mar 2021 14:28:42 +0000 (UTC)
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
X-Inumbo-ID: 1d80282e-2cb1-4a45-bf04-99e6c39139f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617028122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMNJ6vkDZaoX2QWSoLnMWeq3PjhEM7b/xbkUeKtx1D8=;
	b=CQKZBJH46Q91eFCjs6seAq6I3J1pxVLUcMUNvzu4CQMTGE36tnTiVFvm4yUiG4bhVWOyz3
	QAB399soPWOIj/OGtp6HE7xgzJPh+kkzd+F0meR95PRx6Alzpp6CUV0Hf+oJpqEdBm4a6P
	dBMT07BfGH0A/kSSWokkubsdjR83q4g=
Subject: Re: [PATCH for-4.15] SUPPORT.md: Specify support lifetime etc. for
 Xen 4.15
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, security@xenproject.org,
 community.manager@xenproject.org
References: <24673.58219.875762.61434@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8feca2c2-e262-4202-f186-1edd22fe2a6f@suse.com>
Date: Mon, 29 Mar 2021 16:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24673.58219.875762.61434@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rFavNWq9wqO3Ct7vgDgQClaY2tp2qTCwM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rFavNWq9wqO3Ct7vgDgQClaY2tp2qTCwM
Content-Type: multipart/mixed; boundary="cpwHIGoFhuGfXRSpiA528EOmsz7PLwLel";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, security@xenproject.org,
 community.manager@xenproject.org
Message-ID: <8feca2c2-e262-4202-f186-1edd22fe2a6f@suse.com>
Subject: Re: [PATCH for-4.15] SUPPORT.md: Specify support lifetime etc. for
 Xen 4.15
References: <24673.58219.875762.61434@mariner.uk.xensource.com>
In-Reply-To: <24673.58219.875762.61434@mariner.uk.xensource.com>

--cpwHIGoFhuGfXRSpiA528EOmsz7PLwLel
Content-Type: multipart/mixed;
 boundary="------------8F22F4B9A483E3B0036A30F1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8F22F4B9A483E3B0036A30F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.03.21 16:25, Ian Jackson wrote:
> I am currently hoping to be able to release on the 8th of April.  In
> that case, I propose the attached policy patch for SUPPORT.md.
>=20
> Ian.
>=20
> From: Ian Jackson <iwj@xenproject.org>
> Date: Mon, 29 Mar 2021 15:23:42 +0100
> Subject: [PATCH] SUPPORT.md: Specify support lifetime etc. for Xen 4.15=

>=20
> CC: committers@xenproject.org
> CC: security@xenproject.org
> CC: community.manager@xenproject.org
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>   SUPPORT.md | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index a1efd8fcfd..a2efc146c6 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,10 +9,10 @@ for the definitions of the support status levels etc.=

>  =20
>   # Release Support
>  =20
> -    Xen-Version: 4.15-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.15
> +    Initial-Release: 2021-04-08
> +    Supported-Until: 2022-10-08
> +    Security-Support-Until: 2024-04-08
>  =20
>   Release Notes
>   : <a href=3D"https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Releas=
e_Notes">RN</a>

You might as well adapt the link for the Release Notes, too.


Juergen


--------------8F22F4B9A483E3B0036A30F1
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

--------------8F22F4B9A483E3B0036A30F1--

--cpwHIGoFhuGfXRSpiA528EOmsz7PLwLel--

--rFavNWq9wqO3Ct7vgDgQClaY2tp2qTCwM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBh5BkFAwAAAAAACgkQsN6d1ii/Ey9s
kAgAj/QSTm/Tn0qHXAXKRth8sN9RpyxMW7JbjkH3P/IShKu/csADsoub7G+ap8TAhbzj3E7ndAkv
EFIpa3PhzH7HJ8+BCeIbfeEOoHWfkfy1QJpx8eoM1cCD4PxF4In/H73A2hJeXIDsStTwghSmzYl+
9dHXV8xuiwpemtHdUMOn+CWXOCX23gCIh1q5K5PefzP3jtIR31OXfF023pWMmOnmgvjT6Syie0JD
Xb/Cz31vWfk55EAwnWL1QhUrecEqAy0C3/cwuHx7SdhG7N8GoHcLZ7xQgzZOjmOCcJjIWinvF/3Q
iivK0ZJN+vZa7OlwMgFD0U6PJay1o051b878Rn93jw==
=pQqU
-----END PGP SIGNATURE-----

--rFavNWq9wqO3Ct7vgDgQClaY2tp2qTCwM--

