Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1187E2CD1AD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 09:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43175.77664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkHD-00062I-7P; Thu, 03 Dec 2020 08:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43175.77664; Thu, 03 Dec 2020 08:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkHD-00061x-4M; Thu, 03 Dec 2020 08:47:47 +0000
Received: by outflank-mailman (input) for mailman id 43175;
 Thu, 03 Dec 2020 08:47:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkkHB-00061Q-Ii
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 08:47:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcb0981a-498a-47be-8126-ef64b93b59b8;
 Thu, 03 Dec 2020 08:47:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBBD0ACBA;
 Thu,  3 Dec 2020 08:47:43 +0000 (UTC)
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
X-Inumbo-ID: fcb0981a-498a-47be-8126-ef64b93b59b8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606985263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJELMgFUfE7C1siT3HQlr2UVZB/Mr7EIBBh8OE3FV8I=;
	b=TJLUU53/FAUkx+TKCYKoChI2PXH0mnU/PPNaHmtLnVwea26/58ApPnFbfsowPw5pMNYFuo
	k7LHEQNBXkdrNvY0qk4KTEdNPMl6KzeNKJ3ByUUSnkwh7ocgMq7Dk+EZf6kXOChZ7pM7km
	n7E3ITonl54eLToPC5j+GHCde5gjhaA=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
Message-ID: <c645058b-3e40-46a2-7110-58faa6ff3c6e@suse.com>
Date: Thu, 3 Dec 2020 09:47:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VEkFpObwFhTSj6qienZdOyat8n4DcElII"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VEkFpObwFhTSj6qienZdOyat8n4DcElII
Content-Type: multipart/mixed; boundary="20vixFpbaY814X6wWbBSo8Y3bXthf4mTP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <c645058b-3e40-46a2-7110-58faa6ff3c6e@suse.com>
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
In-Reply-To: <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>

--20vixFpbaY814X6wWbBSo8Y3bXthf4mTP
Content-Type: multipart/mixed;
 boundary="------------4785B4AFAAFA90CB45C9CCAF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4785B4AFAAFA90CB45C9CCAF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.12.20 16:36, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>>   static int hypfs_write(struct hypfs_entry *entry,
>>                          XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned =
long ulen)
>=20
> As a tangent, is there a reason these write functions don't take
> handles of "const void"? (I realize this likely is nothing that
> wants addressing right here.)

Uh, this is harder than I thought.

guest_handle_cast() doesn't handle const guest handle types currently:

hypfs.c:447:58: error: unknown type name =E2=80=98const_void=E2=80=99; di=
d you mean =E2=80=98const=E2=80=99?
          ret =3D hypfs_write(entry, guest_handle_cast(arg3, const_void),=
=20
arg4);
                                                           ^
/home/gross/xen/unstable/xen/include/xen/guest_access.h:26:5: note: in=20
definition of macro =E2=80=98guest_handle_cast=E2=80=99
      type *_x =3D (hnd).p;                         \
      ^~~~

Currently my ideas would be to either:

- add a new macro for constifying a guest handle (type -> const_type)
- add a new macro for casting a guest handle to a const_type
- add typedefs for the const_* types (typedef const x const_x)
- open code the cast

Or am I missing an existing variant?


Juergen

--------------4785B4AFAAFA90CB45C9CCAF
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

--------------4785B4AFAAFA90CB45C9CCAF--

--20vixFpbaY814X6wWbBSo8Y3bXthf4mTP--

--VEkFpObwFhTSj6qienZdOyat8n4DcElII
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Ipi4FAwAAAAAACgkQsN6d1ii/Ey8r
5Qf+MPtNWLvwT/dZdssS2SbXMTf1vkhJ8TpbWd3B3B72/Whdwa0dNqGT6oBmeQGLTanmtn0KTdWb
ErtzAd0rDsESfUw3FREcI6pyKau7rWhBgn+hkdIJLkYl4FuuvJ1HNFULHqSeJqvuGIthr04h9xpx
yJ1UPI29E6uRsV+LSyDUEuydwex6i1ozCd9SKfRwYIyagWfzmvPQigywtb1EibxfEq0HqrABRwmP
+0L8LfIKBAdXaymiGg+T8CPJtJy5SYMQ0GxcG0/mW2+TnG04Ve+01h2i8PoAT6WbSnvzW9m0YyUB
AIfY1KnvIjW8Tkd+M+yISvYDq89DrNV8IXiNdvdltg==
=Zeue
-----END PGP SIGNATURE-----

--VEkFpObwFhTSj6qienZdOyat8n4DcElII--

