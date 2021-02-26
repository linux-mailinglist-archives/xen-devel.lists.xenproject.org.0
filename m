Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F4325E06
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 08:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90097.170422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFXGZ-00033L-VP; Fri, 26 Feb 2021 07:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90097.170422; Fri, 26 Feb 2021 07:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFXGZ-00032v-Qm; Fri, 26 Feb 2021 07:10:23 +0000
Received: by outflank-mailman (input) for mailman id 90097;
 Fri, 26 Feb 2021 07:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScZz=H4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lFXGY-00032q-BD
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 07:10:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f061eb7e-2dcf-4b0e-8f64-f96c4635e391;
 Fri, 26 Feb 2021 07:10:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B88DAD5C;
 Fri, 26 Feb 2021 07:10:20 +0000 (UTC)
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
X-Inumbo-ID: f061eb7e-2dcf-4b0e-8f64-f96c4635e391
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614323420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQKRD2mZy1LZevXZyA5w0flN+3E9nGvJDoetL244laM=;
	b=o/1ARpcODT38CQnJnlnIV1mqKGQe6poQaBbMk830V/DyKN8PwEkD87nDW2TDHMosKd9LwQ
	wwhy5d3+MEYxnNZaVKI8XJM7aEt0zf53tfz8NelwCl+QGy1l5un99KzIWQQZAEoeF/KJCi
	RY1m4PjUVt7WZzhDAoauBrtZCAsQI6k=
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0aa89914-8fae-3731-a5a0-ccf4316ce96b@suse.com>
Date: Fri, 26 Feb 2021 08:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225174131.10115-6-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5CVZ0FJ0G3RmnqH7vgLQMgsmFxwEJPkfG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5CVZ0FJ0G3RmnqH7vgLQMgsmFxwEJPkfG
Content-Type: multipart/mixed; boundary="yGZAsfZcPasZlSmROHZHvDvBimiGSZPsP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>
Message-ID: <0aa89914-8fae-3731-a5a0-ccf4316ce96b@suse.com>
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
In-Reply-To: <20210225174131.10115-6-julien@xen.org>

--yGZAsfZcPasZlSmROHZHvDvBimiGSZPsP
Content-Type: multipart/mixed;
 boundary="------------AB235C8C38FF36930B2925B3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AB235C8C38FF36930B2925B3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.02.21 18:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Coverity will report unitialized values for every use of xs_state_*
> structures in the save part. This can be prevented by using the [0]
> rather than [] to define variable length array.
>=20
> Coverity-ID: 1472398
> Coverity-ID: 1472397
> Coverity-ID: 1472396
> Coverity-ID: 1472395
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Sorry, but Coverity is clearly wrong here.

Should we really modify our code to work around bugs in external
static code analyzers?


Juergen

>=20
> ---
>=20
>  From my understanding, the tools and the hypervisor already rely on GN=
U
> extensions. So the change should be fine.
>=20
> If not, we can use the same approach as XEN_FLEX_ARRAY_DIM.
> ---
>   tools/xenstore/include/xenstore_state.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/i=
nclude/xenstore_state.h
> index ae0d053c8ffc..407d9e920c0f 100644
> --- a/tools/xenstore/include/xenstore_state.h
> +++ b/tools/xenstore/include/xenstore_state.h
> @@ -86,7 +86,7 @@ struct xs_state_connection {
>       uint16_t data_in_len;    /* Number of unprocessed bytes read from=
 conn. */
>       uint16_t data_resp_len;  /* Size of partial response pending for =
conn. */
>       uint32_t data_out_len;   /* Number of bytes not yet written to co=
nn. */
> -    uint8_t  data[];         /* Pending data (read, written) + 0-7 pad=
 bytes. */
> +    uint8_t  data[0];         /* Pending data (read, written) + 0-7 pa=
d bytes. */
>   };
>  =20
>   /* Watch: */
> @@ -94,7 +94,7 @@ struct xs_state_watch {
>       uint32_t conn_id;       /* Connection this watch is associated wi=
th. */
>       uint16_t path_length;   /* Number of bytes of path watched (incl.=
 0). */
>       uint16_t token_length;  /* Number of bytes of watch token (incl. =
0). */
> -    uint8_t data[];         /* Path bytes, token bytes, 0-7 pad bytes.=
 */
> +    uint8_t data[0];        /* Path bytes, token bytes, 0-7 pad bytes.=
 */
>   };
>  =20
>   /* Transaction: */
> @@ -125,7 +125,7 @@ struct xs_state_node {
>   #define XS_STATE_NODE_TA_WRITTEN  0x0002
>       uint16_t perm_n;        /* Number of permissions (0 in TA: node d=
eleted). */
>       /* Permissions (first is owner, has full access). */
> -    struct xs_state_node_perm perms[];
> +    struct xs_state_node_perm perms[0];
>       /* Path and data follows, plus 0-7 pad bytes. */
>   };
>   #endif /* XENSTORE_STATE_H */
>=20


--------------AB235C8C38FF36930B2925B3
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

--------------AB235C8C38FF36930B2925B3--

--yGZAsfZcPasZlSmROHZHvDvBimiGSZPsP--

--5CVZ0FJ0G3RmnqH7vgLQMgsmFxwEJPkfG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA4ntsFAwAAAAAACgkQsN6d1ii/Ey8W
Ywf/f3yjOjwcL4BdlS5l76In2wRed9FMpWfpU3BJ6Y9vo86JlW4RPaKRu7TNzZwdDSSiPwAbdwPu
9N7jyhzpUK2xfB7uasPksijVebz8YpiRl4AwomD7pblqU2O21NccOohWAi6rTo2+hXW9r6KENeoj
No/aEqBJaz9Td0IO5eicNPiYWjCLOBT49FJ+bExdq/+k+LJWZjHO00nU/ethhsYmDzxfe6vGrrGs
wEvuMYi1M/LyoT7pc+CBtIl2mHtGi6j9wmkLj5gQ+1rrxr5v29xvMStHAOsoxmrilAphDQcTIilX
NOQGC8eFlQTWJj/DsiT8mxVsw5lyg6Ccg3hDdNi7EA==
=BcoI
-----END PGP SIGNATURE-----

--5CVZ0FJ0G3RmnqH7vgLQMgsmFxwEJPkfG--

