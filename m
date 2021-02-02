Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAA30B85B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 08:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80367.146980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6poK-00080C-1q; Tue, 02 Feb 2021 07:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80367.146980; Tue, 02 Feb 2021 07:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6poJ-0007zl-UI; Tue, 02 Feb 2021 07:09:15 +0000
Received: by outflank-mailman (input) for mailman id 80367;
 Tue, 02 Feb 2021 07:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBIp=HE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l6poI-0007zg-Mh
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 07:09:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45f48be8-72fb-4211-ad30-f181e052cf47;
 Tue, 02 Feb 2021 07:09:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D644ACB7;
 Tue,  2 Feb 2021 07:09:11 +0000 (UTC)
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
X-Inumbo-ID: 45f48be8-72fb-4211-ad30-f181e052cf47
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612249751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4dh4Q5FYrIakWqXKf5ONncovH+2kNiot2gUc6eT6xWE=;
	b=lzZK6q12mp2TXt9vhhxOCyeYHd426NIcClX9cqCYvXkLflYV5H3BLCbHmpRC1rzHGTxIG5
	cal8nxj33J+iuRfs5+wNOJ96XB48S8UaRpHcThlX/dut9HBEiTUZdUuVbSYmakGa9zG02z
	/QRtPVlr2YuZ2dUyCYOmNPTliHFmsgo=
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <c7dea44e-8e6d-1b98-b2a4-7e9623a8e3fb@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: dom0 crash in xenvif_rx_ring_slots_available
Message-ID: <15253c8c-6391-bec8-b161-d2d6e8d067e2@suse.com>
Date: Tue, 2 Feb 2021 08:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c7dea44e-8e6d-1b98-b2a4-7e9623a8e3fb@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W4r86Cqr1toa4syKIlnsJdTPSQVuZcZ0x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W4r86Cqr1toa4syKIlnsJdTPSQVuZcZ0x
Content-Type: multipart/mixed; boundary="3ZmydOoyo9936MThrob9EaQIgXO87Ol1j";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <15253c8c-6391-bec8-b161-d2d6e8d067e2@suse.com>
Subject: Re: dom0 crash in xenvif_rx_ring_slots_available
References: <c7dea44e-8e6d-1b98-b2a4-7e9623a8e3fb@citrix.com>
In-Reply-To: <c7dea44e-8e6d-1b98-b2a4-7e9623a8e3fb@citrix.com>

--3ZmydOoyo9936MThrob9EaQIgXO87Ol1j
Content-Type: multipart/mixed;
 boundary="------------C34BD29822F32F2A0450E7D8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C34BD29822F32F2A0450E7D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.02.21 03:29, Igor Druzhinin wrote:
> Juergen,
>=20
> We've got a crash report from one of our customers (see below) running =
4.4 kernel.
> The functions seem to be the new that came with XSA-332 and nothing lik=
e that has been
> reported before in their cloud. It appears there is some use-after-free=
 happening on skb
> in the following code fragment:
>=20
> static bool xenvif_rx_ring_slots_available(struct xenvif_queue *queue)
> {
>          RING_IDX prod, cons;
>          struct sk_buff *skb;
>          int needed;
>=20
>          skb =3D skb_peek(&queue->rx_queue);
>          if (!skb)
>                  return false;
>=20
>          needed =3D DIV_ROUND_UP(skb->len, XEN_PAGE_SIZE);
>          if (skb_is_gso(skb))  <=3D=3D skb points to 0-ed memory
>                  needed++;
>=20
> Has something similar been reported before? Any ideas?

I haven't seen that before, but I think your analysis regarding use
after free is correct. xenvif_rx_ring_slots_available() is now called
from the interrupt handler, too, so it needs to take the queue lock
before peeking at the queue.

Patch is coming.


Juergen

--------------C34BD29822F32F2A0450E7D8
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

--------------C34BD29822F32F2A0450E7D8--

--3ZmydOoyo9936MThrob9EaQIgXO87Ol1j--

--W4r86Cqr1toa4syKIlnsJdTPSQVuZcZ0x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAY+pYFAwAAAAAACgkQsN6d1ii/Ey9h
pAf+JqP0+7sX2n9oC2HnoHZfOjwJ5KxRa0Cl4OeyoArH3Hf8to+kEgJ+YEDmFKNrC7LTY0HlYIDZ
reHokjQ5gcz2CzpCZNWZS0fhQplxSxHaBEez+JrLJUcjS3NZYZBM5MC0OOleVD7WCBHPMyuKC9FJ
PpfPaEj+VJ+pHi+JSGtvw6fDKVLvXuf283LmGDUD/HXPQIJuSlPKxyRu0goGXfK+uMFnm78kj6Rq
xsqceGi67vPa3DPiBiwlGqczrMzRMcZkcM1uYOtdSQGSBfTMSJl35lPm2bKO7Pw21Bg2/VxTDGXi
XTJHgvlUZxVMR2CqHyeCbb2P4CQospPyNO7Dc+EY5g==
=UG/Z
-----END PGP SIGNATURE-----

--W4r86Cqr1toa4syKIlnsJdTPSQVuZcZ0x--

