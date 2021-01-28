Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E92306D05
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 06:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76545.138159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l500h-0002OI-DV; Thu, 28 Jan 2021 05:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76545.138159; Thu, 28 Jan 2021 05:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l500h-0002Nt-AS; Thu, 28 Jan 2021 05:38:27 +0000
Received: by outflank-mailman (input) for mailman id 76545;
 Thu, 28 Jan 2021 05:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e8hV=G7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l500f-0002No-5G
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 05:38:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c2aff99-82ee-462d-813c-5637f85457f6;
 Thu, 28 Jan 2021 05:38:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1885AACE1;
 Thu, 28 Jan 2021 05:38:23 +0000 (UTC)
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
X-Inumbo-ID: 0c2aff99-82ee-462d-813c-5637f85457f6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611812303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AmBXzMfSQ7Z1XKoS3QJzbX3c6w0ICyaca4aD9EYB5c4=;
	b=MmZv2SKZsqazBCNCs0DE4FwF6CQlYI0mH5zklsOPgud8Vpya7+CpxnOjfYodG6L7UTtEaZ
	H8b9B8H18734w2T+EMR3kmD3xMftmaOM3gXzAJm+EXegems6ia7UmEERQgts3Du1YtDyIH
	ZRQEcXurKzhitLg8GuTOFdkzLpxSx0I=
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20210128031653.1640771-1-marmarek@invisiblethingslab.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH] xen: Add RING_COPY_RESPONSE()
Message-ID: <680d6622-9876-c6ab-7554-705de4498c16@suse.com>
Date: Thu, 28 Jan 2021 06:38:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128031653.1640771-1-marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S8QalFvcFX25Iz9eYEIlyeOnD9QT6RRxO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S8QalFvcFX25Iz9eYEIlyeOnD9QT6RRxO
Content-Type: multipart/mixed; boundary="MvG2Kua5OhodzLwLQN0ly7Iu1VnTnoLUV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <680d6622-9876-c6ab-7554-705de4498c16@suse.com>
Subject: Re: [PATCH] xen: Add RING_COPY_RESPONSE()
References: <20210128031653.1640771-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20210128031653.1640771-1-marmarek@invisiblethingslab.com>

--MvG2Kua5OhodzLwLQN0ly7Iu1VnTnoLUV
Content-Type: multipart/mixed;
 boundary="------------51992D80ECA25022D99B581C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------51992D80ECA25022D99B581C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.01.21 04:16, Marek Marczykowski-G=C3=B3recki wrote:
> Using RING_GET_RESPONSE() on a shared ring is easy to use incorrectly
> (i.e., by not considering that the other end may alter the data in the
> shared ring while it is being inspected). Safe usage of a response
> generally requires taking a local copy.
>=20
> Provide a RING_COPY_RESPONSE() macro to use instead of
> RING_GET_RESPONSE() and an open-coded memcpy().  This takes care of
> ensuring that the copy is done correctly regardless of any possible
> compiler optimizations.
>=20
> Use a volatile source to prevent the compiler from reordering or
> omitting the copy.
>=20
> This generalizes similar RING_COPY_REQUEST() macro added in 3f20b8def0.=

>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> ---
>   xen/include/public/io/ring.h | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.=
h
> index d68615ae2f67..b63d7362f0e9 100644
> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -231,22 +231,25 @@ typedef struct __name##_back_ring __name##_back_r=
ing_t
>   #define RING_GET_REQUEST(_r, _idx)                                   =
   \
>       (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
>  =20
> +#define RING_GET_RESPONSE(_r, _idx)                                   =
  \
> +    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
> +
>   /*
> - * Get a local copy of a request.
> + * Get a local copy of a request/response.
>    *
> - * Use this in preference to RING_GET_REQUEST() so all processing is
> + * Use this in preference to RING_GET_{REQUEST,RESPONSE}() so all proc=
essing is
>    * done on a local copy that cannot be modified by the other end.
>    *
>    * Note that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58145 may=
 cause this
>    * to be ineffective where _req is a struct which consists of only bi=
tfields.
>    */
> -#define RING_COPY_REQUEST(_r, _idx, _req) do {				\
> +#define RING_COPY_(action, _r, _idx, _req) do {				\

What about renaming _req to _dest in order to reflect that it can be
a request _or_ a response?

"action" is misnamed, IMO. What about "type"?

>   	/* Use volatile to force the copy into _req. */			\
> -	*(_req) =3D *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);	\
> +	*(_req) =3D *(volatile typeof(_req))RING_GET_##action(_r, _idx);	\
>   } while (0)
>  =20
> -#define RING_GET_RESPONSE(_r, _idx)                                   =
  \
> -    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
> +#define RING_COPY_REQUEST(_r, _idx, _req)  RING_COPY_(REQUEST, _r, _id=
x, _req)
> +#define RING_COPY_RESPONSE(_r, _idx, _req) RING_COPY_(RESPONSE, _r, _i=
dx, _req)

Use _rsp instead of _req for RING_COPY_RESPONSE()?


Juergen

--------------51992D80ECA25022D99B581C
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

--------------51992D80ECA25022D99B581C--

--MvG2Kua5OhodzLwLQN0ly7Iu1VnTnoLUV--

--S8QalFvcFX25Iz9eYEIlyeOnD9QT6RRxO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmASTc4FAwAAAAAACgkQsN6d1ii/Ey94
bgf+II2ycHI5FUAMTBJyBYrOARmmkOg8hqzMUy2QY3bfquUgVdw093sg6sGhwoKwDE2u6pZe2vv2
MqiQBz+JlAkdQSKHHCJQtIN3ZXDPwjTAuL5IB1muaCcaEa0EB4xKp3DeWECOyJEG4Pbuph80K1TE
t+kgUl6u11OSEUrCrao1xtGufwi90Xd5/s3dEZO9FO6cyQ8e2SIiLW7M6ZyvjGdWql+V4sACnbbf
bRyrgd9hpEWD4hFjUkxq8RQNq+nJVP0qjaif7lV+PdZMmAuDAb++sqt0tpLaMSjmumhYlYb/KMO/
WiBBczRuEv4pASQJFcCWivQPID5IuetQKDHPjnRe4w==
=vmZ3
-----END PGP SIGNATURE-----

--S8QalFvcFX25Iz9eYEIlyeOnD9QT6RRxO--

